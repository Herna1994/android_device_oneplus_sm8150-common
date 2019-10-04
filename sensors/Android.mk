LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := android.hardware.sensors@1.0-service.oneplus_msmnile
LOCAL_MODULE_TAGS  := optional

LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/bin
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE_STEM := android.hardware.sensors@1.0-service

LOCAL_SRC_FILES := \
    service.cpp

LOCAL_REQUIRED_MODULES := \
    android.hardware.sensors@1.0-service.oneplus_msmnile.rc

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libcutils \
    libdl \
    libbase \
    libbinder \
    libutils \
    libhidlbase \
    libhidltransport \
    libhwbinder \
    android.hardware.sensors@1.0

LOCAL_CFLAGS := -DARCH_ARM_32

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_MODULE := aandroid.hardware.sensors@1.0-service.oneplus_msmnile.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC

LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/init
LOCAL_MODULE_STEM := android.hardware.sensors@1.0-service.rc

LOCAL_SRC_FILES := android.hardware.sensors@1.0-service.oneplus_msmnile.rc

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE := sensors.$(TARGET_BOARD_PLATFORM)

LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_PROPRIETARY_MODULE := true

LOCAL_CFLAGS := -Wall -Werror -DLOG_TAG=\"MultiHal\"

LOCAL_SRC_FILES := \
    multihal.cpp \
    SensorEventQueue.cpp \

LOCAL_SHARED_LIBRARIES := \
    libcutils \
    libdl \
    liblog \
    libutils \

LOCAL_STRIP_MODULE := false

include $(BUILD_SHARED_LIBRARY)

include $(call all-makefiles-under, $(LOCAL_PATH))
