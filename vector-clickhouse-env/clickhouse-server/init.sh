#!/bin/bash

# Create logs
clickhouse-client --query "CREATE TABLE default.nginx_metrics (RemoteAddr String, TimeIso DateTime, Date Date DEFAULT toDate(TimeIso), RequestMethod String, RequestUri String, Status Int32, HttpUserAgent String) ENGINE = MergeTree(Date, (Status, Date), 8192)"