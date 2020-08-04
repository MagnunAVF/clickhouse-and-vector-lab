#!/bin/bash

# Import Hits
unxz --threads=`nproc` /tmp/dataset_example/hits_v1.tsv.xz > hits_v1.tsv
# import data
cat /tmp/dataset_example/hits_v1.tsv | clickhouse-client --query "INSERT INTO datasets.hits_v1 FORMAT TSV" --max_insert_block_size=100000
# optionally you can optimize table
clickhouse-client --query "OPTIMIZE TABLE datasets.hits_v1 FINAL"

# Import Visits
unxz --threads=`nproc` /tmp/dataset_example/visits_v1.tsv.xz > visits_v1.tsv
# import data
cat /tmp/dataset_example/visits_v1.tsv | clickhouse-client --query "INSERT INTO datasets.visits_v1 FORMAT TSV" --max_insert_block_size=100000
# optionally you can optimize table
clickhouse-client --query "OPTIMIZE TABLE datasets.visits_v1 FINAL"
