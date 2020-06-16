#!/bin/bash -e

# Clone from GitHub
# https://strapi.io/documentation/3.0.0-beta.x/deployment/amazon-aws.html#_5-deploy-from-github
echo "Cloning project from GitHub"
cd ~
git clone git@github.com:university-of-york/esg-app-cms.git
cd esg-app-cms
npm install
NODE_ENV=production npm run build
