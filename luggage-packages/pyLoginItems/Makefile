USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=pyLoginItems
PACKAGE_NAME=${TITLE}-${PACKAGE_VERSION}
REVERSE_DOMAIN=com.github.pudquick.pyLoginItems
PACKAGE_VERSION=1.1
PAYLOAD=\
	pack-pyLoginItems

REPO_URL=https://github.com/pudquick/pyLoginItems.git

pack-pyLoginItems: l_Library_Python_27_site_packages
	@sudo git clone ${REPO_URL} pudquick-pyLoginItems
	@sudo ${CP} pudquick-pyLoginItems/pyLoginItems.py ${WORK_D}/Library/Python/2.7/site-packages/pyLoginItems.py
	@sudo chmod 755 ${WORK_D}/Library/Python/2.7/site-packages/pyLoginItems.py
	@sudo chown root:wheel ${WORK_D}/Library/Python/2.7/site-packages/pyLoginItems.py
	@sudo rm -rf pudquick-pyLoginItems