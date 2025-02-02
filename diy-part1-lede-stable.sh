#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# back to 4.19.123
#git checkout ffc942671ff241753c67d20b86979090b233d5a9

svn co https://github.com/coolsnowwolf/lede/trunk/package/network/utils/bpftools package/network/utils/bpftools

wget https://github.com/coolsnowwolf/lede/raw/master/include/bpf.mk
mv bpf.mk include/

# Uncomment a feed source
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# add NanoHatOLED for Neo2
sed -i '$a src-git NanoHatOLED https://github.com/vinewx/NanoHatOLED.git' feeds.conf.default

# change v2ray-server
svn co https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-v2ray-server
rm -rf package/lean/luci-app-v2ray-server && mv luci-app-v2ray-server package/lean/

# add passwall
#sed -i '$a src-git diy1 https://github.com/xiaorouji/openwrt-passwall.git;main' feeds.conf.default

# add passwall
#git clone https://github.com/xiaorouji/openwrt-passwall.git package/diy1

# Add my helloworld
#sed -i '$a src-git helloworld https://github.com/Mattaclp/helloworld' feeds.conf.default

# Add immortalwrt packages
#sed -i '$a src-git immortalwrtpackages https://github.com/chiwaicw/immortalwrtpackages' feeds.conf.default
#sed -i '$a src-git immortalwrtluci https://github.com/chiwaicw/immortalwrtluci' feeds.conf.default
#svn co https://github.com/immortalwrt/immortalwrt/trunk/package package/immortalwrt/

# add argon theme
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
rm -rf package/lean/luci-theme-argon && mv luci-theme-argon package/lean/

# add argon-config
git clone https://github.com/jerrykuku/luci-app-argon-config.git
mv luci-app-argon-config package/lean/

# add vssr
git clone https://github.com/jerrykuku/lua-maxminddb.git
mv lua-maxminddb package/
git clone https://github.com/jerrykuku/luci-app-vssr.git
mv luci-app-vssr package/

echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall.git;packages' >>feeds.conf.default
echo 'src-git passwall_luci https://github.com/xiaorouji/openwrt-passwall.git;luci' >>feeds.conf.default
#git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall.git package/openwrt-passwall
#git clone --depth=1 -b luci https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall

# add JD
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git
mv luci-app-jd-dailybonus package/lean/

# change qBittorrent 4.2.5
#sed -i 's/8f615aa06f77286881d40b5f769f648221128b46f0bffc1f2fa101068f99ebe8/1dac52d6fe4b0c44dba04fcfc41f519c57a69cb30580255edca95c87053a4324/g' package/lean/qBittorrent/Makefile
#sed -i 's/4.3.4.1/4.2.5/g' package/lean/qBittorrent/Makefile
#sed -i 's/+qt5-core +qt5-network +qt5-sql +qt5-xml +rblibtorrent/+qt5-core +qt5-network +qt5-xml +rblibtorrent/g' package/lean/qBittorrent/Makefile
#sed -i 's/1.2.13/1.2.7/g' package/lean/rblibtorrent/Makefile
#sed -i 's/PKG_RELEASE=1/PKG_RELEASE=2/g' package/lean/rblibtorrent/Makefile
#sed -i 's/e00a152678fbce7903aa42bbd93e8b812f171928/8e710151c80e655ee0513ca37c367f75a448c6bd/g' package/lean/rblibtorrent/Makefile
#sed -i 's/*.so/libtorrent-rasterbar.so/g' package/lean/rblibtorrent/Makefile

# add Adguardhome
#svn co https://github.com/immortalwrt/luci/trunk/applications/luci-app-adguardhome package/lean/luci-app-adguardhome
#svn co https://github.com/immortalwrt/packages/trunk/net/adguardhome package/lean/adguardhome
#svn co https://github.com/immortalwrt/packages/trunk/lang/node-yarn package/lean/node-yarn
#svn co https://github.com/immortalwrt/packages/trunk/devel/packr package/lean/packr

# add filebrowser
#svn co https://github.com/immortalwrt/luci/trunk/applications/luci-app-filebrowser package/lean/luci-app-filebrowser
#svn co https://github.com/immortalwrt/packages/trunk/utils/filebrowser package/lean/filebrowser

# add gowebdav
#svn co https://github.com/immortalwrt/luci/trunk/applications/luci-app-gowebdav package/lean/luci-app-gowebdav
#svn co https://github.com/immortalwrt/packages/trunk/net/gowebdav package/lean/gowebdav

# set ARM to aarch64_generic
rm -rf target/linux/armvirt/64/target.mk
wget https://github.com/Mattaclp/NewLEDE/raw/main/aarch64_generic/target.mk
mv target.mk target/linux/armvirt/64/

# change Xray-core
#sed -i 's/PKG_VERSION:=1.2.4/PKG_VERSION:=1.3.0/g' feeds/helloworld/xray/Makefile
#sed -i 's/25f6c9edec0ac1f98328943cd2bb760ac7b69107582f9d27e43559da39dc01ed/1125af4411655abf47913af14a22fd7e2b13371e3566cc03676207519b0fe407/g' feeds/helloworld/xray/Makefile

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# add diskman
#rm -rf package/lean/luci-app-diskman
#rm -rf package/lean/parted
#svn co https://github.com/lisaac/luci-app-diskman/trunk/applications/luci-app-diskman package/lean/luci-app-diskman
#git clone https://github.com/lisaac/luci-app-diskman.git
#mkdir -p package/lean/parted && cp -i luci-app-diskman/Parted.Makefile package/lean/parted/Makefile

# add diskman
#svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/luci-app-diskman package/lean/luci-app-diskman
#svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/parted package/lean/parted

# add koolproxyR
git clone https://github.com/Beginner-Go/luci-app-koolproxyR
mv luci-app-koolproxyR package/lean/

# add serverchan
git clone https://github.com/tty228/luci-app-serverchan.git package/lean/luci-app-serverchan

# Add Mattraks helloworld
#sed -i '$a src-git helloworld https://github.com/Mattraks/helloworld' feeds.conf.default

#git clone -b master https://github.com/vernesong/OpenClash.git package/lean/luci-app-openclash  #openclash出国软件
#git clone https://github.com/frainzy1477/luci-app-clash.git package/lean/luci-app-clash  #clash出国软件

# Add po2lmo
#git clone https://github.com/openwrt-dev/po2lmo.git
#pushd po2lmo
#make && sudo make install
#popd

# Add Beginner-Go packages
#svn co https://github.com/Beginner-Go/my-packages/trunk/luci-app-control-webrestriction package/lean/luci-app-control-webrestriction
#svn co https://github.com/Beginner-Go/my-packages/trunk/luci-app-control-weburl package/lean/luci-app-control-weburl
#svn co https://github.com/Beginner-Go/my-packages/trunk/luci-app-eqos package/lean/luci-app-eqos

# Add openclash
# echo "src-git openclash https://github.com/vernesong/OpenClash;master" >> feeds.conf.default

# Add openclash
# svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/lean/luci-app-openclash

# Add po2lmo
# git clone https://github.com/openwrt-dev/po2lmo.git
# pushd po2lmo
# make && sudo make install
# popd

# 科学上网插件依赖
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
# 编译 po2lmo (如果有po2lmo可跳过)
pushd package/luci-app-openclash/tools/po2lmo
make && sudo make install
popd

# Add clash
#git clone -b master https://github.com/frainzy1477/luci-app-clash.git package/lean/luci-app-clash

# sed -i 's/KERNEL_PATCHVER:=4.14/KERNEL_PATCHVER:=4.19/g' ./target/linux/ipq40xx/Makefile
# sed -i 's/KERNEL_TESTING_PATCHVER:=4.14/KERNEL_TESTING_PATCHVER:=4.19/g' ./target/linux/ipq40xx/Makefile
