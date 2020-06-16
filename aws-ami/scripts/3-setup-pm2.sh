#!/bin/bash -e

# Install PM2
# https://strapi.io/documentation/3.0.0-beta.x/deployment/amazon-aws.html#_6-install-pm2-runtime
echo "Setting up PM2"
sudo npm install pm2@latest -g

cd ~
pm2 init

sudo echo "module.exports = {
  apps: [
    {
      name: 'esg-strapi-cms',
      cwd: '/home/ubuntu/esg-app-cms',
      script: 'npm',
      args: 'start',
      env: {
        NODE_ENV: 'production',
        DATABASE_USERNAME:'dbwriter',
        DATABASE_PASSWORD:'',
        DATABASE_HOST:'',
        DATABASE_NAME:'strapi',
      },
    },
  ],
};" >> ecosystem.config.js

cd ~
pm2 start ecosystem.config.js
