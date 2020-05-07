docker network create nano-cluster-network
docker run --name nodemaster --hostname nodemaster -dit -p 50:22 -p 50070:50070 -p 8088:8088 --network="nano-cluster-network"  datadroits-master:1.0
docker run --name nodeslave1 --hostname nodeslave1 -dit -p 51:22 -p 50075:50075 --network="nano-cluster-network"  datadroits-slave:1.0
docker run --name nodeslave2 --hostname nodeslave2 -dit -p 52:22 -p 50076:50075 --network="nano-cluster-network"  datadroits-slave:1.0