#!/bin/bash

sudo apt-get install build-essential curl libssl-dev libreadline-dev zlib1g zlib1g-dev libmysqlclient-dev libcurl4-openssl-dev libxslt-dev libxml2-dev
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
echo 'eval "$(rbenv init -)"' >> ~/.profile
source ~/.profile
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone git://github.com/dcarley/rbenv-sudo.git ~/.rbenv/plugins/rbenv-sudo
yes n | rbenv install 1.9.3-p392
rbenv global 1.9.3-p392
rbenv rehash
cd ~/install
gem install bundler --no-ri --no-rdoc
rbenv rehash
bundle install
rbenv rehash
berks install --path vendor/cookbooks
./provision.sh

