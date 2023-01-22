#!/bin/bash
echo '##############################################################'
echo "#Initiating ${1} sync"
echo '#############################################################'
cd /root/navidrome_plus/media/Music/
spotdl sync /root/navidrome_plus/media/Music/$1 
echo '#############################################################'
echo '#Update done'
echo '#############################################################'
