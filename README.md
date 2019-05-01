# nginx_AlpineLinux 

Docker container image which automates the installation and basic configuration of nginx and uses curl to check whether the nginx server is working. This container image is based on the official Docker alpine:latest image.

## Breaking down what the container does

a. Fetch from apk repos and check if an update is available;<br />
b. Install nginx and curl;<br />
c. Create a user called www and adds it to the www group;<br />
d. Create a /usr/local/www folder which will server as root folder for nginx;<br />
e. Set www:www recursive permission to /usr/local/www;<br />
f. Copy a basic nginx.conf file to /etc/nginx/nginx.conf;<br />
g. Copy the default nginx index.html page to /usr/local/www;<br />
h. Symlinking /dev/stdout to /var/log/nginx/access.log;<br />
i. Symlinking /dev/stderr to /var/log/nginx/error.log;<br />
l. Initiating the nginx server and  test it is working by running 'curl localhost';<br />
