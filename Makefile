include settings.mk

compile:
	cd $(PROJECT_PATH)/build; make APP=$(APP_NAME)

clean:
	cd $(PROJECT_PATH)/build; make clean

all: clean compile

.PHONY: clean compile
