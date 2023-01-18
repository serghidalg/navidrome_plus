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
