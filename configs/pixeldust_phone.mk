# Copyright (C) 2018-2020 The PixelDust Project
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

include vendor/pixeldust/configs/aosp_fixes.mk
include vendor/pixeldust/configs/audio.mk
include vendor/pixeldust/configs/bootanimation.mk
include vendor/pixeldust/configs/fu.mk
include vendor/pixeldust/configs/pixeldust_main.mk
include vendor/pixeldust/configs/pixeldust_optimizations.mk
include vendor/pixeldust/configs/system_additions.mk
include vendor/pixeldust/configs/system_sepolicy.mk
include vendor/pixeldust/configs/version.mk
include vendor/pixeldust/configs/ota.mk
include vendor/pixeldust/configs/pixel_apns.mk
include vendor/pixeldust/configs/telephony.mk

ifeq ($(BUILD_VERSION_CODE),caf)
include vendor/pixeldust/configs/system_caf.mk
endif

ifndef TARGET_EXCLUDE_GOOGLE_APEX
  TARGET_EXCLUDE_GOOGLE_APEX := false
endif
ifeq ($(TARGET_EXCLUDE_GOOGLE_APEX),false)
include vendor/pixeldust/configs/apex.mk
endif

ifneq ($(filter blueline coral crosshatch flame,$(TARGET_DEVICE)),)
# Inherit from our vendor sepolicy config
$(call inherit-product, vendor/pixeldust/configs/vendor_sepolicy.mk)

# Include Smart Charging overlays
DEVICE_PACKAGE_OVERLAYS += \
    vendor/pixeldust/overlay-smartcharging
endif

# Telephony packages
PRODUCT_PACKAGES += \
    Stk \
    CellBroadcastReceiver

# Gboard configuration
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.ime.bs_theme=true \
    ro.com.google.ime.theme_id=5 \
    ro.com.google.ime.system_lm_dir=/product/usr/share/ime/google/d3_lms

# SetupWizard configuration
PRODUCT_PRODUCT_PROPERTIES += \
    ro.setupwizard.enterprise_mode=1 \
    ro.setupwizard.esim_cid_ignore=00000001 \
    ro.setupwizard.rotation_locked=true \
    setupwizard.enable_assist_gesture_training=true \
    setupwizard.feature.baseline_setupwizard_enabled=true \
    setupwizard.feature.device_default_dark_mode=true \
    setupwizard.feature.show_pai_screen_in_main_flow.carrier1839=false \
    setupwizard.feature.show_pixel_tos=true \
    setupwizard.feature.skip_button_use_mobile_data.carrier1839=true \
    setupwizard.theme=glif_v3_light

# StorageManager configuration
PRODUCT_PRODUCT_PROPERTIES += \
    ro.storage_manager.show_opt_in=false

# Google legal
PRODUCT_PRODUCT_PROPERTIES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html

# Google Play services configuration
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.clientidbase=android-google \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent

# CarrierSetup configuration
PRODUCT_PRODUCT_PROPERTIES += \
    ro.carriersetup.vzw_consent_page=true

# Use gestures by default
PRODUCT_PRODUCT_PROPERTIES += \
    ro.boot.vendor.overlay.theme=com.android.internal.systemui.navbar.gestural

