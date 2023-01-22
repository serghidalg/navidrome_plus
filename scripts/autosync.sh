#!/bin/bash
for i in `cat /root/navidrome_plus/media/Playlists/list`; do /root/navidrome_plus/scripts/tasks/sync_playlist.sh $i; done
