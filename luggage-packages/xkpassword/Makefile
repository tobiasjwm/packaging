USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=xkpasswd
PACKAGE_VERSION=1.1
PACKAGE_NAME=${TITLE}-${PACKAGE_VERSION}
REVERSE_DOMAIN=com.tobiasmorrison
PAYLOAD=\
	pack-usr-local-xkpasswd.pm-sample_dict.txt \
	pack-usr-local-xkpasswd.pm-XKPasswd.pm \
	pack-usr-local-xkpasswd.pm-XKPasswd-Util.pm \
	pack-usr-local-outset-login-once-install_xkpasswd.sh \
	unbz2-Library-Management-xkpasswd-Best_Password.workflow \
	unbz2-Library-Management-xkpasswd-Better_Password.workflow \
	unbz2-Library-Management-xkpasswd-Good_Password.workflow

l_usr_local_xkpasswd.pm: l_usr_local
	@sudo mkdir -p ${WORK_D}/usr/local/xkpasswd.pm
	@sudo chown -R root:wheel ${WORK_D}/usr/local/xkpasswd.pm
	@sudo chmod -R 755 ${WORK_D}/usr/local/xkpasswd.pm

l_usr_local_xkpasswd.pm_XKPasswd: l_usr_local_xkpasswd.pm
	@sudo mkdir -p ${WORK_D}/usr/local/xkpasswd.pm/XKPasswd
	@sudo chown -R root:wheel ${WORK_D}/usr/local/xkpasswd.pm/XKPasswd
	@sudo chmod -R 755 ${WORK_D}/usr/local/xkpasswd.pm/XKPasswd

l_Library_Management: l_Library
	@sudo mkdir -p ${WORK_D}/Library/Management
	@sudo chown root:wheel ${WORK_D}/Library/Management
	@sudo chmod 755 ${WORK_D}/Library/Management

l_Library_Management_xkpasswd: l_Library_Management
	@sudo mkdir -p ${WORK_D}/Library/Management/xkpasswd
	@sudo chown root:wheel ${WORK_D}/Library/Management/xkpasswd
	@sudo chmod 755 ${WORK_D}/Library/Management/xkpasswd

pack-usr-local-xkpasswd.pm-%: % l_usr_local_xkpasswd.pm
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/usr/local/xkpasswd.pm

pack-usr-local-xkpasswd.pm-XKPasswd-%: % l_usr_local_xkpasswd.pm_XKPasswd
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/usr/local/xkpasswd.pm/XKPasswd

unbz2-Library-Management-xkpasswd-Best_Password.workflow: Best_Password.workflow.tar.bz2 l_Library_Management_xkpasswd
	@sudo ${TAR} xfj Best_Password.workflow.tar.bz2 -C ${WORK_D}/Library/Management/xkpasswd
	@sudo chown -R root:wheel "${WORK_D}/Library/Management/xkpasswd/Best Password.workflow"

unbz2-Library-Management-xkpasswd-Better_Password.workflow: Better_Password.workflow.tar.bz2 l_Library_Management_xkpasswd
	@sudo ${TAR} xfj Better_Password.workflow.tar.bz2 -C ${WORK_D}/Library/Management/xkpasswd
	@sudo chown -R root:wheel "${WORK_D}/Library/Management/xkpasswd/Better Password.workflow"

unbz2-Library-Management-xkpasswd-Good_Password.workflow: Good_Password.workflow.tar.bz2 l_Library_Management_xkpasswd
	@sudo ${TAR} xfj Good_Password.workflow.tar.bz2 -C ${WORK_D}/Library/Management/xkpasswd
	@sudo chown -R root:wheel "${WORK_D}/Library/Management/xkpasswd/Good Password.workflow"