#!/bin/bash

##########################
#System preparation
##########################
apt update && apt upgrade -y
apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get -y install docker-ce docker-ce-cli containerd.io
##########################
#Navidrome and Podgrab
##########################

#deploy docker-compose.yml
docker compose up -d

##########################
#Spotdl
##########################
#install python and spotdl
apt install python3
apt intall python3-pip
pip3 install spotdl
spotdl --download-ffmpeg
#link config file
ln /root/.spotdl/config.json .config/spotdl/config.json
#add web downloads to media
rm -r /root/.spotdl/web/sessions
ln -s ./media/Music/ /root/.spotdl/web/sessions
#add spotdl to systemctl
ln .config/spotdl/spotdl.service /etc/systemd/system/spotdl.service
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
