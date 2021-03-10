# Copyright (C) 2019 The PixelDust Project
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

# Bootanimation
BOOTANIMATION := 1080

# Release name
PRODUCT_RELEASE_NAME := Pixel
export TARGET_DEVICE=sailfish

# We have our own power HAL
TARGET_USES_DEVICE_SPECIFIC_POWERHAL := true

# Use the AOSP stack
TARGET_USES_AOSP := true

# Use the sepolicies which are being shipped with our device
TARGET_EXCLUDE_QCOM_VENDOR_SEPOLICY := true

# Inherit AOSP device configuration for sailfish.
$(call inherit-product-if-exists, device/google/marlin/aosp_sailfish.mk)

# Include common PixelDust stuff
include vendor/pixeldust/configs/pixeldust_phone.mk

# Include optional stuff (e.g. prebuilt apps)
#include vendor/pixeldust/configs/system_optional.mk

# Google Apps
$(call inherit-product-if-exists, vendor/pixelgapps/pixel-gapps.mk)
REMOVE_GAPPS_PACKAGES += \
    CalculatorGooglePrebuilt \
    CalendarGooglePrebuilt \
    Chrome \
    DevicePersonalizationPrebuiltPixel2020 \
    DevicePolicyPrebuilt \
    DiagnosticsToolPrebuilt \
    Drive \
    FilesPrebuilt \
    GCS \
    GoogleContacts \
    GoogleContactsSyncAdapter \
    GoogleDialer \
    GoogleFeedback \
    GoogleTTS \
    Maps \
    NgaResources \
    PixelLiveWallpaperPrebuilt \
    pixel_experience_2019_midyear \
    pixel_experience_2019 \
    pixel_experience_2020_midyear \
    pixel_experience_2020 \
    Photos \
    PrebuiltBugle \
    PrebuiltDeskClockGoogle \
    PrebuiltGmail \
    RecorderPrebuilt \
    ScribePrebuilt \
    SoundAmplifierPrebuilt \
    SoundPickerPrebuilt \
    Tycho \
    YouTube \
    YouTubeMusicPrebuilt \
    WellbeingPrebuilt \
    talkback

# Setup device specific product configuration.
PRODUCT_NAME := pixeldust_sailfish
PRODUCT_PROPERTY_OVERRIDES += \
    ro.pixeldust.maintainer="spezi77" \
    ro.pixeldust.device="sailfish"
