#!/bin/bash

# Command variables
rmr="/bin/rm -R"
cpr="/bin/cp -R"
pur="/usr/sbin/pkgutil --remove"

# Directories variables
serviceDir="$HOME/Library/Services"
tmpDir="/Library/Management/xkpasswd"

# Automator workflow variables
mzpPwd="MozyPro Password.workflow"
offPwd="Office365 Password.workflow"
userPwd="User Password.workflow"
bestPwd="Best Password.workflow"
betterPwd="Better Password.workflow"
goodPwd="Good Password.workflow"

# Check for the old password Automator workflows and
# delete them if they exist in the User's home folder
if [[ -e "$serviceDir"/"$mzpPwd" ]]
then
    $rmr "$serviceDir"/"$mzpPwd"
fi

if [[ -e "$serviceDir"/"$offPwd" ]]
then
    $rmr "$serviceDir"/"$offPwd"
fi

if [[ -e "$serviceDir"/"$userPwd" ]]
then
    $rmr "$serviceDir"/"$userPwd"
fi

# Remove old receipt because we are using a new receipt. 
# But, now we won't because reasons

#$pur com.tobiasmorrison.xkpasswd

# Copy workflows to ~/Library/Services/
$cpr "$tmpDir"/"$bestPwd" "$serviceDir"/"$bestPwd"
$cpr "$tmpDir"/"$betterPwd" "$serviceDir"/"$betterPwd"
$cpr "$tmpDir"/"$goodPwd" "$serviceDir"/"$goodPwd"
