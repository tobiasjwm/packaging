USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=OutlookResetRecentAddresses
PACKAGE_NAME=${TITLE}-${PACKAGE_VERSION}
REVERSE_DOMAIN=com.microsoft.OutlookResetRecentAddresses
PACKAGE_VERSION=1.0
PAYLOAD=\
	unbz2-bin-OutlookResetRecentAddresses.app

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