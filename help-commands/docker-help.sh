# ssh into docker
docker exec -it container-id/container-name /bin/bash

# delete docker container
docker kill nodeslave1 nodeslave2 nodemaster nodemysql
docker rm nodeslave1 nodeslave2 nodemaster nodemysql

# clear logs hive
hive -hiveconf hive.root.logger=DEBUG,console