ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),zero)
include $(call first-makefiles-under,$(call my-dir))
endif
