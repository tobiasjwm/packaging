USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=BoxSyncDetector
PACKAGE_VERSION=1.0.1
PACKAGE_NAME=${TITLE}-${PACKAGE_VERSION}
REVERSE_DOMAIN=com.github.tobiasjwm
PAYLOAD=\
	pack-usr-local-munki-conditions-BoxSyncDetector.sh

l_usr_local_munki: l_usr_local
	@sudo mkdir -p ${WORK_D}/usr/local/munki
	@sudo chown -R root:wheel ${WORK_D}/usr/local/munki
	@sudo chmod -R 755 ${WORK_D}/usr/local/munki

l_usr_local_munki_conditions: l_usr_local_munki
	@sudo mkdir -p ${WORK_D}/usr/local/munki/conditions
	@sudo chown -R root:wheel ${WORK_D}/usr/local/munki/conditions
	@sudo chmod -R 755 ${WORK_D}/usr/local/munki/conditions

pack-usr-local-munki-conditions-%: % l_usr_local_munki_conditions
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/usr/local/munki/conditions