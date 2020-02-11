#!/bin/bash
make clean 

echo 'sync'
repo sync --force-sync --no-tags --no-clone-bundle -j$(nproc --all)

echo 'remove'
rm -R /home/ich/magma/device/xiaomi/msm8996-common/touch
rm -R /home/ich/magma/device/xiaomi/msm8996-common/configpanel
rm /home/ich/device/xiaomi/msm8996-common/sepolicy/hal_lineage_touch_default.te
rm -R /home/ich/magma/device/xiaomi/msm8996-common/doze

echo 'remove apps'
rm -R /home/ich/magma/packages/apps/FMRadio
rm -R /home/ich/magma/packages/apps/TvSettings
rm -R /home/ich/magma/packages/apps/TV
rm -R /home/ich/magma/packages/apps/Messaging
rm -R /home/ich/magma/packages/apps/Contacts

mv /home/ich/magma/copy/bootanimation.zip /home/ich/magma/vendor/magma/prebuilt/common/bootanimation/bootanimation.zip
mv /home/ich/magma/copy/Seafile /home/ich/magma/vendor/prebuilts/Seafile

rm -R /home/ich/magma/copy

echo 'build'
source build/envsetup.sh
lunch magma_capricorn-userdebug
mka magma
