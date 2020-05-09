sudo /etc/init.d/ssh start
echo 'Y' | hdfs namenode -format
sleep 10
$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh
sleep 10
hdfs dfs -mkdir -p /user/
hdfs dfs -mkdir -p /user/hive
hdfs dfs -mkdir -p /user/hive/warehouse
hdfs dfs -mkdir -p /tmp
hdfs dfs -chmod -R a+rwx /user/hive/warehouse
hdfs dfs -chmod g+w /tmp
sudo chmod 777 /
$HIVE_HOME/bin/hive –service hiveserver2
while true; do
    sleep 50
done