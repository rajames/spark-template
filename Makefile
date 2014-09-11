include settings.mk

ifndef APP
APP_NAME=$(DEFAULT_APP)
else
APP_NAME=$(APP)
endif

compile:
	cd $(FIRMWARE_PATH)/build; make APP=$(APP_NAME)

clean:
	cd $(FIRMWARE_PATH)/build; make clean

which:
	@echo "I will compile the $(APP_NAME) application"
	@echo "I will use the firmware at $(FIRMWARE_PATH)"

all: clean compile

.PHONY: clean compile
