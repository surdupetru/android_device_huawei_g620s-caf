# Copyright (C) 2011 The Android Open-Source Project
# Copyright (C) 2016 @surdu_petru
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# config.mk
#
# Product-specific compile-time definitions.
#
# inherit from the proprietary version
-include vendor/huawei/g620s/BoardConfigVendor.mk

LOCAL_PATH := device/huawei/g620s

# Platform
TARGET_BOARD_PLATFORM := msm8916
TARGET_BOARD_PLATFORM_GPU := qcom-adreno306

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := MSM8916

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53
TARGET_BOARD_SUFFIX := _32
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

# Audio
USE_CUSTOM_AUDIO_POLICY := 1
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_DEEP_BUFFER_RINGTONE := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
COMMON_GLOBAL_CFLAGS += -DHUAWEI_SOUND_PARAM_PATH=\"/system/etc/sound_param/g620s_l01l02\"

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
FEATURE_QCRIL_UIM_SAP_SERVER_MODE := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Camera
COMMON_GLOBAL_CFLAGS += -DCAMERA_VENDOR_L_COMPAT
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_USE_COMPAT_GRALLOC_ALIGN := true

# Graphics
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_CONTINUOUS_SPLASH_ENABLED := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
TARGET_USES_NEW_ION_API :=true
USE_OPENGL_RENDERER := true

# Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/
TARGET_LIBINIT_DEFINES_FILE := $(LOCAL_PATH)/init/init_g620s.cpp

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_BASE        := 0x80000000
BOARD_KERNEL_PAGESIZE    := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000
TARGET_KERNEL_SOURCE := kernel/huawei/msm8916-caf
BOARD_DTBTOOL_ARGS := -2
TARGET_KERNEL_ARCH := arm

TARGET_KERNEL_CONFIG := g620s_defconfig
TARGET_VARIANT_CONFIG := g620s_defconfig
TARGET_SELINUX_CONFIG := g620s_defconfig

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 25165824
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1879048192
BOARD_USERDATAIMAGE_PARTITION_SIZE := 4513037312
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432

# tap2wak
TARGET_TAP_TO_WAKE_NODE := /sys/touch_screen/easy_wakeup_gesture

# Power
TARGET_POWERHAL_VARIANT := qcom

# Qualcomm support
BOARD_USES_QCOM_HARDWARE := true

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/fstab.qcom

# RIL
TARGET_RIL_VARIANT := caf

# FM
AUDIO_FEATURE_ENABLED_FM := true
TARGET_QCOM_NO_FM_FIRMWARE := true

# GPS
TARGET_NO_RPC := true
USE_DEVICE_SPECIFIC_GPS := true

# Liblight
TARGET_PROVIDES_LIBLIGHT := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_HAL_STATIC_LIBRARIES := libhealthd.msm
BOARD_HEALTHD_CUSTOM_CHARGER_RES := $(LOCAL_PATH)/charger/images

# Secure services
BOARD_USES_SECURE_SERVICES := true

# Enable keymaster app checking
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# CMHW
BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS := \
    device/huawei/g620s/cmhw \
    hardware/cyanogen/cmhw

#Enable HW based full disk encryption
TARGET_HW_DISK_ENCRYPTION := true

#Enable SW based full disk encryption
TARGET_SWV8_DISK_ENCRYPTION := true

TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true

MAX_VIRTUAL_DISPLAY_DIMENSION := 2048

TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# SELinux
include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
    $(LOCAL_PATH)/sepolicy

TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# Assert
TARGET_OTA_ASSERT_DEVICE := g620s,G620S,hwg620s,hwG620S,G620S-L01

# Enable dex pre-opt to speed up initial boot
ifeq ($(HOST_OS),linux)
  ifeq ($(WITH_DEXPREOPT),)
    WITH_DEXPREOPT := true
    WITH_DEXPREOPT_PIC := true
    ifneq ($(TARGET_BUILD_VARIANT),user)
      # Retain classes.dex in APK's for non-user builds
      DEX_PREOPT_DEFAULT := nostripping
    endif
  endif
endif

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
TARGET_USES_WCNSS_CTRL := true
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WPA_SUPPLICANT_VERSION := VER_0_8_X
