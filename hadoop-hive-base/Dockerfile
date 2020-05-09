FROM datadroits-base:1.0

MAINTAINER Balaji Sankar Konakalla <balajisankarkonakalla@gmail.com>

# Download hive binary
RUN wget http://apachemirror.wuchna.com/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz -P /home/datadroits/
RUN tar -xzf /home/datadroits/apache-hive-3.1.2-bin.tar.gz -C /home/datadroits/
RUN mv /home/datadroits/apache-hive-3.1.2-bin /home/datadroits/hive
RUN rm /home/datadroits/apache-hive-3.1.2-bin.tar.gz

# Set environment variables
RUN mkdir -p /home/datadroits/hive-libs
ENV HIVE_HOME="/home/datadroits/hive"
ENV HIVE_CONF_DIR="/home/datadroits/hive/conf"
ENV PATH="$HIVE_HOME/bin:$PATH"
RUN export PATH="$HIVE_HOME/bin:$PATH"
COPY configs/hive-default.xml /home/datadroits/hive/conf/
COPY configs/hive-site.xml /home/datadroits/hive/conf/
COPY configs/hive-env.sh /home/datadroits/hive/conf/
COPY bin/mysql-connector-java-5.1.49.jar $HIVE_HOME/lib/ 

# install mysql connector jar
RUN sudo apt-get install libmysql-java -y



