git clone https://github.com/digininja/DVWA.git /var/www/html/DVWA
cp /var/www/html/config.inc.php /var/www/html/DVWA/config/config.inc.php
HOST_DOMAIN="host.docker.internal"
 ping -q -c1 $HOST_DOMAIN > /dev/null 2>&1
