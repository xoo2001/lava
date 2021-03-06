#!/bin/bash

# mt6768 autopatcher by henloboi 202103040948 GMT+0

ROOTDIR=$(realpath .)
pfwb() {
    cd frameworks/base && wget https://github.com/PixelExperience/frameworks_base/commit/37f5a323245b0fd6269752742a2eb7aa3cae24a7.patch && git apply 37f5a323245b0fd6269752742a2eb7aa3cae24a7.patch
}

pims() {
    cd frameworks/opt/net/ims && wget https://github.com/PixelExperience/frameworks_opt_net_ims/commit/661ae9749b5ea7959aa913f2264dc5e170c63a0a.patch && git apply 661ae9749b5ea7959aa913f2264dc5e170c63a0a.patch
}

pwifi() {
    cd frameworks/opt/net/wifi && wget https://github.com/PixelExperience/frameworks_opt_net_wifi/commit/3bd2c14fbda9c079a4dc39ff4601ba54da589609.patch && git apply 3bd2c14fbda9c079a4dc39ff4601ba54da589609.patch
}

mtkr() {
    git clone --depth=1 --single-branch https://github.com/PixelExperience/device_mediatek_sepolicy device/mediatek/sepolicy 
    git clone --depth=1 --single-branch https://github.com/PixelExperience/vendor_mediatek_interfaces vendor/mediatek/interfaces 
    git clone --depth=1 --single-branch https://github.com/PixelExperience/vendor_mediatek-opensource vendor/mediatek/opensource
    git clone --depth=1 --single-branch https://github.com/Redmi-MT6768/android_vendor_mediatek_ims vendor/mediatek/ims 
}

cd $ROOTDIR 
pfwb
cd $ROOTDIR 
pims 
cd $ROOTDIR 
pwifi 
cd $ROOTDIR 
mtkr 
cd $ROOTDIR

echo "patch done !"
