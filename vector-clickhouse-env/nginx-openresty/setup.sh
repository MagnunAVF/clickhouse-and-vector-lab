#!/bin/bash

# prerequisites
yum install -y sudo curl

mkdir -p /var/log/nginx
# sudo ln -sf /dev/stderr /var/log/nginx/error.log
# sudo ln -sf /dev/stdout /var/log/nginx/access.log

# Setup vector
curl -O https://packages.timber.io/vector/0.10.X/vector-x86_64.rpm

sudo rpm -i vector-x86_64.rpm

# Config vector
cat <<-VECTORCFG > vector.toml
[sources.nginx_access_log]
  type = "file" # required
  ignore_older = 86400 # optional, no default, seconds
  include = ["/var/log/nginx/access.log"] # required
  start_at_beginning = false # optional, default

[sinks.vector_server]
  type = "vector" # required
  address = "vector_server:9000" # required
  inputs = ["nginx_access_log"] # required
  healthcheck = true # optional, default
VECTORCFG