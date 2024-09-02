#!/bin/bash
cd
source /etc/os-release
echo "您的系统发行版为：$ID，先运行修复热键再运行本项，以下将修复触屏及转屏"
printf %.s- {1..100}
echo

sudo mkdir -p /usr/libexec/
sudo mkdir -p /usr/lib/systemd/system/

sudo cp -p  ${HOME}/pixelbook/scripts/pixelbook-touchscreen-click /usr/libexec/
sudo chmod 0755 /usr/libexec/pixelbook-touchscreen-click

sudo cp -p  ${HOME}/pixelbook/scripts/pixelbook-display-orientation /usr/libexec/
sudo chmod 0755 /usr/libexec/pixelbook-display-orientation

sudo cp -p  ${HOME}/pixelbook/configs/pixelbook-display-orientation.service /usr/lib/systemd/system/
sudo chmod 0664 /usr/lib/systemd/system/pixelbook-display-orientation.service

sudo cp -p  ${HOME}/pixelbook/configs/pixelbook-touchscreen-click.service /usr/lib/systemd/system/
sudo chmod 0664 /usr/lib/systemd/system/pixelbook-touchscreen-click.service

sudo systemctl enable --now  pixelbook-display-orientation.service
sudo systemctl start pixelbook-display-orientation.service

sudo systemctl enable --now  pixelbook-touchscreen-click.service
sudo systemctl start pixelbook-touchscreen-click.service

#pixelbook-acpi,pixelbook-acpi.service
sudo cp -p  ${HOME}/pixelbook/configs/pixelbook-acpi.service /usr/lib/systemd/system/
sudo chmod 0664 /usr/lib/systemd/system/pixelbook-acpi.service
sudo cp -p  ${HOME}/pixelbook/scripts/pixelbook-acpi /usr/libexec/
sudo chmod 0775 /usr/libexec/pixelbook-acpi
sudo systemctl enable --now pixelbook-acpi.service
sudo systemctl start pixelbook-acpi
sudo systemctl --now enable acpid
sudo usermod -aG input $USER
sudo usermod -aG tty $USER
echo "-->修复成功！"
