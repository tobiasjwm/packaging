USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=FirefoxSpecial
PACKAGE_NAME=${TITLE}-${PACKAGE_VERSION}
REVERSE_DOMAIN=com.globalmacit.pkg.Mozilla_Firefox_SPC.EN
PACKAGE_VERSION=1.0
PAYLOAD=\
	unbz2-bin-Firefox_SPC.app \
	pack-usr-local-outset-login-once-install-firefox_SPC-local.sh \
	pack-usr-local-outset-on-demand-run-login-once.sh \
	pack-script-postinstall

l_Library_Management: l_Library
	@sudo mkdir -p ${WORK_D}/Library/Management
	@sudo chown root:wheel ${WORK_D}/Library/Management
	@sudo chmod 755 ${WORK_D}/Library/Management

l_Library_Management_bin: l_Library_Management
	@sudo mkdir -p ${WORK_D}/Library/Management/bin
	@sudo chown root:wheel ${WORK_D}/Library/Management/bin
	@sudo chmod 755 ${WORK_D}/Library/Management/bin

unbz2-bin-%: %.tar.bz2 l_Library_Management_bin
	@sudo ${TAR} xjf "${<}" -C ${WORK_D}/Library/Management/bin
	@sudo chown -R root:admin ${WORK_D}/Library/Management/bin/"$(shell echo "${<}" | sed s/\.tar\.bz2//g)"

pack-Library-Management-Utilities-%: % l_Library_Management_Utilities
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/Library/Management/Utilities