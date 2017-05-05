USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=xkpasswd
PACKAGE_VERSION=2.0
PACKAGE_NAME=${TITLE}-${PACKAGE_VERSION}
REVERSE_DOMAIN=com.github.tobiasjwm
PAYLOAD=\
	pack-usr-local-xkpasswd.pm-sample_dict.txt
	pack-usr-local-xkpasswd.pm-XKPasswd.pm
	pack-usr-local-xkpasswd.pm-XKPasswd-Util.pm
	pack-usr-local-outset-login-once-install_xkpasswd.sh

l_usr_local_xkpasswd.pm: l_usr_local
	@sudo mkdir -p ${WORK_D}/usr/local/xkpasswd.pm
	@sudo chown -R root:wheel ${WORK_D}/usr/local/xkpasswd.pm
	@sudo chmod -R 755 ${WORK_D}/usr/local/xkpasswd.pm

l_usr_local_xkpasswd.pm_XKPasswd: l_usr_local_xkpasswd.pm
	@sudo mkdir -p ${WORK_D}/usr/local/xkpasswd.pm/XKPasswd
	@sudo chown -R root:wheel ${WORK_D}/usr/local/xkpasswd.pm/XKPasswd
	@sudo chmod -R 755 ${WORK_D}/usr/local/xkpasswd.pm/XKPasswd

pack-usr-local-xkpasswd.pm-%: % l_usr_local_xkpasswd.pm
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/usr/local/xkpasswd.pm

pack-usr-local-xkpasswd.pm-XKPasswd-%: % l_usr_local_xkpasswd.pm_XKPasswd
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/usr/local/xkpasswd.pm/XKPasswd