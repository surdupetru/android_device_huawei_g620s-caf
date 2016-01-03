# Copyright (C) 2016 @surdu_petru

LOCAL_PATH := $(call my-dir)

#----------------------------------------------------------------------
# extra images
#----------------------------------------------------------------------
include build/core/generate_extra_images.mk


# Create a link for the WCNSS config file, which ends up as a writable
# version in /data/misc/wifi
$(shell mkdir -p $(TARGET_OUT)/etc/firmware/wlan/prima; \
    ln -sf /data/misc/wifi/WCNSS_qcom_cfg.ini \
	    $(TARGET_OUT)/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini)


# Create symlink spn-conf.xml which points to selective-spn-conf.xml
# since Huawei's modem does not pull in network operator names
$(shell mkdir -p $(TARGET_OUT)/etc; \
	ln -sf /system/etc/selective-spn-conf.xml \
		$(TARGET_OUT)/etc/spn-conf.xml)
