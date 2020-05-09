FROM datadroits-hadoop-hive-base:1.0
# FROM datadroits-base:1.0

MAINTAINER Balaji Sankar Konakalla <balajisankarkonakalla@gmail.com>

# Add configurations
ADD configs/init-script-master.sh /home/datadroits/init-script.sh
ADD configs/workers $HADOOP_HOME/etc/hadoop/workers

# permissions
RUN sudo chmod 777 /home/datadroits/init-script.sh

# run init-script
ENTRYPOINT /home/datadroits/init-script.sh
