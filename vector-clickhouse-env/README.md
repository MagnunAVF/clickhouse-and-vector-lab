# Vector Clickhouse Env

Nginx (Openresty) running with a vector client + vector server + clickhouse server + grafana.

## Setup
Run in terminal:
```
docker-compose build
```

## Running in localhost
Run in terminal:
```
docker-compose up
```

### Sample data
After run, you can populate sample data with:
```
python3 sample.py
```

## Access data in grafana
After run, access: http://localhost:3000

### Configuring grafana
login:
```
user: admin
password: admin
```

After login, add a clickhouse data source.
The URL is `http://clickhouse_server:8123`;
