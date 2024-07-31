#!/bin/bash
cd
source /etc/os-release
echo "您的系统发行版为：$ID，以下将修复键盘功能键热键映射，并将启动器键改为capslock键切换大小写，谷歌助理键改为启动器键"
printf %.s- {1..100}
echo

sudo mkdir -p /usr/lib/udev/rules.d/
sudo mkdir -p /usr/lib/udev/hwdb.d/
sudo cp -p  ${HOME}/pixelbook/configs/99-pixelbook-backlights.rules /usr/lib/udev/rules.d/
sudo chmod 0775 /usr/lib/udev/rules.d/99-pixelbook-backlights.rules

sudo cp -p  ${HOME}/pixelbook/configs/61-eve-sensor.hwdb /usr/lib/udev/hwdb.d/
sudo chmod 0664 /usr/lib/udev/hwdb.d/61-eve-sensor.hwdb

sudo cp -p  ${HOME}/pixelbook/configs/61-eve-keyboard.hwdb /usr/lib/udev/hwdb.d/
sudo chmod 0664 /usr/lib/udev/hwdb.d/61-eve-keyboard.hwdb

sudo systemd-hwdb update
sudo udevadm control --reload-rules
sudo udevadm trigger


#echo "安装dracut"
#if [ $ID = "manjaro" ] || [ $ID = "Manjaro" ] || [ $ID = "archlinux" ] || [ $ID = "arch linux" ]; then
#sudo pacman -S dracut -y
#else
#sudo apt-get -y install dracut
#fi

echo "options i915 enable_dpcd_backlight=1" >i915.conf
sudo cp -p  ${HOME}/i915.conf /etc/modprobe.d/
sudo chmod 0775 /etc/modprobe.d/i915.conf
sudo dracut -f
sudo rm ${HOME}/i915.conf
echo "-->修复成功！"
