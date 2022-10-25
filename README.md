# pixelbook-mint
参考自https://github.com/jmontleon/pixelbook-fedora 、 https://github.com/yusefnapora/pixelbook-linux ， 修改适用于其他发行版，非常感谢jmontleon和yusefnapora提供解决方案参照！
如有侵权请联系删除。
# 从谷歌chrome系统刷机到linux-mint系统
1.在解除保护后（保护螺丝拧下来，拔掉电池线，再装上，螺丝拧回）， ChromeOS启用开发者模式后，
进入 ChromeOS ，按 Ctrl + Alt + T 进入终端，输入shell 进入 Linux 命令行，执行以下命令：
cd ~
curl -LO https://mrchromebox.tech/firmware-util.sh && sudo bash firmware-util.sh
