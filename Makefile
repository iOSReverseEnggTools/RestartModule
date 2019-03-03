export ARCHS = arm64
DEBUG = 0
export TARGET = iphone:clang:11.2
GO_EASY_ON_ME = 1

PACKAGE_VERSION = 1.0

export SYSROOT = $(THEOS)/sdks/iPhoneOS11.2.sdk

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = RestartModule
RestartModule_FILES = $(wildcard *.m)
RestartModule_CFLAGS +=  -fobjc-arc -I$(THEOS_PROJECT_DIR)/headers
RestartModule_LDFLAGS += $(THEOS_PROJECT_DIR)/Frameworks/ControlCenterUIKit.tbd
RestartModule_FRAMEWORKS += UIKit
RestartModule_INSTALL_PATH = /Library/ControlCenter/Bundles

include $(THEOS_MAKE_PATH)/bundle.mk
