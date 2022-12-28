# pixelbook-manjaro/archlinux/ubuntu/debian/mint/deepin/fedora
参考自https://github.com/jmontleon/pixelbook-fedora 、 https://github.com/yusefnapora/pixelbook-linux ， 修改适用于其他发行版，非常感谢jmontleon和yusefnapora提供解决方案！如有侵权请联系删除。
# 从谷歌chrome系统刷机到manjaro系统
1.在解除保护后（保护螺丝拧下来，拔掉电池线，再装上，螺丝拧回）， ChromeOS启用开发者模式后，
进入 ChromeOS ，按 Ctrl + Alt + T 进入终端，输入shell 进入 Linux 命令行，执行以下命令：

    cd ~

    curl -LO https://mrchromebox.tech/firmware-util.sh && sudo bash firmware-util.sh

输入Install/Update UEFI （Full ROM） Firmware这项前的相应序号（安装或更新刷入固件），免责声明，如果同意就请输入 "I ACCEPT"，
所有提示都输入 y，当需要备份时，插入U盘设备，以完成备份，选择U盘对应的序号进行备份，开始下载固件。

2.当如要还原谷歌chrome os的bios时只需要在任何发行版本的 Linux 终端执行以下一样的命令：

     cd ~

     curl -LO https://mrchromebox.tech/firmware-util.sh && sudo bash firmware-util.sh

输入Restore Stock Firmware这项前的相应序号，然后会提示你插入装有pixelbook谷歌bios之前备份的U盘，选择备份文件名恢复，恢复原谷歌系统需要制作一个chromeos恢复盘，按相关说明恢复即可。

3.到manjaro官网下载最新镜像文件，制作引导启动U盘，插入pixelbook后，重启电脑，启动后按esc键进入刚刚刷好的bios，选择从镜像U盘启动，按照官方说明步骤安装即可。

#适用于pixelbook安装manjaro的修复脚本，也可能适用于ubuntu/debian/mint/deepin/fedora等发行版本
此脚本只在manjaro发行版上测试成功，不保证其他发行版能够成功修复，不过应该问题不大。此脚本根据jmontleon的gihub发布页(https://github.com/jmontleon/pixelbook-fedora )及yusefnapora的gihub发布页(https://github.com/yusefnapora/pixelbook-linux )的方法步骤编写。因非计算机专业，能力有限，此脚本只为方便本人在其他发行版修复，未对以上两位提供的代码做任何功能、技术上的修改，感谢jmontleon和yusefnapora对pixelbook使用linux所作出的努力和杰出贡献！

# 在manjaro的修复后工作情况：

1）.音频--------------正常；
2）.热键映射-----------正常，屏幕背光调节无效果；
3）.触摸板-------------正常；
4）.键盘背光-----------正常；

# 安装步骤：
1. 从 https://chromiumdash.appspot.com/serving-builds?deviceCategory=Chrome%20OS 下载最新的eve恢复镜像，并解压后将bin放置在当前用户根目录下

2. 克隆到本地用户根目录

       git clone https://github.com/hqzfj/pixelbook 

确保文件夹名为pixelbook
3. 给予运行权限

       chmod +x ./pixelbook/install.sh

4.运行脚本

       ./pixelbook/install.sh
 
# 脚本结构选择项
1) 音频------------对应调用运行audio.sh脚本文件
2) 热键------------对应调用运行hotkeys.sh脚本文件
3) 触摸板----------对应调用运行touchpad.sh脚本文件
4) 键盘背光--------对应调用运行keyboard-brightness.sh脚本文件
5) AER日志---------对应调用运行aer.sh脚本文件
6) 退出
# 非manjaro发行版的需要注意的地方
1.音频修复时需要安装kpartx软件用于映射挂载谷歌恢复镜像文件和安装xinput软件用于监控输入设备
 audio.sh脚本文件运行时做了判断，manjaro系统为：
 
                      sudo pacman -S multipath-tools -y
                      
                      sudo pacman -S xorg-xinput -y
   非manjaro系统：
   
                      sudo apt-get -y install kpartx
                      
                      sudo apt-get -y install xinput
                      
   以上非manjaro系统软件包名若不正确请查询并修改上述两个软件包的安装命令
   
 2.热键映射中的屏幕背光需要安装dracut软件，keyboard-brightness.sh脚本文件运行时做了判断，manjaro系统为：
 
                      sudo pacman -S dracut -y
                      
   非manjaro系统：
   
                      sudo apt-get -y install dracut
                      
   以上非manjaro系统软件包名dracut若不正确请查询并修改dracut软件包的安装命令

 3.热键映射修复完成后请手动在系统设置中设置调节键盘背光的自定义快捷组合键
 
   1）自定义键盘背光调亮快捷组合键：‘谷歌助理键（最底排左数第2个按键）’+‘亮度调亮键（第1排左数第7个按键）’，快捷命令‘eve-keyboard-brightness.sh +25’，表示每摁一次组合键，键盘增加亮度25%，直至100%为止。
   
   2）自定义键盘背光调亮快捷组合键：‘谷歌助理键（最底排左数第2个按键）’+‘亮度调暗键（第1排左数第6个按键）’，快捷命令‘eve-keyboard-brightness.sh -25’，表示每摁一次组合键，键盘减少亮度25%，直至0%关闭为止。
   
