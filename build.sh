# with hive
docker build -t datadroits-base:1.0 -f hadoop-base/Dockerfile .
docker build -t datadroits-hadoop-hive-base:1.0 -f hadoop-hive-base/Dockerfile .

docker build -t datadroits-mysql:1.0 -f mysql/Dockerfile .

docker build -t datadroits-master:1.0 -f master-node/Dockerfile .
docker build -t datadroits-slave:1.0 -f slave-node/Dockerfile .
