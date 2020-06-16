#!/bin/bash -e

# Stop generating errors for non-interactive shell
echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections

# Perform standard ubuntu updates
echo "Doing updates to system"
sudo apt-get update -q > /dev/null
sudo apt-get upgrade -y -q > /dev/null
sudo apt-get dist-upgrade -y -q > /dev/null
sudo apt-get autoremove -y -q > /dev/null

# Install node
# https://strapi.io/documentation/3.0.0-beta.x/deployment/amazon-aws.html#_3-install-node-js-with-npm
echo "Installing Node"
cd ~
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs
node -v && npm -v

# Setup NPM
# https://strapi.io/documentation/3.0.0-beta.x/deployment/amazon-aws.html#_4-create-and-change-npm-s-default-directory
echo "Setting up NPM default directories"
cd ~
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
sudo echo "export PATH=~/.npm-global/bin:$PATH" >>  ~/.profile
source ~/.profile


