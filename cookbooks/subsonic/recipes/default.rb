package 'tomcat6' do
  action :upgrade
end

user 'subsonic' do
  supports :manage_home => true
  home '/home/subsonic'
  shell '/bin/bash'
end

remote_file '/home/subsonic/subsonic.zip' do
  action :create_if_missing
  source node['subsonic']['download_url']
  owner 'subsonic'
  group 'subsonic'
end

package 'unzip' do
  action :upgrade
end

execute 'unzip -o subsonic.zip' do
  cwd '/home/subsonic'
  user 'subsonic'
end

directory '/var/subsonic' do
  owner 'tomcat6'
  group 'tomcat6'
  mode 00755
end

link '/var/lib/tomcat6/webapps/subsonic.war' do
  to '/home/subsonic/subsonic.war'
end