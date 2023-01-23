#!/bin/bash
LOGFILE=/root/navidrome_plus/.logs_sync
date=`date`
echo "################################################" >> $LOGFILE
echo "#$date" >> $LOGFILE
echo "################################################" >> $LOGFILE

sort /root/navidrome_plus/media/Playlists/list | uniq > /root/navidrome_plus/media/Playlists/list_curated
for i in `cat /root/navidrome_plus/media/Playlists/list_curated`; do /root/navidrome_plus/scripts/tasks/sync_playlist.sh $i; done >> $LOGFILE
cp /root/navidrome_plus/media/Playlists/list_curated /root/navidrome_plus/media/Playlists/list
