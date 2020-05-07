FROM datadroits-base:1.0

MAINTAINER Balaji Sankar Konakalla <balajisankarkonakalla@gmail.com>

# Add configurations
ADD configs/init-script-slave.sh /home/datadroits/init-script.sh

# permissions
RUN sudo chmod 777 /home/datadroits/init-script.sh

# run init-script
ENTRYPOINT /home/datadroits/init-script.sh

