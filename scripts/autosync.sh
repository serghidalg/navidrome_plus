#!/bin/bash
sort /root/navidrome_plus/media/Playlists/list | uniq > /root/navidrome_plus/media/Playlists/list_curated
for i in `cat /root/navidrome_plus/media/Playlists/list_curated`; do /root/navidrome_plus/scripts/tasks/sync_playlist.sh $i; done
cp /root/navidrome_plus/media/Playlists/list /root/navidrome_plus/media/Playlists/list_curated
