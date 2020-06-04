#!/bin/bash
source of.env
cd $ANDROID_ROOT

source build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL="C"
lunch omni_$DEVICE-userdebug
mkdir -p /home/runner/work/orangefox/out/target/product/yggdrasil/system/etc
touch /home/runner/work/orangefox/out/target/product/yggdrasil/system/etc/ld.config.txt
make -j$(nproc) recoveryimage

echo "md5sum OrangeFox-unofficial-yggdrasil.img"
md5sum $ANDROID_ROOT/out/target/product/yggdrasil/OrangeFox-unofficial-yggdrasil.img
