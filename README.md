# nginx_AlpineLinux 

Docker container image which automates the installation and basic configuration of nginx, and it is based on the official Docker alpine:latest image.

Breaking down the tasks the image does perform.

a. Fetch from apk repos and check if an update is available;
b. Install nginx and curl;
c. Create a user called www and adds it to the www group;
d. Create a /usr/local/www folder which will server as root folder for nginx;
e. Set www:www recursive permission to /usr/local/www;
f. Copy a basic nginx.conf file to /etc/nginx/nginx.conf;
g. Copy the default nginx index.html page to /usr/local/www;
etc
