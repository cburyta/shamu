package 'tomcat7' do
  action 'upgrade'
end

user 'subsonic' do
  supports :manage_home => true
  home '/home/subsonic'
  shell '/bin/bash'
end

remote_file '/home/subsonic/subsonic.zip' do
  source node[:subsonic][:download_url]
  owner 'subsonic'
  group 'subsonic'
end

package 'unzip' do
  action 'upgrade'
end

execute 'unzip subsonic.zip' do
  cwd '/home/subsonic'
  user 'subsonic'
end