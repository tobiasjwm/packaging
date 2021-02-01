USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=Unlicense
PACKAGE_NAME=${TITLE}-${PACKAGE_VERSION}
REVERSE_DOMAIN=com.github.unlicense
PACKAGE_VERSION=3.4
PAYLOAD=\
	pack-Unlicense \

REPO_URL=https://github.com/pbowden-msft/Unlicense.git

pack-Unlicense: l_usr_local_bin
	@sudo git clone ${REPO_URL} pbowden-msft-unlicense
	@sudo ${CP} pbowden-msft-unlicense/Unlicense ${WORK_D}/usr/local/bin/Unlicense
	@sudo chmod 755 ${WORK_D}/usr/local/bin/Unlicense
	@sudo chown root:wheel ${WORK_D}/usr/local/bin/Unlicense
	@sudo rm -rf pbowden-msft-unlicense