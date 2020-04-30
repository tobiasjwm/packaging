#!/bin/bash

# exit on any error. This is an attempt to overcome the fact that the vendor's 
# install script does not exit gracefully.
set -e

# munki postinstall_script for OverSight.app
/Library/Management/bin/OverSight_Installer.app/Contents/MacOS/OverSight_Installer -install
