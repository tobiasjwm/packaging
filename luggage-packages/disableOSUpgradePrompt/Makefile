USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=disableOSUpgradePrompt
PACKAGE_VERSION=1.0
PACKAGE_NAME=${TITLE}-${PACKAGE_VERSION}
REVERSE_DOMAIN=com.github.tobiasjwm
PAYLOAD=\
	pack-Library-Bundles-OSXNotification.bundle \
	pack-script-preinstall

l_Library_Bundles: l_Library
	@sudo mkdir -p ${WORK_D}/Library/Bundles
	@sudo chown root:admin ${WORK_D}/Library/Bundles
	@sudo chmod 775 ${WORK_D}/Library/Bundles

pack-Library-Bundles-%: % l_Library_Bundles
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/Library/Bundles

modify_packageroot:
	@sudo chflags schg ${WORK_D}/Library/Bundles/OSXNotification.bundle
