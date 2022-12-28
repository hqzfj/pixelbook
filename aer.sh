#!/bin/bash
cd
source /etc/os-release
echo "您的系统发行版为：$ID，以下将修复ARE日志"
printf %.s- {1..100}
echo

sudo mkdir -p /usr/lib/systemd/system/
sudo cp -p  ${HOME}/pixelbook/configs/pixelbook-aer.service /usr/lib/systemd/system/
sudo chmod 0664 /usr/lib/systemd/system/pixelbook-aer.service

sudo systemctl enable --now  pixelbook-aer.service
sudo systemctl start pixelbook-aer
echo "-->修复成功！"
