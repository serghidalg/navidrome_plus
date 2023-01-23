#!/bin/bash
LOGFILE=/root/navidrome_plus/.logs_download
date=`date`
echo "################################################" >> $LOGFILE
echo "#$date" >> $LOGFILE
echo "################################################" >> $LOGFILE
for i in $@; do /root/navidrome_plus/scripts/tasks/download_everything.sh $i; done >> $LOGFILE
