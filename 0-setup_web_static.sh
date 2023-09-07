#!/usr/bin/env bash
#Bash script that sets up your web servers
#for the deployment of web_static

if ! command -v nginx &>/dev/null; then
        sudo apt-get update
        sudo apt-get install nginx

fi

mkdir -p /data/web_static/releases/test/
mkdir -p /data/web_static/shared/

#html content to test nginx configuration
html_content="<!DOCTYPE html>
<html>
<head>
<title>Hello World</title>
</head>
<body>
<h1>Hello, World!</h1>
</body>
</html>"
echo "$html_content" > /data/web_static/releases/test/index.html

# Create the new symbolic link
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current
#change ownership to the ubuntu user
sudo chown -R ubuntu:ubuntu /data/

sudo sed -i '/listen 80 default_server/a location /hbnb_static { alias /data/web_static/current/;}' /etc/nginx/sites-enabled/default
sudo nginx -t
sudo service nginx restart
