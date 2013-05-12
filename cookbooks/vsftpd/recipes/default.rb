package 'vsftpd' do
  action :upgrade
end

vsftp_config_files = %w(vsftpd.user_list vsftpd.conf)

vsftp_config_files.each do |f|
  cookbook_file "/etc/#{f}" do
    source f
    mode 0755
    owner "root"
    group "root"
  end
end

user "dl" do
  supports :manage_home => true
  home "/home/dl"
  shell "/bin/false"
end

link "/home/dl/download" do
  to "/home/rtorrent/download"
end

service "vsftpd" do
  supports :restart => true, :reload => true
  action :enable
  vsftp_config_files.each do |f|
    subscribes :reload, resources("cookbook_file[/etc/#{f}]"), :immediately
  end
end
