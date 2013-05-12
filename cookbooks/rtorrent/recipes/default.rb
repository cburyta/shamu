package 'rtorrent' do
  action :upgrade
end

node['rtorrent']['users'].each do |username|

  user username

  %W(.rtorrent .session active_torrent download).each do |dir|
    directory "/home/#{username}/#{dir}" do
      owner username
      group username
      mode 00644
    end
  end

  template "/home/#{username}/.rtorrent.rc" do
    source 'rtorrent.rc.erb'
    mode 0440
    owner username
    group username
    variables({'config' => node['rtorrent']['default'].merge(node['rtorrent']['users'][username])})
  end

end
