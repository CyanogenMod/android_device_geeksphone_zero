#!/system/bin/sh
# AzureWave. Inc 2010/07/23 modify for Broadcom BCM43xx
# SIM(smartwireless.cn ONLY; Confidential Note


BLUETOOTH_SLEEP_PATH=/proc/bluetooth/sleep/proto
LOG_TAG="qcom-bluetooth"
LOG_NAME="${0}:"

hciattach_pid=""

loge ()
{
  /system/bin/log -t $LOG_TAG -p e "$LOG_NAME $@"
}

logi ()
{
  /system/bin/log -t $LOG_TAG -p i "$LOG_NAME $@"
}

failed ()
{
  loge "$1: exit code $2"
  exit $2
}

start_hciattach ()
{
  echo 1 > $BLUETOOTH_SLEEP_PATH
  /system/bin/hciattach -n /dev/ttyHS0 any 3000000 flow &
  #/system/bin/hciattach /dev/ttyHS0 any 115200 flow &
  hciattach_pid=$!
  logi "start_hciattach: pid = $hciattach_pid"
}

kill_hciattach ()
{
  logi "kill_hciattach: pid = $hciattach_pid"
  ## careful not to kill zero or null!
  kill -TERM $hciattach_pid
  echo 0 > $BLUETOOTH_SLEEP_PATH
  # this shell doesn't exit now -- wait returns for normal exit
}

cd /system/bin
./brcm_patchram_plus -d --patchram /etc/BCM4325D1_004.002.004.0230.0244.hcd /dev/ttyHS0
logi "Write PCM setting..."
./bt_tool.dat /dev/ttyHS0 hcicmd 3f 1c 00 04 00 00 00
logi "Write Sleep mode setting..."
./bt_tool.dat /dev/ttyHS0 hcicmd 3f 27 01 01 10 00 00 00 00 00 00 00 00 00
logi "Change baudrate to 3000000"
./brcm_patchram_plus -d -baudrate 3000000 /dev/ttyHS0 
exit_code_hci_qcomm_download=$?

case $exit_code_hci_qcomm_download in
  0) logi "Bluetooth QSoC firmware download succeeded, $BTS_DEVICE $BTS_TYPE $BTS_BAUD $BTS_ADDRESS";;
  *) failed "Bluetooth QSoC firmware download failed" $exit_code_hci_qcomm_download;;
esac

# init does SIGTERM on ctl.stop for service
trap "kill_hciattach" TERM INT

start_hciattach

wait $hciattach_pid

logi "Bluetooth stopped"

exit 0




#LOG_TAG="qcom-bluetooth"
#LOG_NAME="${0}:"


#logi ()
#{
#  /system/bin/log -t $LOG_TAG -p i "$LOG_NAME $@"
#}

#logi "[AZwave]Broadcom Bluetooth starting"

#brcm_patchram_plus -d --patchram /system/etc/BCM4325D1_004.002.004.0230.0244.hcd /dev/ttyHS0 

#logi "[AZwave]Broadcom Bluetooth starting"
#exit 0
