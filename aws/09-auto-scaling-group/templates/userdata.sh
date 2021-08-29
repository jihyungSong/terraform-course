#!/bin/bash

IP_ADDR=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
sudo usermod -a -G apache ec2-user
sudo chown -R ec2-user:apache /var/www
sudo chmod 2775 /var/www
echo "<h1>HELLO</h1> <p>SERVER IP : $IP_ADDR</p>" >> /var/www/html/index.html
