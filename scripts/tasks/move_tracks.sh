#!/bin/bash
cd /root/navidrome_plus/media/Music
mv */* .
find . -type d -empty | xargs rmdir
