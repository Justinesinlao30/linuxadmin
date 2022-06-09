#!/bin/bash
# install httpd service
echo "Installing HTTPD"
yum install -y httpd

# start httpd service
echo "Starting HTTPD"
systemctl start httpd.service

# add firewalls rules
echo "Adding Firewalls Rules"
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --permanent --add-port=443/tcp
firewall-cmd --reload

# enable httpd service
echo "Enabling a HTTPD"
systemctl enable httpd

# restart httpd service
echo "Restarting httpd service"
systemctl restart httpd

# add all changes to the git server
git add -A

# commit changes added to the git and add a message
git commit -m "added abria_apachewebpage.sh"

# upload the script to github
git push origin main

# start php apache using mysql
echo "Starting PHP Apache"
systemctl restart httpd.service

# install php fpm
echo "Installing PHP FPM"
yum install -y php-fpm

# go to var www html and php phpinfo 
cd /var/www/html/
echo '<? php phpinfo(); ?>' > index.php

# add all changes to the git server
git add -A

# commit changes added to the git and add a message
git commit -m "added abria_phpapache_phpfpm.sh"

# upload the script to github
git push origin main

# install rsync
echo "Installing Rsync"
yum install -y rsync

# install MariaDB service
echo "Installing mariadb"
yum install -y mariadb-server mariadb

# enable mariadb service
echo "enable mariadb"
systemctl enable mariadb

# run lamp stack + wordpress using simple security script
echo "Running simple security script"
mysql_secure_installation <<EOF

# automatic type yes after creating mariadb user and pass
echo "Enter Yes"
Y

# password
echo "Enter my password"
just

# confirm password
echo "Confirm my password"
just

# yes or no
echo "Enter yes"
Y

# yes or no
echo "Enter yes"
Y
# yes or no
echo "Enter yes"
Y

# yes or no
echo "Enter yes"
Y

#EOF
echo "EOF operator"
EOF

# enable mariadb password and dbname
echo "mariadb enable"
#variables
passw=just
dbname=wordpress

# verifying installation using mysqladmin and ppassw version
echo "Verifying installation"
mysqladmin -u root -p$passw version

# creating database user and pass using a wordpress
echo "CREATE DATABASE wordpress; CREATE USER wp_user@localhost IDENTIFIED BY 'just'; GRANT ALL PRIVILEGES ON wordpress.* TO wp_user@localhost IDENTIFIED BY 'just'; 
FLUSH PRIVILEGES;" | mysql -u root -p$passw

# install wordpress php gd
echo "Installing wordpress"
yum install -y php-gd

# restart Apache httpd service 
echo "Restarting Apache"
service httpd restart

# install a wget 
echo "installing wget"
yum install -y wget

# install a tar
echo "installing tar"
yum instal -y tar

# go to file opt and wget using wordpress latest tar gz
cd /opt/
wget http://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz

# add all changes to the git server
git add -A

# commit changes added to the git and add a message
git commit -m "added abria_mysqlmariadb.sh"

# upload the script to github
git push origin main

# install a http rpms remirepo and remi release-7
echo "Installing HTTP"
yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm

# install a yum utils
echo "Installing Yum Utils"
yum install -y yum-utils

# update yum config manager and enable remi php56
echo "Updating Config Manager & Enable Remi PHP56" 
yum-config-manager --enable remi-php56

# update a PHP
echo "Updating php"
yum install -y php php-mysql

# install a PHP 
echo "Installing PHP"
yum install -y php php-mcrypt php-cli php-gd php-curl php-ldap php-zip php-fileinfo

# to check rsync avp wordpress to web server
rsync -avP wordpress/ /var/www/html/
mkdir /var/www/html/wp-content/uploads
chown -R apache:apache /var/www/html/*
cd /var/www/html
cp wp-config-sample.php wp-config.php

# restart httpd service
echo "Restarting HTTPD SERVICE"
systemctl restart httpd.service

# add all changes to the git server
git add -A

# commit changes added to the git and add a message
git commit -m "added abria_assignement81.sh"

# upload the script to github
git push origin main
