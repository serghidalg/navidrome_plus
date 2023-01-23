#!/bin/bash
for i in $@; do /root/navidrome_plus/scripts/tasks/download_everything.sh $i; done > /root/navidrome_plus/.logs_download
