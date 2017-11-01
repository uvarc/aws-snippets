#!/bin/bash

apt-get -y update
apt-get -y install apache2 php56 mysql55-server php56-mysqlnd
service httpd start

chkconfig apache2 on
groupadd www
usermod -a -G www ec2-user
chown -R root:www /var/www
chmod 2775 /var/www

find /var/www -type d -exec chmod 2775 {} +
find /var/www -type f -exec chmod 0664 {} +

echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
