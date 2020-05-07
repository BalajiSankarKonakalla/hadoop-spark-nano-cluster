sudo /etc/init.d/ssh start
echo 'Y' | hdfs namenode -format
$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh
while true; do        
    sleep 50
done