#!/system/bin/sh

echo "1" > /sys/devices/platform/msm_sdcc.2/polling
sleep 1
setprop wlan.driver.status ok

