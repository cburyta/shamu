Server Installation using CHEF
==============================

From a fresh Debian 7 install as root :
---------------------------------------

~~~ sh
  apt-get update
  apt-get upgrade
  apt-get install sudo
  useradd shamu
  usermod -a -G sudo shamu
  exit
~~~

as user shamu :
---------------

Install Ruby through RBENV, chef, the cookbooks and run them locally :

~~~ sh
  sudo apt-get install git curl libssl-dev libreadline-dev zlib1g zlib1g-dev libmysqlclient-dev libcurl4-openssl-dev libxslt-dev libxml2-dev
  git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
  echo 'eval "$(rbenv init -)"' >> ~/.profile
  exec $SHELL -l
  git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  git clone git://github.com/dcarley/rbenv-sudo.git ~/.rbenv/plugins/rbenv-sudo
  rbenv install 1.9.3-p392
  rbenv rehash
  git clone git://github.com/m-ryan/shamu.git ~/install
  cd ~/install
  gem install bundler --no-ri --no-rdoc
  rbenv rehash
  bundle install
  rbenv rehash
  berks install --path vendor/cookbooks
  ./provision.sh
~~~

Password and SSH keys :
-----------------------

~~~ sh

  
  
