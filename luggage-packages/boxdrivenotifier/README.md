# boxdrivenotifier

A script and LaunchAgent to notify employees that Box Drive is available and point them to a Munki self-serve install.

This project requires that Yo! 2.0 or > is installed on a device. For more information, see the [Yo! Github repo](https://github.com/sheagcraig/yo).

## v 1.1.1

- Fixed an issue where script would fail due to a missing comma
- Fixed errant quote mark

## v 1.1 

- **Changes for Yo! 2.0**
- Refactored the script to work with Yo! 2.0 by removing custom icon (we build our own Yo with our icon).
- Changed Action button to push the employee to MSC item instead of into document.

Ignore the things in `nopkg_testing`. I can't ever throw things away. 