#!/bin/bash
cd
source /etc/os-release
echo "您的系统发行版为：$ID，以下将修复键盘背光"
printf %.s- {1..100}
echo

sudo mkdir -p /usr/libexec/
sudo mkdir -p /usr/lib/systemd/system/
sudo cp -p  ${HOME}/pixelbook/scripts/pixelbook-keyboard-backlight /usr/libexec/
sudo chmod 0775 /usr/libexec/pixelbook-keyboard-backlight

sudo cp -p  ${HOME}/pixelbook/configs/pixelbook-keyboard-backlight.service /usr/lib/systemd/system/
sudo chmod 0664 /usr/lib/systemd/system/pixelbook-keyboard-backlight.service

sudo systemctl enable --now  pixelbook-keyboard-backlight.service
sudo systemctl start pixelbook-keyboard-backlight

sudo cp -p  ${HOME}/pixelbook/configs/eve-keyboard-brightness.sh /usr/local/bin/
sudo chmod 0775 /usr/local/bin/eve-keyboard-brightness.sh
sudo usermod -aG input $USER

echo "-->修复成功！"
echo "请在系统设置中自定义键盘背光调亮快捷组合键：‘谷歌助理键（最底行左数第2个按键）’+‘亮度调亮键（第1行左数第7个按键）’，快捷命令‘eve-keyboard-brightness.sh +25’，表示每摁一次组合键，键盘增加亮度25%，直至100%为止。"
echo "请在系统设置中自定义键盘背光调亮快捷组合键：‘谷歌助理键（最底行左数第2个按键）’+‘亮度调暗键（第1行左数第6个按键）’，快捷命令‘eve-keyboard-brightness.sh -25’，表示每摁一次组合键，键盘减少亮度25%，直至0%关闭为止。"

