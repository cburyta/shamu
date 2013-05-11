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

Install Ruby through RBENV : 

~~~ sh
  sudo apt-get install git curl libssl-dev libreadline-dev zlib1g zlib1g-dev libmysqlclient-dev libcurl4-openssl-dev libxslt-dev libxml2-dev
  git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
  echo 'eval "$(rbenv init -)"' >> ~/.profile
  exec $SHELL -l
  git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  rbenv install 2.0.0-p0
~~~

  
  
