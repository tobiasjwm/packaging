USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=BoxEdit
PACKAGE_VERSION=4.0.5
PACKAGE_NAME=${TITLE}-${PACKAGE_VERSION}
REVERSE_DOMAIN=com.box.Box-Edit-Installer
PAYLOAD= \
    pack-usr-local-outset-login-once-boxedit-install.sh \
    pack-Library-Profiles-BoxToolsProxy.mobileconfig \
    unbz2-application-Install_Box_Tools.app
 
unbz2-application-Install_Box_Tools.app: Install_Box_Tools.app.tar.bz2 l_Applications
	@SUDO ${TAR} xfj Install_Box_Tools.app.tar.bz2 -C ${WORK_D}/Applications
	@SUDO chown -R root:admin "${WORK_D}/Applications/Install Box Tools.app"

l_Library_Profiles: l_Library
	@sudo mkdir -p ${WORK_D}/Library/Profiles
	@sudo chown root:admin ${WORK_D}/Library/Profiles
	@sudo chmod 775 ${WORK_D}/Library/Profiles

pack-Library-Profiles-%: % l_Library_Profiles
	@sudo ${INSTALL} -m 644 -g admin -o root "${<}" ${WORK_D}/Library/Profiles