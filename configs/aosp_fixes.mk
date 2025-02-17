# Copyright (C) 2019-2020 The PixelDust Project
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

# Google property overides
PRODUCT_PRODUCT_PROPERTIES += \
    keyguard.no_require_sim=true \
    ro.com.android.dataroaming=false \
    ro.carrier=unknown \
    ro.opa.eligible_device=true \
    net.tethering.noprovisioning=true

# Build
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true

# Build missing packages to prevent zip signing failure
PRODUCT_HOST_PACKAGES += \
    signapk \
    avbtool \
    brotli \
    aapt2 \
    deapexer \
    debugfs \
    zipalign \
    apexer \
    brillo_update_payload
