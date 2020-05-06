FROM ubuntu:18.04

MAINTAINER Balaji Sankar Konakalla <balajisankarkonakalla@gmail.com>

RUN apt-get -y update && apt-get -y install curl

RUN apt-get -y install sudo

# Create datadroits user
USER root
RUN adduser datadroits
CMD ["su", "-", "datadroits", "-c", "/bin/bash"] 
ADD configs/sudoers.txt /etc/sudoers
RUN chmod 440 /etc/sudoers
USER datadroits

RUN cd ~

RUN ["pwd"]

# Install oracle Java
# RUN sudo apt-get -y install software-properties-common
# RUN sudo add-apt-repository ppa:webupd8team/java && sudo apt-get update \
# # accept oracle license
#   && sudo echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections \
#   && sudo echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections \
#   && sudo apt-get update \
# # install oracle jdk 8 and make it default
#   && sudo apt-get -y install oracle-java8-installer \
#   && sudo apt-get -y install oracle-java8-set-default \
# # clean up
#   && sudo apt-get clean all \
#   && sudo rm -rf /var/lib/apt/lists/*

# Install openJDK
RUN sudo apt-get install -y openjdk-8-jre
RUN sudo apt-get install -y openjdk-8-jdk

# SSH for communication between nodes
RUN sudo apt-get install -y openssh-server
RUN sudo apt-get install openssh-client
EXPOSE 22

# Install editor
RUN sudo apt-get update
RUN sudo apt-get install -y vim

# Set pubkey authentication
RUN echo "PubKeyAuthentication yes" | sudo tee -a /etc/ssh/ssh_config
RUN mkdir -p /home/datadroits/.ssh
RUN echo "PubkeyAcceptedKeyTypes +ssh-dss" | tee -a /home/datadroits/.ssh/config
RUN echo "PasswordAuthentication no" | tee -a /home/datadroits/.ssh/config

# copy keys
ADD configs/master_id_rsa.pub /home/datadroits/.ssh/id_rsa.pub
ADD configs/master_id_rsa /home/datadroits/.ssh/id_rsa
RUN cat /home/datadroits/.ssh/id_rsa.pub >> /home/datadroits/.ssh/authorized_keys
RUN sudo chown datadroits -R /home/datadroits/.ssh

# get hadoop related libraries 
RUN wget https://archive.apache.org/dist/hadoop/core/hadoop-3.2.0/hadoop-3.2.0.tar.gz -P /home/datadroits/
RUN tar -xzf /home/datadroits/hadoop-3.2.0.tar.gz -C /home/datadroits/
RUN mv /home/datadroits/hadoop-3.2.0 /home/datadroits/hadoop
RUN rm -rf /home/datadroits/hadoop-3.2.0*

# set environment variables
ENV JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
ENV HADOOP_HOME="/home/datadroits/hadoop"
ENV HADOOP_CONF_DIR="$HADOOP_HOME/etc/hadoop"
ENV HADOOP_MAPRED_HOME="$HADOOP_HOME" 
ENV HADOOP_COMMON_HOME="$HADOOP_HOME" 
ENV HADOOP_HDFS_HOME="$HADOOP_HOME"
ENV HADOOP_COMMON_LIB_NATIVE_DIR="$HADOOP_HOME/lib/native"
ENV YARN_HOME="$HADOOP_HOME"
ENV PATH="$JAVA_HOME/bin:$PATH"
ENV PATH="$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH"

# set hadoop-env.sh
RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> /home/datadroits/hadoop/etc/hadoop/hadoop-env.sh
RUN echo "export HADOOP_HOME=/home/datadroits/hadoop" >> /home/datadroits/hadoop/etc/hadoop/hadoop-env.sh
RUN echo "export HADOOP_CONF_DIR=/home/datadroits/hadoop/etc/hadoop" >> /home/datadroits/hadoop/etc/hadoop/hadoop-env.sh
RUN echo "export HDFS_NAMENODE_USER=datadroits" >> /home/datadroits/hadoop/etc/hadoop/hadoop-env.sh
RUN echo "export HDFS_DATANODE_USER=datadroits" >> /home/datadroits/hadoop/etc/hadoop/hadoop-env.sh
RUN echo "export HDFS_SECONDARYNAMENODE_USER=datadroits" >> /home/datadroits/hadoop/etc/hadoop/hadoop-env.sh

# create folders for nodes
RUN mkdir -p /home/datadroits/data/nameNode /home/datadroits/data/dataNode /home/datadroits/data/nameNodeSecondary /home/datadroits/data/tmp
RUN mkdir -p /home/datadroits/hadoop/logs
ADD configs/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml
ADD configs/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml
ADD configs/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml
ADD configs/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml
ADD configs/init-script-master.sh /home/datadroits/init-script.sh
# ADD configs/workers $HADOOP_HOME/etc/hadoop/workers

# permissions
RUN sudo chown datadroits -R /home/datadroits/data
RUN sudo chown datadroits -R /home/datadroits/hadoop
RUN sudo chmod 777 /home/datadroits/init-script.sh

# run init-script
ENTRYPOINT /home/datadroits/init-script.sh
	
