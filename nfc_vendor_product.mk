# Enable build support for NFC open source vendor modules
ifeq ($(call is-board-platform-in-list, msm8937 msm8953),true)
TARGET_USES_NQ_NFC := true
ifeq ($(TARGET_PRODUCT),msm8937_32go)
TARGET_USES_NQ_NFC := false
endif
endif

NQ_VENDOR_NFC += vendor.nxp.hardware.nfc@1.2-service
NQ_VENDOR_NFC += nfc_nci.nqx.default
NQ_VENDOR_NFC += nfc_nci.nqx.default.hw
NQ_VENDOR_NFC += nfc_nci.sn100.default
NQ_VENDOR_NFC += nfc_nci.sn100.default.hw

ifeq ($(strip $(TARGET_USES_NQ_NFC)),true)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml \
    vendor/nxp/opensource/halimpl/halimpl/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    vendor/nxp/opensource/halimpl/SN100x/halimpl/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci_SN100.conf

PRODUCT_PACKAGES += $(NQ_VENDOR_NFC)
endif
