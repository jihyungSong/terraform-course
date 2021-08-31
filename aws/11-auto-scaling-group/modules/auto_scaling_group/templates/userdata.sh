#!/bin/bash

IP_ADDR=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

sudo rm -rf /var/www/html/*
sudo chown -R ubuntu:ubuntu /var/www
sudo chmod 2775 /var/www

sudo echo "<h1>HELLO</h1> <p>(*) SERVER IP : $IP_ADDR</p>" >> /var/www/html/index.html
sudo chown -R root:root /var/www