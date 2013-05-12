package 'vsftpd' do
  action :upgrade
end

service "vsftpd" do
  supports :restart => true, :reload => true
  action :enable
  subscribes :reload, resources("cookbook_file[/etc/vsftpd.conf]"), :immediately
  subscribes :reload, resources("cookbook_file[/etc/vsftpd.userlist]"), :immediately
end

%w(vsftpd.userlist vsftpd.conf).each do |f|
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

link "/home/rtorrent/download" do
  to "/home/dl/download"
end

