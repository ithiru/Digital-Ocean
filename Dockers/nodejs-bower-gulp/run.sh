#!/bin/bash
echo fs.inotify.max_user_watches=100000 | sudo tee -a /etc/sysctl.conf; sudo sysctl -p
ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
npm install && bower --allow-root --config.interactive=false install && gulp
