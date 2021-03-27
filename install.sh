#!/bin/bash

sudo apt-get update

# ↓ Enable auto-update
# ↓ 	see https://raspberrypi.stackexchange.com/a/38990
sudo apt-get install -y unattended-upgrades

# ↓ BreeeZe/rpos
sudo apt-get install -y git
sudo apt-get install -y npm
sudo apt-get install -y liblivemedia-dev
sudo modprobe bcm2835-v4l2

sudo apt-get install -y jq

# ↓ Restart Ras Pi
sudo reboot
