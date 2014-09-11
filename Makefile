include settings.mk

LINK=ln -s
RM=rm -rf

ifndef APP
APP_NAME=$(DEFAULT_APP)
else
APP_NAME=$(APP)
endif

compile:
	@make link
	cd $(FIRMWARE_PATH)/build; make APP=$(APP_NAME) TARGETDIR=$(BUILD_PATH)
	@make unlink

clean:
	@make unlink
	cd $(FIRMWARE_PATH)/build; make clean

unlink:
	$(foreach app,$(APPLICATIONS),$(shell $(RM) $(FIRMWARE_PATH)/applications/$(app)))
	@make apps

link: unlink
	$(foreach app,$(APPLICATIONS),$(shell $(LINK) $(PWD)/$(APPLICATIONS_PATH)/$(app) $(FIRMWARE_PATH)/applications/$(app)))
	@make apps

apps:
	@echo "Applications in $(FIRMWARE_PATH)/applications"
	@ls -l $(FIRMWARE_PATH)/applications

which:
	@echo "I will compile the $(APP_NAME) application"
	@echo "I will use the firmware at $(FIRMWARE_PATH)"

upload:
	spark flash --usb $(BUILD_PATH)/$(APP_NAME).bin

all: clean compile

.PHONY: clean compile apps link which upload
