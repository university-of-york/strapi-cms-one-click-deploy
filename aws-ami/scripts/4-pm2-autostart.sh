#!/bin/bash -e

# Setup PM2 to auto start
# https://strapi.io/documentation/3.0.0-beta.x/deployment/amazon-aws.html#_7-configure-pm2-runtime-to-launch-project-on-system-startup
cd ~
pm2 startup systemd
sudo env PATH=$PATH:/usr/bin /home/ubuntu/.npm-global/lib/node_modules/pm2/bin/pm2 startup systemd -u ubuntu --hp /home/ubuntu
pm2 save
