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