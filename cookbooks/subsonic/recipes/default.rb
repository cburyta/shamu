package 'tomcat7' do
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