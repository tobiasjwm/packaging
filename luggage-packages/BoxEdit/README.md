# Box Tools Package Installer

This solution requires [outset](https://github.com/chilcote/outset) to configure the local user settings. The script 'boxedit-install.sh' is installed in the `/usr/local/outset/login-once` directory.

To build the pkg, you will also need [The Luggage](https://github.com/unixorn/luggage). The example Makefile depends on having a luggage.local file with outset values in it. You can find out how to create those items in [this article](https://globalmac-it.itglue.com/DOC-1673628-851011).


## Build the pkg

1. Download the Install Box Tools.app. Grab it from the [Box App Installers Downloads Page](https://www.box.com/resources/downloads).
2. Mount the DMG and move the app to your build directory.
3. Tar the app.
	`% tar cvjf Install_Box_Tools.app.tar.bz2 ./Install\ Box\ Tools.app
4. Update the `PACKAGE_VERSION` number in the Makefile
5. Build the pkg `sudo make pkg`