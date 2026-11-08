TARGET := iphone:clang:latest:16.0
ARCHS := arm64 arm64e
THEOS_PACKAGE_SCHEME = roothide

# Nama executable app MT5 (verifikasi dengan: class-dump atau cek Info.plist "CFBundleExecutable")
INSTALL_TARGET_PROCESSES = MetaTrader 5

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = LiquidGlassMT5
LiquidGlassMT5_FILES = Tweak.x
LiquidGlassMT5_CFLAGS = -fobjc-arc -Wno-deprecated-declarations
LiquidGlassMT5_FRAMEWORKS = UIKit QuartzCore

include $(THEOS_MAKE_PATH)/tweak.mk
