FROM mysql:5.6

MAINTAINER Balaji Sankar Konakalla <balajisankarkonakalla@gmail.com>

COPY mysql/configs/hive-schema-3.1.0.mysql.sql /hive_schema.sql
COPY mysql/configs/hive_connection_steps.sql /hive_connection_steps.sql
COPY mysql/configs/init-script.sh /init-script.sh
RUN chmod 777 /init-script.sh

ENTRYPOINT /init-script.sh