#!/bin/bash
free -m
sudo fallocate -l 1G /swapfile1G
sudo chmod 600 /swapfile1G
sudo mkswap /swapfile1G
sudo mkswap /swapfile1G
sudo swapon /swapfile1G
swapon -s
free -m
sudo echo "/swapfile1G       none    swap    sw      0       0" >> /etc/fstab
