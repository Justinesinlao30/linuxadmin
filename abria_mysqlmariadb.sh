#!/bin/bash
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

# Automatic type yes after creating mariadb user and pass

Y
just
just
Y
Y
Y
Y
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
echo "CREATE DATABASE wordpress; CREATE USER wp_@localhost IDENTIFIED BY 'just'; GRANT ALL PRIVILEGES ON wordpress.* TO wp_user@localhost IDENTIFIED BY 'just'; 
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
git commit -m "Added abria_mysqlmariadb.sh"

# upload the script to github
git push origin main
