# exhibitStickers

This pkg is designed to install the file Exhibit_Stamp.pdf in the path `~/Library/Application Support/Adobe/Acrobat/DC/Stamps/`. Since the file needs to be in userland, we are leveraging [Outset][1] to run our script as the logged in user using the login-once function.

The pkg will install the source file in `Library/Management/Utilities`. This will be available for future installs or manual installs.

Adobe requires that Acrobat is not running when adding these files. A smart programmer would account for this, but since we are running the script at login, there should be no collision and I have a million other things to do.

Since this is a replacement of existing Exhibit Stamps, we are also checking the folder for the old file, removing if necessary, then completing our install.


[1]:https://github.com/chilcote/outset/wiki