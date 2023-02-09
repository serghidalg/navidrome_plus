#!/bin/bash
echo "Mete nombre de la playlist"
read -r name
sync_file="`echo $name | tr ' ' '_'`.sync.spotdl"
echo "Mete el url de la playlist"
read url
echo "Cambia diariamente? (y/n)"
read daily

if [[ $daily != y ]];then
cd /root/navidrome_plus/media/Music/
spotdl sync $url --m3u "${name}" --save-file $sync_file
echo "$sync_file" >> /root/navidrome_plus/media/Playlists/list

else
name_="`echo $name | tr ' ' '_'`"
mkdir -p /root/navidrome_plus/media/Music/$name_
cd /root/navidrome_plus/media/Music/$name_
spotdl sync $url --m3u "${name}" --save-file $sync_file
echo "$name_/$sync_file" >> /root/navidrome_plus/media/Playlists/list
fi

