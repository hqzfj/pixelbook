#!/bin/bash
cd
source /etc/os-release
echo "您的系统发行版为：$ID，此脚本只在manjaro发行版上测试成功，不保证其他发行版能够成功修复，不过应该问题不大。此脚本根据jmontleon的gihub发布页(https://github.com/jmontleon/pixelbook-fedora)及yusefnapora的gihub发布页(https://github.com/yusefnapora/pixelbook-linux)的方法步骤编写。因非计算机专业，能力有限，此脚本只为方便本人在其他发行版修复，未对以上两位提供的代码做任何功能、技术上的修改，感谢jmontleon和yusefnapora对pixelbook使用linux所作出的努力和杰出贡献！对于非manjaro和archlinux版本的ubuntu、debian、mint、deepin等系统的音频修复：参考LyncolnMD（https://www.reddit.com/r/chrultrabook/comments/zpz7xb/linux_on_2017_pixelbook_eve_with_working_audio_on/ ）的方案，直接下载 pixelbook-alsa_1.0-1_amd64.deb软件包并使用sudo dpkg -i 命令安装即可，感谢LyncolnMD提供解决方案！"
echo "在manjaro的修复后工作情况：
1.音频----------正常
2.热键----------按键正常，屏幕背光调节无效果
3.触摸板--------正常
4.键盘背光------正常
"
if [ $ID = "fedora" ] || [ $ID = "Fedora" ]; then
echo "-->您的系统为fedora，请移步至jmontleon的gihub发布页(https://github.com/jmontleon/pixelbook-fedora)，并按他说明的方法、步骤进行修复！"
else
printf %.s- {1..100}
echo
PS3='选择要修复的项：'
lis=("音频" "热键" "触摸板" "键盘背光" "AER日志" "退出")

selectls(){
printf %.s- {1..100}
echo
n=0
for i in ${lis[@]};
do
  n=$(expr $n + 1)
  echo "$n)$i"
done
}

select fav in "${lis[@]}"; do
    case $fav in
        "音频")
            echo "开始修复$fav..."
            chmod +x ${HOME}/pixelbook/audio.sh
            ${HOME}/pixelbook/audio.sh
            selectls
            ;;
        "热键")
            echo "开始修复$fav..."
            chmod +x ${HOME}/pixelbook/hotkeys.sh
            ${HOME}/pixelbook/hotkeys.sh
            selectls
            ;;
        "触摸板")
            echo "开始修复$fav..."
            chmod +x ${HOME}/pixelbook/touchpad.sh
            ${HOME}/pixelbook/touchpad.sh
            selectls
	    #break
            ;;
        "键盘背光")
            echo "开始修复$fav..."
            chmod +x ${HOME}/pixelbook/keyboard-brightness.sh
            ${HOME}/pixelbook/keyboard-brightness.sh
            selectls
            ;;
        "AER日志")
            echo "开始修复$fav..."
            chmod +x ${HOME}/pixelbook/aer.sh
            ${HOME}/pixelbook/aer.sh
            selectls
            ;;
	"退出")
	    echo "已退出"
	    exit
	    ;;
        *) echo "选择要修复的项 $REPLY";;
    esac
done

fi
