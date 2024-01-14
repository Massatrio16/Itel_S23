#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/itel/S665L

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    dtbo \
    boot \
    system \
    system \
    system_ext \
    vendor \
    product \
    vendor_dlkm \
vendor_boot

#UNISOC HARDWARE
BOARD_USES_UNISOC_HARDWARE := true
BOARD_HAS_UNISOC_HARDWARE := true
UNISOC_HARDWARE := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := generic


# BootL
TARGET_BOOTLOADER_BOARD_NAME := S665L
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true



# Display
TARGET_SCREEN_DENSITY := 320

# Kernel
TARGET_NO_KERNEL := true
BOARD_BOOTIMG_HEADER_VERSION := 4
BOARD_VENDOR_BASE := 0x00000000
BOARD_VENDOR_CMDLINE := bootopt=64S3,32N2,64N2 console=ttyS1,115200n8 buildvariant=user
BOARD_PAGE_SIZE := 4096
BOARD_RAMDISK_OFFSET := 0x05400000
BOARD_TAGS_OFFSET := 0x00000100
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_DTB_OFFSET := 0x01f00000
BOARD_RAMDISK_USE_LZ4 := true
BOARD_MKBOOTING_ARGS += --pagesize $(BOARD_PAGE_SIZE)
BOARD_MKBOOTIMG_ARGS += --base $(BOARD_VENDOR_BASE)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --vendor_cmdline $(BOARD_VENDOR_CMDLINE)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)


TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)


# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 104857600
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 104857600

BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := itel_dynamic_partitions
BOARD_ITEL_DYNAMIC_PARTITIONS_PARTITION_LIST := system system system_ext vendor product vendor_dlkm
BOARD_ITEL_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value
BOARD_SYSTEMIMAGE_PARTITION_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
# Platform
TARGET_BOARD_PLATFORM := ums9230

# Recovery
BOARD_USES_RECOVERY_AS_BOOT := true
TW_HAS_NO_RECOVERY_PARTITION := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
#BOARD_USES_GENERIC_KERNEL_IMAGE := true
#BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
#BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_SECURE_ERASE := true
TARGET_NO_RECOVERY := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vendor-files/*:/path/in/vendor_boot/

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# Encryption
TW_INCLUDE_CRYPTO := true
BOARD_USES_METADATA_PARTITION := true
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION := 12
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# Security patch level

# Verified boot
BOARD_AVB_ENABLE := true




# Hack: prevent anti rollback

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_DEVICE_VERSION := Massatrio16
RECOVERY_SDCARD_ON_DATA := true
TARGET_USES_MKE2FS := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.usb0/lun.%d/file
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_DEFAULT_BRIGHTNESS := 1200
TW_MAX_BRIGHTNESS := 2047

TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_PYTHON := true
TW_EXCLUDE_NANO := true
TW_EXCLUDE_APEX := true
TW_EXCLUDE_TWRPAPP := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_NO_SCREEN_BLANK := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true
TW_HAS_MTP := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_FUSE_EXFAT := true
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_LPTOOLS := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_NO_FLASH_CURRENT_TWRP := true
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true

