# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/geeksphone/zero/zero-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/geeksphone/zero/overlay

# HAL libs and other system binaries
PRODUCT_PACKAGES += \
    hwprops \
    abtfilt \
    gps.zero \
    copybit.zero \
    gralloc.zero \
    libOmxCore

# Extra apps
#PRODUCT_PACKAGES += \
#	Torch

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/geeksphone/zero/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel


# Live wallpaper packages
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Board-specific init
PRODUCT_COPY_FILES += \
    device/geeksphone/zero/ueventd.pw28.rc:root/ueventd.pw28.rc \
    device/geeksphone/zero/320_480logo.rle:root/320_480logo.rle \
    device/geeksphone/zero/320_480logo.rle:root/initlogo.rle \
    device/geeksphone/zero/init.zero.rc:root/init.zero.rc

## RIL related stuff
PRODUCT_COPY_FILES += \
    vendor/geeksphone/zero/proprietary/bin/qmuxd:system/bin/qmuxd \
    vendor/geeksphone/zero/proprietary/lib/liboncrpc.so:system/lib/liboncrpc.so \
    vendor/geeksphone/zero/proprietary/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    vendor/geeksphone/zero/proprietary/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \
    vendor/geeksphone/zero/proprietary/lib/libgstk_exp.so:system/lib/libgstk_exp.so \
    vendor/geeksphone/zero/proprietary/lib/libwms.so:system/lib/libwms.so \
    vendor/geeksphone/zero/proprietary/lib/libnv.so:system/lib/libnv.so \
    vendor/geeksphone/zero/proprietary/lib/libwmsts.so:system/lib/libwmsts.so \
    vendor/geeksphone/zero/proprietary/lib/libdss.so:system/lib/libdss.so \
    vendor/geeksphone/zero/proprietary/lib/libqmi.so:system/lib/libqmi.so \
    vendor/geeksphone/zero/proprietary/lib/libdiag.so:system/lib/libdiag.so \
    vendor/geeksphone/zero/proprietary/lib/libpbmlib.so:system/lib/libpbmlib.so \
    vendor/geeksphone/zero/proprietary/lib/libauth.so:system/lib/libauth.so \
    vendor/geeksphone/zero/proprietary/lib/liboem_rapi.so:system/lib/liboem_rapi.so \
    vendor/geeksphone/zero/proprietary/lib/libdsm.so:system/lib/libdsm.so \
    vendor/geeksphone/zero/proprietary/lib/libqueue.so:system/lib/libqueue.so \
    vendor/geeksphone/zero/proprietary/lib/libcm.so:system/lib/libcm.so \
    vendor/geeksphone/zero/proprietary/lib/libdll.so:system/lib/libdll.so \
    vendor/geeksphone/zero/proprietary/bin/rild:system/bin/rild \
    vendor/geeksphone/zero/proprietary/lib/libloc_api.so:system/lib/libloc_api.so \
    vendor/geeksphone/zero/proprietary/lib/libril-qc-1.so:system/lib/libril-qc-1.so \
    vendor/geeksphone/zero/proprietary/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so

## OMX proprietaries
PRODUCT_COPY_FILES += \
    vendor/geeksphone/zero/proprietary/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    vendor/geeksphone/zero/proprietary/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    vendor/geeksphone/zero/proprietary/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
    vendor/geeksphone/zero/proprietary/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    vendor/geeksphone/zero/proprietary/lib/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so \
    vendor/geeksphone/zero/proprietary/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
    vendor/geeksphone/zero/proprietary/lib/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \
    vendor/geeksphone/zero/proprietary/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
    vendor/geeksphone/zero/proprietary/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    vendor/geeksphone/zero/proprietary/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
    vendor/geeksphone/zero/proprietary/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
    vendor/geeksphone/zero/proprietary/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    vendor/geeksphone/zero/proprietary/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    vendor/geeksphone/zero/proprietary/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
    vendor/geeksphone/zero/proprietary/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
    vendor/geeksphone/zero/proprietary/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
    vendor/geeksphone/zero/proprietary/lib/libOmxWmvDec.so:system/lib/libOmxWmvDec.so

## Hardware properties 
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

#PRODUCT_COPY_FILES += \
#    device/geeksphone/zero/prebuilt/librpc.so:system/lib/librpc.so

## Camera proprietaries
PRODUCT_COPY_FILES += \
    vendor/geeksphone/zero/proprietary/lib/libcamera.so:obj/lib/libcamera.so \
    vendor/geeksphone/zero/proprietary/lib/libcamera.so:system/lib/libcamera.so \
    vendor/geeksphone/zero/proprietary/lib/liboemcamera.so:system/lib/liboemcamera.so \
    vendor/geeksphone/zero/proprietary/lib/libmmjpeg.so:system/lib/libmmjpeg.so \
    vendor/geeksphone/zero/proprietary/lib/libmmipl.so:system/lib/libmmipl.so

## Wifi module
PRODUCT_COPY_FILES += \
    device/geeksphone/zero/prebuilt/dhd.ko:system/lib/modules/dhd.ko

## FMRadio app and dependencies
PRODUCT_COPY_FILES += \
    vendor/geeksphone/zero/proprietary/lib/libfmhal.so:system/lib/libfmhal.so \
    vendor/geeksphone/zero/proprietary/lib/libFMRadio.so:system/lib/libFMRadio.so \
    vendor/geeksphone/zero/proprietary/lib/libCITFMRadio.so:system/lib/libCITFMRadio.so \
    vendor/geeksphone/zero/proprietary/lib/libbluedroid.so:system/lib/libbluedroid.so \
    vendor/geeksphone/zero/proprietary/lib/libaudio.so:system/lib/libaudio.so \
    vendor/geeksphone/zero/proprietary/app/FMRadio.apk:system/app/FMRadio.apk


   # device/geeksphone/zero/AudioFilter.csv:system/etc/AudioFilter.csv \
   
## Other libraries and proprietary binaries
PRODUCT_COPY_FILES += \
    vendor/geeksphone/zero/proprietary/bin/bt_tool.dat:system/bin/bt_tool.dat \
    vendor/geeksphone/zero/proprietary/bin/btwlancoex:system/bin/btwlancoex \
    vendor/geeksphone/zero/proprietary/bin/CKPD-daemon:system/bin/CKPD-daemon \
    vendor/geeksphone/zero/proprietary/bin/memsicd:system/bin/memsicd \
    vendor/geeksphone/zero/proprietary/bin/wl:system/bin/wl \
    vendor/geeksphone/zero/proprietary/etc/sdio.bin:system/etc/firmware/fw_bcm4329_apsta.bin \
    vendor/geeksphone/zero/proprietary/etc/sdio_cit.bin:system/etc/firmware/fw_bcm4329.bin \
    vendor/geeksphone/zero/proprietary/bin/hci_qcomm_init:system/bin/hci_qcomm_init \
    device/geeksphone/zero/prebuilt/init.qcom.bt.sh:system/bin/init.qcom.bt.sh \
    device/geeksphone/zero/prebuilt/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
    device/geeksphone/zero/prebuilt/wificit.sh:system/bin/wificit.sh \
    device/geeksphone/zero/prebuilt/nvram.txt:system/etc/wifi/nvram.txt \
    vendor/geeksphone/zero/proprietary/lib/hw/sensors.default.so:system/lib/hw/sensors.default.so \
    device/geeksphone/zero/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    vendor/geeksphone/zero/proprietary/lib/liba2dp.so:system/lib/liba2dp.so \
    vendor/geeksphone/zero/proprietary/lib/libaudioeq.so:system/lib/libaudioeq.so \
    vendor/geeksphone/zero/proprietary/lib/egl/egl.cfg:system/lib/egl/egl.cfg \
    vendor/geeksphone/zero/proprietary/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    vendor/geeksphone/zero/proprietary/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    vendor/geeksphone/zero/proprietary/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    vendor/geeksphone/zero/proprietary/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    vendor/geeksphone/zero/proprietary/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    vendor/geeksphone/zero/proprietary/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    vendor/geeksphone/zero/proprietary/lib/libgsl.so:system/lib/libgsl.so \
    vendor/geeksphone/zero/proprietary/etc/BCM4325D1_004.002.004.0230.0244.hcd:system/etc/BCM4325D1_004.002.004.0230.0244.hcd \
    vendor/geeksphone/zero/proprietary/lib/hw/lights.msm7k.so:system/lib/hw/lights.zero.so


PRODUCT_COPY_FILES += \
    device/geeksphone/zero/media_profiles.xml:system/etc/media_profiles.xml \
    device/geeksphone/zero/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/geeksphone/zero/vold.fstab:system/etc/vold.fstab \
    device/geeksphone/zero/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/geeksphone/zero/7k_ffa_keypad.kl:system/usr/keylayout/7k_ffa_keypad.kl


$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := zero
PRODUCT_DEVICE := zero
PRODUCT_MODEL := Geeksphone ZERO
