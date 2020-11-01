NAME := FTG-autostart
DATE := $(shell date "+%Y%m%d-%H%M")

ZIP := $(NAME)-v$(VER)-$(CODE).zip
INCLUDE := common/ install.sh META-INF/ module.prop
EXCLUDE := Makefile README.md *placeholder

ZIP := $(NAME)-$(DATE).zip


$(ZIP):
	@echo "Creating ZIP: $(ZIP)"
	@zip -r9 "$@" $(INCLUDE) -x $(EXCLUDE)
	@echo "`ls $(ZIP)` done."

push:
	@adb push $(ZIP) /sdcard/

clean:
	@-rm *.zip.
	@echo "Clean done."
