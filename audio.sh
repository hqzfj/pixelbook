#!/bin/bash
cd
source /etc/os-release
echo "您的系统发行版为：$ID，你的系统若为manjaro,请先将谷歌恢复文件解压成bin文件并拷贝至用户根目录!"
printf %.s- {1..100}
echo
if [ $ID != "manjaro" ] && [ $ID != "Manjaro" ] && [ $ID != "archlinux" ] && [ $ID != "arch linux" ]; then
echo "你的系统为非manjaro和非archlinux，若为ubuntu、mint、debian或deepin，请直接下载LyncolnMD提供的pixelbook-alsa_1.0-1_amd64.deb软件包并使用sudo dpkg -i安装即可，无需进行下一步。"
else
installapp(){
echo "安装kpartx用于映射挂载谷歌恢复镜像文件及xinput、pulseaudio"
if [ $ID = "manjaro" ] || [ $ID = "Manjaro" ] || [ $ID = "archlinux" ] || [ $ID = "arch linux" ]; then
sudo pacman -S multipath-tools -y
sudo pacman -S xorg-xinput -y
sudo pacman -S pulseaudio -y
sudo pacman -S pulseaudio-alsa pulseaudio-jack
else
sudo apt-get -y install kpartx
sudo apt-get -y install xinput
sudo apt-get -y install pulseaudio
sudo apt-get -y install pulseaudio-alsa pulseaudio-jack
fi

}
filesname=""
fixaudio(){
echo "-->开始修复音频"
#挂载复制谷歌驱动文件
sudo kpartx -av $filesname
sudo mount -o ro /dev/mapper/loop0p3 /mnt
sudo cp /mnt/lib/firmware/9d71-GOOGLE-EVEMAX-0-tplg.bin /lib/firmware/
sudo cp /mnt/lib/firmware/dsp_lib_dsm_core_spt_release.bin /lib/firmware/
sudo cp /mnt/lib/firmware/intel/dsp_fw_C75061F3-F2B2-4DCC-8F9F-82ABB4131E66.bin /lib/firmware/intel
sudo mkdir -p /opt/google/dsm/
sudo cp /mnt/opt/google/dsm/dsmparam.bin /opt/google/dsm/dsmparam.bin

#添加 ucm2 配置文件
sudo mkdir -p /usr/share/alsa/ucm2/Intel/kbl-r5514-5663-/
sudo mkdir -p /usr/share/alsa/ucm2/conf.d/kbl-r5514-5663-/
sudo cp -p  ${HOME}/pixelbook/configs/HiFi.conf /usr/share/alsa/ucm2/Intel/kbl-r5514-5663-/
sudo chmod 0755 /usr/share/alsa/ucm2/Intel/kbl-r5514-5663-/HiFi.conf
sudo cp -p  ${HOME}/pixelbook/configs/kbl-r5514-5663-.conf /usr/share/alsa/ucm2/Intel/kbl-r5514-5663-/
sudo chmod 0755 /usr/share/alsa/ucm2/Intel/kbl-r5514-5663-/kbl-r5514-5663-.conf
cd /usr/share/alsa/ucm2/conf.d/kbl-r5514-5663-/
sudo ln -sf ../../Intel/kbl-r5514-5663-/kbl-r5514-5663-.conf
sudo rm ${HOME}/kbl-r5514-5663-.conf
cd
echo "-->修复成功！"
#pixelbook-acpi,pixelbook-acpi.service
sudo mkdir -p /usr/libexec/
sudo mkdir -p /usr/lib/systemd/system/
sudo cp -p  ${HOME}/pixelbook/configs/pixelbook-acpi.service /usr/lib/systemd/system/
sudo chmod 0664 /usr/lib/systemd/system/pixelbook-acpi.service
sudo cp -p  ${HOME}/pixelbook/scripts/pixelbook-acpi /usr/libexec/
sudo chmod 0775 /usr/libexec/pixelbook-acpi
sudo systemctl enable --now pixelbook-acpi.service
sudo systemctl start pixelbook-acpi
echo "-->完成！"

}
read -p "请输入或粘贴已解压后置于根目录下的谷歌恢复镜像文件名（含扩展名‘bin’）:" filesname
if [ ! -f "${HOME}/$filesname" ]; then
echo "-->在路径${HOME}/中找不到您输入的以 $filesname 命名的谷歌恢复bin文件，请重新开始"
else
installapp
read -r -p "是否挂载谷歌恢复文件执行修复音频 [Y/n] " input
case $input in
    [yY][eE][sS]|[yY])
        echo "-->ok!"
        fixaudio
        ;;

    [nN][oO]|[nN])
        echo "-->取消选择！"
           ;;
    *)
        echo "Invalid input..."
        exit 1
        ;;
esac
fi
fi
