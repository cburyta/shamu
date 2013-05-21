Server Installation using CHEF
==============================

From a fresh Debian 7 install as root :
---------------------------------------

~~~ sh
  apt-get update
  apt-get upgrade
  apt-get install sudo
  useradd -d /home/shamu -s /bin/bash shamu
  usermod -a -G sudo shamu
  mkdir /home/shamu && chown shamu:shamu /home/shamu && passwd shamu
  exit
~~~

as user shamu :
---------------

Install Ruby through RBENV, chef, the cookbooks and run them locally :

~~~ sh
  sudo apt-get install git
  git clone git://github.com/m-ryan/shamu.git ~/install
  ./install.sh

~~~

After provision :
-----------------------
- Set the password for users dl, rtorrent and teamspeak
- Make sure teamspeak is running using "sudo /etc/init.d/teamspeak.sh start"
- Connect to teamspeak using the one time server admin key in logs (/home/teamspeak/teamspeak3-server_linux-amd64/logs)

~~~ sh

  
  
