#!/system/bin/sh

echo "1" > /sys/devices/platform/msm_sdcc.2/polling
setprop wlan.driver.status ok

