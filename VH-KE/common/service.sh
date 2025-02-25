# Kakathic
# Later in the booting process, the class late_start will be triggered, and Magisk “service” mode will be started. In this mode, service scripts are executed.
MODPATH="${0%/*}"
while [ "$(getprop sys.boot_completed)" != 1 ]; do
Auto=$(($Auto + 1))
if [ "$Auto" == 100 ];then
echo > $MODPATH/disable
rm -fr /data/dalvik-cache/*
rm -fr /data/system/package_cache/*
rm -fr /data/resource-cache/*
sleep 5
reboot
fi
sleep 1
done

RD="$RANDOM"
while true; do
echo > /sdcard/$RD
if [ -e /sdcard/$RD ];then
rm -fr /sdcard/$RD
break
else
sleep 2
fi
done

for tenapk in $(ls -1 ${0%/*}/app); do
Pathapk="$(pm path "$tenapk" | cut -d : -f2)"
chcon u:object_r:apk_data_file:s0 ${0%/*}/app/$tenapk
su -mm -c mount -o bind ${0%/*}/app/$tenapk "$Pathapk"
killall $tenapk
done
