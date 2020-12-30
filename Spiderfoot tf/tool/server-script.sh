#!/bin/bash
sudo apt update -y
sudo wget https://github.com/smicallef/spiderfoot/archive/v3.2.1.tar.gz
sudo tar zxvf v3.2.1.tar.gz
cd spiderfoot-3.2.1
sudo bash -c 'echo "ficocsc:ficocsc" > passwd'
sudo ./generate-certificate
sudo apt install python3-pip -y
sudo -H pip3 install --upgrade pip
sudo pip3 install -r requirements.txt
sudo bash -c 'echo "@reboot sudo python3 /spiderfoot-3.2.1/sf.py -l 0.0.0.0:443" >> /etc/crontab'
sudo python3 ./sf.py -l 0.0.0.0:443