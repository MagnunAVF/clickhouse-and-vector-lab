#!/bin/bash

# Create logs
clickhouse-client --query "CREATE TABLE default.nginx_metrics (host String, http_user_agent String, remote_addr String, request_method String, request_uri String, status Int32, timestamp DateTime, Date Date DEFAULT toDate(timestamp)) ENGINE = MergeTree(Date, (status, Date), 8192)"