#
# Copyright (C) 2018-2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o_mr1.mk)

# Inherit some common lineage stuff
$(call inherit-product, vendor/lineage/config/common.mk)
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_FACE_UNLOCK_SUPPORTED := true

# CherishOS
CHERISH_BUILD_TYPE=UNOFFICIAL
TARGET_USES_MINI_GAPPS := true
USE_PIXEL_CHARGING := true
TARGET_INCLUDE_CARRIER_SETTINGS := true
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.cherish.maintainer=ZualoliconVN
    
# Spoof build description/fingerprint as pixel device
TARGET_USE_PIXEL_FINGERPRINT := true

# Customized GMS Flags 
# WITH_GMS flag is required
# Opt out of google dialer support, compiler will build aosp dialer,
# package type will change from PIXEL -> GMS
TARGET_OPTOUT_GOOGLE_TELEPHONY := false

# Compiler will only build GMS playstore services, its dependencies, and Gboard app.
# package type will change from PIXEL/GMS -> CORE
TARGET_CORE_GMS := true

# extra flag under TARGET_CORE_GMS
TARGET_CORE_GMS_EXTRAS := false

# Memory properties
# Tune these properties according to device perfconfigstore.xml(if available)/device capabilities.
# These props are overridable
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.fw.bg_apps_limit?=48 \
    persist.sys.fw.use_trim_settings?=true \
    persist.sys.fw.empty_app_percent?=50 \
    persist.sys.fw.trim_empty_percent?=100 \
    persist.sys.fw.trim_cache_percent?=100 \
    persist.sys.fw.trim_enable_memory?=2147483648 \
    persist.sys.fw.bservice_age?=120000 \
    persist.sys.fw.bservice_limit?=6 \
    persist.sys.fw.bservice_enable?=true

# Adapted LMKD [1] & [2]
# kill_heaviest_task_dup
ro.lmk.kill_heaviest_task=true
# kill_timeout_ms_dup
ro.lmk.kill_timeout_ms=100
# thrashing_threshold
ro.lmk.thrashing_limit=30
# thrashing_decay
ro.lmk.thrashing_limit_decay=5
# nstrat_low_swap
ro.lmk.swap_free_low_percentage=10
# nstrat_psi_partial_ms
ro.lmk.psi_partial_stall_ms=70
# nstrat_psi_complete_ms
ro.lmk.psi_complete_stall_ms=70
# use_new_strategy_dup
ro.lmk.use_new_strategy=true

# CLO lmkd [1] - others were not defined (will use default values from lmkd binary)
ro.lmk.psi_scrit_complete_stall_ms=75
ro.lmk.nstrat_wmark_boost_factor=4
ro.lmk.enable_watermark_check=true
ro.lmk.enable_userspace_lmk=true
ro.lmk.super_critical=701
ro.lmk.direct_reclaim_pressure=45
ro.lmk.reclaim_scan_threshold=0

# app compaction - [1] & [2]
# disabled app compaction due to app freezes when switching tasks
persist.sys.appcompact.enable_app_compact=false
persist.sys.appcompact.full_compact_type=2
persist.sys.appcompact.some_compact_type=4
persist.sys.appcompact.compact_throttle_somesome=5000
persist.sys.appcompact.compact_throttle_somefull=10000
persist.sys.appcompact.compact_throttle_fullsome=500
persist.sys.appcompact.compact_throttle_fullfull=10000
persist.sys.appcompact.compact_throttle_bfgs=600000
persist.sys.appcompact.compact_throttle_persistent=600000
persist.sys.appcompact.rss_throttle_kb=12000
persist.sys.appcompact.delta_rss_throttle_kb=8000
persist.sys.perf.topAppRenderThreadBoost.enable=false

# Inherit from whyred device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

PRODUCT_BRAND := Xiaomi
PRODUCT_DEVICE := whyred
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_NAME := cherish_whyred
PRODUCT_MODEL := Redmi Note 5 Pro

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

TARGET_VENDOR_PRODUCT_NAME := whyred

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="whyred-user 8.1.0 OPM1.171019.011 V9.5.11.0.OEIMIFA release-keys"

BUILD_FINGERPRINT := xiaomi/whyred/whyred:8.1.0/OPM1.171019.011/V9.5.11.0.OEIMIFA:user/release-keys
