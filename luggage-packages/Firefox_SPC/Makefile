USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=Firefox_SPC
PACKAGE_NAME=${TITLE}-${PACKAGE_VERSION}
REVERSE_DOMAIN=com.globalmacit.pkg.Mozilla_Firefox_SPC.EN
PACKAGE_VERSION=51.0.1
PAYLOAD=\
	pack-Library-Management-Utilities-Firefox_SPC_51.0.1_EN.dmg \
	pack-usr-local-outset-login-once-install-firefox_SPC-local.sh

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