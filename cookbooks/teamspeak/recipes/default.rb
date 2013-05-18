user 'teamspeak' do
  supports :manage_home => true
  home '/home/teamspeak'
  shell '/bin/bash'
end

remote_file '/home/teamspeak/teamspeak.tar.gz' do
  source node[:teamspeak][:download_url]
  owner 'teamspeak'
  group 'teamspeak'
end

execute 'tar xzf teamspeak.tar.gz' do
  cwd '/home/teamspeak'
  user 'teamspeak'
  not_if 'test -d /etc/init.d/teamspeak.sh'
end

cookbook_file '/etc/init.d/teamspeak.sh' do
  source 'teamspeak.sh'
end

execute '/etc/init.d/teamspeak.sh start' do
  not_if 'ps -eaf | grep ts3server_linux_amd64 | grep -v grep'
end



