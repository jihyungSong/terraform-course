#!/bin/bash

IP_ADDR=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

sudo echo "<p>SERVER IP : $IP_ADDR</p>" >> /data/html/index.html
