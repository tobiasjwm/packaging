include /usr/local/share/luggage/luggage.make
PB_EXTRA_ARGS+= --sign "Developer ID Installer: Tobias Morrison"

TITLE=updatenotifier
PACKAGE_VERSION=5.0
PACKAGE_NAME=${TITLE}-${PACKAGE_VERSION}
REVERSE_DOMAIN=com.github.tobiasjwm
PAYLOAD=\
	pack-Library-Management-bin-updatenotifier.py \
	pack-Library-LaunchAgents-com.github.tobiasjwm.updatenotifier.plist \
	pack-Library-Management-Utilities-gmit.png

l_Library_Management: l_Library
	@sudo mkdir -p ${WORK_D}/Library/Management
	@sudo chown root:wheel ${WORK_D}/Library/Management
	@sudo chmod 755 ${WORK_D}/Library/Management

l_Library_Management_bin: l_Library_Management
	@sudo mkdir -p ${WORK_D}/Library/Management/bin
	@sudo chown root:wheel ${WORK_D}/Library/Management/bin
	@sudo chmod 755 ${WORK_D}/Library/Management/bin

l_Library_Management_Utilities: l_Library_Management
	@sudo mkdir -p ${WORK_D}/Library/Management/Utilities
	@sudo chown root:wheel ${WORK_D}/Library/Management/Utilities
	@sudo chmod 755 ${WORK_D}/Library/Management/Utilities

pack-Library-Management-bin-%: % l_Library_Management_bin
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/Library/Management/bin

pack-Library-Management-Utilities-%: % l_Library_Management_Utilities
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/Library/Management/Utilities