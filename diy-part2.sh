#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

# Modify default IP
sed -i 's/192.168.1.1/192.168.1.253/g' package/base-files/files/bin/config_generate

# Add shadowsocks-rust 1.15.0-alpha.4
rm -rf package/helloworld/shadowsocks-rust
svn co  https://github.com/Mattaclp/NewLEDE/trunk/shadowsocks-rust package/helloworld/shadowsocks-rust

# Add NanoHatOLED weather support (tested not work, need to fix)
#rm -rf feeds/NanoHatOLED/nanohatoled/files/NanoHatOLED/bakebit_nanohat_oled.py
#wget -O Zpix.ttf https://github.com/vinewx/NanoHatOLED/raw/weather/nanohatoled/files/NanoHatOLED/Zpix.ttf
#wget -O bakebit_nanohat_oled.py https://github.com/vinewx/NanoHatOLED/raw/weather/nanohatoled/files/NanoHatOLED/bakebit_nanohat_oled.py
#sed -i 's/101010100/101210401/g' bakebit_nanohat_oled.py
#mv Zpix.ttf feeds/NanoHatOLED/nanohatoled/files/NanoHatOLED/
#mv bakebit_nanohat_oled.py feeds/NanoHatOLED/nanohatoled/files/NanoHatOLED/

# 移除重复软件包
rm -rf feeds/luci/themes/luci-theme-argon
#rm -rf feeds/luci/applications/luci-app-jd-dailybonus

git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/luci-app-jd-dailybonus

# Modify Default Theme
sed -i '/uci commit luci/i\uci set luci.main.mediaurlbase=/luci-static/argon' package/lean/default-settings/files/zzz-default-settings

# 修改主机名字，把OpenWrt-123修改你喜欢的就行（不能纯数字或者使用中文）
#sed -i '/uci commit system/i\uci set system.@system[0].hostname='LEUNG'' package/lean/default-settings/files/zzz-default-settings

# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
#sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings

# 修改内核版本
sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=5.18/g' target/linux/x86/Makefile
#sed -i 's/KERNEL_TESTING_PATCHVER:=5.4/KERNEL_TESTING_PATCHVER:=5.10/g' target/linux/x86/Makefile
#sed -i 's/KERNEL_PATCHVER=5.10/KERNEL_PATCHVER=5.15/g' target/linux/rockchip/Makefile
#sed -i 's/KERNEL_TESTING_PATCHVER=5.15/KERNEL_TESTING_PATCHVER=5.4/g' target/linux/rockchip/Makefile

