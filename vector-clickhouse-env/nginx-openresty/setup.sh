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
[sources.in]
  include = ["/var/log/nginx/access.log"] # required
  type = "file" # required

[sinks.out]
  address = "vector_server:9000" # required
  inputs = ["in"] # required
  type = "vector" # required
VECTORCFG