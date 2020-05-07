sudo /etc/init.d/ssh start
$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh
echo 'Y' | hdfs namenode -format
while true; do        
    sleep 50
done