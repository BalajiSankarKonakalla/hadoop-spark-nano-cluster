/etc/init.d/mysql start
sleep 30
mysql -uroot -e "SOURCE /hive_connection_steps.sql;"

while true; do        
    sleep 50
done