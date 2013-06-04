package 'ffmpeg' do
  action :upgrade
end

remote_file '/home/subsonic/exporter.war' do
  action :create_if_missing
  source node['exporter']['download_url']
  owner 'subsonic'
  group 'subsonic'
  mode 0644
end

execute 'git clone git://github.com/m-ryan/groove-dl.git groovedl' do
  cwd '/home/subsonic'
  user 'subsonic'
  not_if 'test -d /home/subsonic/groovedl'
end

execute 'git clone git://github.com/m-ryan/groove-dl.git youtubedl' do
  cwd '/home/subsonic'
  user 'subsonic'
  not_if 'test -d /home/subsonic/youtubedl'
end

directory '/var/streaming-media-exporter' do
  owner 'tomcat6'
  group 'tomcat6'
  mode 00755
end

template '/var/streaming-media-exporter/conf.properties' do
  source 'exporter.erb'
  mode 0644
  owner 'tomcat6'
  group 'tomcat6'
end

link '/var/lib/tomcat6/webapps/exporter.war' do
  to '/home/subsonic/exporter.war'
end

