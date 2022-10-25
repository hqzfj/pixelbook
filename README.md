# pixelbook-mint
参考自https://github.com/jmontleon/pixelbook-fedora 、 https://github.com/yusefnapora/pixelbook-linux ， 修改适用于其他发行版，非常感谢jmontleon和yusefnapora提供解决方案参照！
如有侵权请联系删除。
# 从谷歌chrome系统刷机到linux-mint系统
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
3.到mint官网下载最新镜像文件，制作引导启动U盘，插入pixelbook后，重启电脑，启动后按esc键进入刚刚刷好的bios，选择从镜像U盘启动，按照官方说明步骤安装即可。
