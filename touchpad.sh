#!/bin/bash
cd
source /etc/os-release
echo "您的系统发行版为：$ID，以下将修复触摸板"
printf %.s- {1..100}
echo

sudo mkdir -p /usr/lib/systemd/system/
sudo cp -p  ${HOME}/pixelbook/configs/pixelbook-touchpad.service /usr/lib/systemd/system/
sudo chmod 0664 /usr/lib/systemd/system/pixelbook-touchpad.service

sudo mkdir -p /etc/X11/xorg.conf.d/
sudo cp -p  ${HOME}/pixelbook/configs/99-pixelbook-touchpad-tweak.conf /etc/X11/xorg.conf.d/
sudo chmod 0664 /etc/X11/xorg.conf.d/99-pixelbook-touchpad-tweak.conf

sudo systemctl enable --now  pixelbook-touchpad.service
sudo systemctl start pixelbook-touchpad
echo "-->修复成功！"
