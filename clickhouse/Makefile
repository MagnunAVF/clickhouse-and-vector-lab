.PHONY : help
help:
	@ echo "### Makefile for ClickHouse: ###"
	@ echo '   run-server            Run ClickHouse server container in background.'
	@ echo '   run-client            Run ClickHouse client.'
	@ echo '   stop-server           Stop running server.'
	@ echo '   get-sample-data       Download sample data.'
	@ echo '   import-sample-data    Import sample data to Database.'

.PHONY : run-server
run-server:
	@ echo "Running ClickHouse server container in background ..."
	@ docker run -d --name clickhouse-server -v "${PWD}/dataset_example:/tmp/dataset_example" -v "${PWD}/init.sh:/docker-entrypoint-initdb.d/init.sh" --ulimit nofile=262144:262144 yandex/clickhouse-server

.PHONY : run-client
run-client:
	@ echo "Running ClickHouse client container ..."
	@ docker run -it --rm --link clickhouse-server:clickhouse-server yandex/clickhouse-client --host clickhouse-server

.PHONY : stop-server
stop-server:
	@ echo "Stopping ClickHouse server container running in background ..."
	@ docker stop clickhouse-server
	@ docker container rm clickhouse-server

.PHONY : get-sample-data
get-sample-data:
	@ echo 'Getting sample data ...'
	@ curl -o dataset_example/hits_v1.tsv.xz https://clickhouse-datasets.s3.yandex.net/hits/tsv/hits_v1.tsv.xz
	@ curl -o dataset_example/visits_v1.tsv.xz https://clickhouse-datasets.s3.yandex.net/visits/tsv/visits_v1.tsv.xz
	@ echo "Done !"

.PHONY : import-sample-data
import-sample-data:
	@ echo 'Importing sample data to database ...'
	@ docker exec -it clickhouse-server /tmp/dataset_example/data_import.sh
	@ echo "Done !"