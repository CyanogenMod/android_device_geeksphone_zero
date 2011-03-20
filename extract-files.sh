#!/bin/sh

mkdir -p ../../../vendor/geeksphone/zero/proprietary

DIRS="
app
bin
etc/firmware
lib/egl
lib/hw
"

for DIR in $DIRS; do
	mkdir -p ../../../vendor/geeksphone/zero/proprietary/$DIR
done

FILES="
bin/hci_qcomm_init
bin/qmuxd
bin/brcm_patchram_plus
bin/brcm_patchram_plus.dat
bin/bt_tool.dat
bin/btwlancoex
bin/CKPD-daemon
bin/memsicd
bin/wl
bin/rild

etc/firmware/yamato_pfp.fw
etc/firmware/yamato_pm4.fw
etc/BCM4325D1_004.002.004.0230.0244.hcd
etc/nvram.txt
etc/sdio_cit.bin
etc/sdio.bin

lib/egl/egl.cfg
lib/egl/libEGL_adreno200.so
lib/egl/libGLESv1_CM_adreno200.so
lib/egl/libGLESv2_adreno200.so
lib/egl/libq3dtools_adreno200.so

lib/hw/lights.msm7k.so

lib/hw/sensors.default.so

lib/liba2dp.so
lib/libaudioeq.so

lib/libauth.so
lib/libcm.so
lib/libdiag.so
lib/libdll.so
lib/libdsm.so
lib/libdss.so
lib/libgsdi_exp.so
lib/libgsl.so
lib/libgstk_exp.so
lib/libmmgsdilib.so
lib/libnv.so
lib/liboem_rapi.so
lib/liboncrpc.so
lib/libpbmlib.so
lib/libqmi.so
lib/libqueue.so
lib/libril-qc-1.so
lib/libril-qcril-hook-oem.so
lib/libwms.so
lib/libwmsts.so
lib/libloc_api.so

lib/libcamera.so
lib/libmmipl.so
lib/libmmjpeg.so
lib/liboemcamera.so

lib/libmm-adspsvc.so
lib/libOmxAacDec.so
lib/libOmxAacEnc.so
lib/libOmxAmrDec.so
lib/libOmxAmrEnc.so
lib/libOmxAmrRtpDec.so
lib/libOmxAmrwbDec.so
lib/libOmxEvrcDec.so
lib/libOmxEvrcEnc.so
lib/libOmxH264Dec.so
lib/libOmxMp3Dec.so
lib/libOmxMpeg4Dec.so
lib/libOmxQcelp13Enc.so
lib/libOmxQcelpDec.so
lib/libOmxVidEnc.so
lib/libOmxWmaDec.so
lib/libOmxWmvDec.so

lib/libfmhal.so
lib/libFMRadio.so
lib/libCITFMRadio.so
lib/libbluedroid.so
lib/libaudio.so
app/FMRadio.apk
"

for FILE in $FILES; do
	adb pull system/$FILE ../../../vendor/geeksphone/zero/proprietary/$FILE
done

