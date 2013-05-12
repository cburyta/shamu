package 'rtorrent' do
  action :upgrade
end

node['rtorrent']['users'].each_key do |username|

  user username do
    supports :manage_home => true
    home "/home/#{username}"
    shell "/bin/bash"
  end

  %W(.rtorrent .session active_torrent download).each do |dir|
    directory "/home/#{username}/#{dir}" do
      owner username
      group username
      mode 00755
    end
  end

  template "/home/#{username}/.rtorrent.rc" do
    source 'rtorrent.rc.erb'
    mode 0644
    owner username
    group username
    variables({'config' => node['rtorrent']['default'].merge(node['rtorrent']['users'][username])})
  end

end
