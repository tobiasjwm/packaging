USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=add-office2016-dock
PACKAGE_NAME=${TITLE}
REVERSE_DOMAIN=com.tobiasmorrison
PACKAGE_VERSION=1.1
PAYLOAD=\
	pack-Library-Management-scriptRunner-once-add-office2016-dock-2016-05-14.sh

l_Library_Management: l_Library
	@sudo mkdir -p ${WORK_D}/Library/Management
	@sudo chown root:wheel ${WORK_D}/Library/Management
	@sudo chmod 755 ${WORK_D}/Library/Management

l_Library_Management_bin: l_Library_Management
	@sudo mkdir -p ${WORK_D}/Library/Management/bin
	@sudo chown root:wheel ${WORK_D}/Library/Management/bin
	@sudo chmod 755 ${WORK_D}/Library/Management/bin

l_Library_Management_scriptRunner: l_Library_Management
	@sudo mkdir -p ${WORK_D}/Library/Management/scriptRunner
	@sudo chown root:wheel ${WORK_D}/Library/Management/scriptRunner
	@sudo chmod 755 ${WORK_D}/Library/Management/scriptRunner

l_Library_Management_scriptRunner_once: l_Library_Management_scriptRunner
	@sudo mkdir -p ${WORK_D}/Library/Management/scriptRunner/once
	@sudo chown root:wheel ${WORK_D}/Library/Management/scriptRunner/once
	@sudo chmod 755 ${WORK_D}/Library/Management/scriptRunner/once

pack-Library-Management-scriptRunner-once-%: % l_Library_Management_scriptRunner_once
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/Library/Management/scriptRunner/once
