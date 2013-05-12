package 'vsftpd' do
  action :upgrade
end

# remove the check of shell validity
# we want the user to access only with FTP being chrooted
# but not be able to connect with ssh
execute "sed -e '/pam_shells/d' /etc/pam.d/vsftpd > /tmp/pam_vsftpd" do
  only_if 'grep pam_shells /etc/pam.d/vsftpd'
end
execute 'mv /tmp/pam_vsftpd /etc/pam.d/vsftpd' do
  only_if 'grep pam_shells /etc/pam.d/vsftpd'
end

user 'dl' do
  supports :manage_home => true
  home '/home/dl'
  shell '/bin/false'
end

directory '/home/dl' do
  mode 00555
end

directory '/home/dl/download' do
  owner 'rtorrent'
  group 'rtorrent'
  mode 00755
end

# mount has to be used instead of symlink because of the way users are chrooted
mount '/home/dl/download' do
  device '/home/rtorrent/download'
  fstype 'none'
  options 'bind,r'
  action [:mount, :enable]
  # Do not execute if its already mounted
  not_if 'cat /proc/mounts | grep /home/dl/download'
end

vsftp_config_files = %w(vsftpd.user_list vsftpd.conf)

vsftp_config_files.each do |f|
  cookbook_file "/etc/#{f}" do
    source f
    mode 0755
    owner 'root'
    group 'root'
  end
end

service 'vsftpd' do
  supports :restart => true, :reload => true
  action :enable
  vsftp_config_files.each do |f|
    subscribes :reload, resources("cookbook_file[/etc/#{f}]"), :immediately
  end
end
