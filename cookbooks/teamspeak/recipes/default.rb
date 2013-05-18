user 'teamspeak' do
  supports :manage_home => true
  home "/home/teamspeak"
  shell '/bin/bash'
end

remote_file "/home/teamspeak/teamspeak.tar.gz" do
  source node[:teamspeak][:server_url]
end

execute "tar xzf teamspeak.tar.gz" do
  cwd "/home/teamspeak"
  user "teampseak"
end



