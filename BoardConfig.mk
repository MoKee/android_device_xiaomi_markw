#
# Copyright (C) 2017 The LineageOS Project
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

# Target kernel, must be set before inheriting common tree
TARGET_KERNEL_VERSION := 3.18

# Inherit from common msm8953-common
-include device/xiaomi/msm8953-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/markw

# Audio
AUDIO_FEATURE_ENABLED_EXT_AMPLIFIER := true

# Filesystem
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Kernel
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
TARGET_KERNEL_CONFIG := markw_defconfig
TARGET_KERNEL_SOURCE := kernel/xiaomi/markw

# Partitions
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_USERDATAIMAGE_PARTITION_SIZE := 25765043200 # 25765059584 - 16384
BOARD_VENDORIMAGE_PARTITION_SIZE := 536870912

# Power
TARGET_TAP_TO_WAKE_NODE := "/proc/gesture/onoff"

# Security patch level
VENDOR_SECURITY_PATCH := 2018-04-01

# Shims
TARGET_LD_SHIM_LIBS += \
    /vendor/bin/mm-qcamera-daemon|libshims_qcamera-daemon.so \
    /vendor/lib64/hw/gxfingerprint.default.so|fakelogprint.so:/vendor/lib64/hw/fingerprint.goodix.so|fakelogprint.so:/vendor/bin/gx_fpd|fakelogprint.so

# Treble
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
PRODUCT_FULL_TREBLE_OVERRIDE := true

# Inherit from the proprietary version
-include vendor/xiaomi/markw/BoardConfigVendor.mk
