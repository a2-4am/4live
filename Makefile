#
# 4LIVE Makefile
# assembles source code, optionally builds a disk image and mounts it
#
# original by Quinn Dunki on 2014-08-15
# One Girl, One Laptop Productions
# http://www.quinndunki.com/blondihacks
#
# adapted by 4am on 2016-10-16
#

# program name
PGM=4live
A2PGM=_4LIVE

# project subdirectories
BIN=bin
BUILD=build
RES=res
SRC=src

# project files
BLANKDISK=$(RES)/work.dsk
BUILDDISK=$(BUILD)/$(PGM).dsk

# third-party tools required to build
# https://sourceforge.net/projects/acme-crossass/
ACME=/usr/local/bin/acme
# https://sourceforge.net/projects/applecommander/
AC=$(BIN)/AppleCommander.jar


all: $(PGM)

clean:
	rm -rf $(BUILD)

$(PGM):
	mkdir -p $(BUILD)
	cd $(SRC) && $(ACME) -o ../$(BUILD)/$(PGM) $(PGM).a && cd -
	cp $(BLANKDISK) $(BUILDDISK)
	java -jar $(AC) -p $(BUILDDISK) $(A2PGM) B 0x8000 < $(BUILD)/$(PGM)
	osascript $(BIN)/V2Make.scpt "`pwd`" $(BUILDDISK)
