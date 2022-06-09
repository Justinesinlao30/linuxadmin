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
git commit -m "Added abria_apachewebpage.sh"

# upload the script to github
git push origin main
