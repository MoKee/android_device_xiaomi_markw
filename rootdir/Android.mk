LOCAL_PATH := $(call my-dir)

# Device Script
include $(CLEAR_VARS)
LOCAL_MODULE       := init.markw.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := init.markw.rc
LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_ETC)/init
include $(BUILD_PREBUILT)
