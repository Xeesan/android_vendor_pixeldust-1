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

# Pixel Dust ROM versioning
BUILD_ID_LC := $(shell echo $(BUILD_ID) | tr '[:upper:]' '[:lower:]')

PD_ROM_MAJ_VERSION := PixelDust-Eleven
ANDROID_OS_VERSION := 11.0.0
BUILD_VERSION_CODE := caf

ifndef SIGN_KEY
  PD_BUILDTYPE := UNOFFICIAL
endif
BUILD_TIMESTAMP := $(shell date -u +%s)

# Pixel Dust ROM package name 
PIXELDUST_VERSION := $(PD_ROM_MAJ_VERSION)-$(BUILD_VERSION_CODE)-$(TARGET_DEVICE)-$(TARGET_BUILD_VARIANT)-$(shell date +%Y%m%d-%H%M)

PRODUCT_BUILD_PROP_OVERRIDES := TARGET_BUILD_TYPE=user

PRODUCT_PRODUCT_PROPERTIES += \
    com.pixeldust.fingerprint=$(PIXELDUST_VERSION) \
    ro.pixeldust.version=$(PD_ROM_MAJ_VERSION)-$(BUILD_VERSION_CODE)-$(TARGET_DEVICE)-$(PD_BUILDTYPE) \
    ro.pixeldust.ota.version=$(ANDROID_OS_VERSION) \
    ro.pixeldust.ota.version_code=$(BUILD_VERSION_CODE) \
    ro.pixeldust.ota.timestamp=$(BUILD_TIMESTAMP)

# Override product info for Google Play Services and SafetyNet
ifeq ($(PRODUCT_OVERRIDE_INFO),true)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.flavor=$(PRODUCT_OVERRIDE_NAME)-user \
    ro.build.stock_fingerprint=$(PRODUCT_OVERRIDE_FINGERPRINT) \

# Description needs special treatment because it contains spaces
PRIVATE_BUILD_DESC := $(PRODUCT_OVERRIDE_DESC)
endif

