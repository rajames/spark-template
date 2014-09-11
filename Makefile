compile:
	cd core-firmware/build; make

clean:
	cd core-firmware/build; make clean

all: clean compile

.PHONY: clean compile
