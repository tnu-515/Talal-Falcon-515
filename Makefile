ARCHS = arm64 arm64e
DEBUG = 0
FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = TalalFalcon
TalalFalcon_FILES =Tweak.x
TalalFalcon_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
