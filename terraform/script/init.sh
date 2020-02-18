#!/bin/bash

sudo yum update -y
sudo yum install -y docker
sudo service docker start
sudo docker run -d --name httpd --restart always -p 80:80 httpd
