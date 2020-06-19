USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=NukeOffKeychain
PACKAGE_NAME=${TITLE}-${PACKAGE_VERSION}
REVERSE_DOMAIN=com.github.pbowden-msft.nukeoffkeychain
PACKAGE_VERSION=2.6
PAYLOAD=\
	pack-NukeOffKeychain \

REPO_URL=https://github.com/pbowden-msft/nukeoffkeychain.git

pack-NukeOffKeychain: l_usr_local_bin
	@sudo git clone ${REPO_URL} pbowden-msft-nukeoffkeychain
	@sudo ${CP} pbowden-msft-nukeoffkeychain/NukeOffKeychain ${WORK_D}/usr/local/bin/NukeOffKeychain
	@sudo chmod 755 ${WORK_D}/usr/local/bin/NukeOffKeychain
	@sudo chown root:wheel ${WORK_D}/usr/local/bin/NukeOffKeychain
	@sudo rm -rf pbowden-msft-nukeoffkeychain