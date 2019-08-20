USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=exhibitStickers
PACKAGE_VERSION=1.0
PACKAGE_NAME=${TITLE}-${PACKAGE_VERSION}
REVERSE_DOMAIN=com.github.tobiasjwm
PAYLOAD=\
	pack-Library-Management-Utilities-Exhibit_Stamp.pdf \
	pack-usr-local-outset-login-once-install_exhibitStickers.sh

l_Library_Management: l_Library
	@sudo mkdir -p ${WORK_D}/Library/Management
	@sudo chown root:wheel ${WORK_D}/Library/Management
	@sudo chmod 755 ${WORK_D}/Library/Management

l_Library_Management_Utilities: l_Library_Management
	@sudo mkdir -p ${WORK_D}/Library/Management/Utilities
	@sudo chown root:wheel ${WORK_D}/Library/Management/Utilities
	@sudo chmod 755 ${WORK_D}/Library/Management/Utilities

pack-Library-Management-Utilities-%: % l_Library_Management_Utilities
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/Library/Management/Utilities