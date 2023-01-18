#!/bin/bash

##########################
#Navidrome and Podgrab
##########################

#deploy docker-compose.yml
compose up -d

##########################
#Spotdl
##########################
#install python and spotdl
apt install python3
apt intall python3-pip
pip3 install spotdl
spotdl --download-ffmpeg
#link config file
ln /root/.spotdl/config.json /root/navidrome_plus/spotdl/config.json
#add web downloads to media
rm -r /root/.spotdl/web/sessions
ln -s /root/navidrome_plus/media/Music/ /root/.spotdl/web/sessions
#add spotdl to systemctl
ln /root/navidrome_plus/spotdl/spotdl.service /etc/systemd/system/spotdl.service
systemctl daemon-reload
systemctl enable spotdl.service
systemctl start spotdl.service

echo "#############################"
echo "#Relevant info!"
echo "#############################"
echo "Listen to music on :1111"
echo "Listen to podcasts on :1112"
echo "Add new music on :1113"
echo "Add new podcasts on :1114"
echo "#############################"
echo "#Enjoy your server!!"
echo "#############################"
