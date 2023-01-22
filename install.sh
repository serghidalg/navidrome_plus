#!/bin/bash

##########################
#System preparation
##########################
#apt update && apt upgrade -y
#apt install -y apt-transport-https ca-certificates curl gnupg lsb-release
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --yes --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
#echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
#apt-get update
#apt-get -y install docker-ce docker-ce-cli containerd.io

##########################
#Navidrome and Podgrab
##########################

#deploy docker-compose.yml
docker compose up -d

##########################
#Spotdl
##########################
#install python and spotdl
apt install -y python3
apt install -y python3-pip
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


(crontab -l; echo "05 3 * * 1-7 bash /root/navidrome_plus/scripts/autosync.sh > /root/navidrome_plus/.logs";) | crontab -

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
