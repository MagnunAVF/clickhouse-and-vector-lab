# ClickHouse Tutorial

Example of single node server with initial data.

## References
* https://clickhouse.tech/docs/en/getting-started/tutorial/
* https://clickhouse.tech/docs/en/getting-started/example-datasets/metrica/

## Setup an Run
First, Run the server:
```
make run-server
```
Then, download sample data:
```
make get-sample-data
```
Finally, import data to database:
```
make import-sample-data
```

### Stop
To stop server, use:
```
make stop-server
```

## Client
To run ClickHouse client use:
```
make run-client
```

To check loaded data run:
```
SELECT COUNT(*) FROM datasets.hits_v1
SELECT COUNT(*) FROM datasets.visits_v1
```

## Query Examples
```
SELECT
    StartURL AS URL,
    AVG(Duration) AS AvgDuration
FROM datasets.visits_v1
WHERE StartDate BETWEEN '2014-03-23' AND '2014-03-30'
GROUP BY URL
ORDER BY AvgDuration DESC
LIMIT 10
```

```
SELECT
    sum(Sign) AS visits,
    sumIf(Sign, has(Goals.ID, 1105530)) AS goal_visits,
    (100. * goal_visits) / visits AS goal_percent
FROM datasets.visits_v1
WHERE (CounterID = 912887) AND (toYYYYMM(StartDate) = 201403) AND (domain(StartURL) = 'yandex.ru')
```