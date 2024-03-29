#! /bin/sh
### BEGIN INIT INFO
# Provides:          teamspeak
# Required-Start:    networking
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:      S 0 1 6
# Short-Description: TeamSpeak Server Daemon
# Description:       Starts/Stops/Restarts the TeamSpeak Server Daemon
### END INIT INFO

set -e

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
DESC="TeamSpeak Server"
NAME=teamspeak
USER=teamspeak
DIR=/home/teamspeak/teamspeak3-server_linux-amd64
DAEMON=$DIR/ts3server_startscript.sh
#PIDFILE=/var/run/$NAME.pid
SCRIPTNAME=/etc/init.d/$NAME

# Gracefully exit if the package has been removed.
test -x $DAEMON || exit 0

cd $DIR
sudo -u teamspeak ./ts3server_startscript.sh $1

