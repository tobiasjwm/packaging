#!/bin/bash

DOCKUTIL=/usr/local/bin/dockutil

$DOCKUTIL --remove '/Applications/Microsoft Office 2011/Microsoft Word.app' --no-restart

$DOCKUTIL --remove '/Applications/Microsoft Office 2011/Microsoft Excel.app' --no-restart

$DOCKUTIL --remove '/Applications/Microsoft Office 2011/Microsoft PowerPoint.app' --no-restart

$DOCKUTIL --remove '/Applications/Microsoft Office 2011/Microsoft Outlook.app' --no-restart

$DOCKUTIL --remove '/Applications/Microsoft Office 2011/Microsoft Microsoft Document Connection.app' --no-restart

$DOCKUTIL --add '/Applications/Microsoft Word.app' --no-restart

$DOCKUTIL --add '/Applications/Microsoft Excel.app' --no-restart

$DOCKUTIL --add '/Applications/Microsoft PowerPoint.app' --no-restart

