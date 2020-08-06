#!/bin/bash

# Command variables
cpr="/bin/cp -R"

# Directories variables
serviceDir="$HOME/Library/Services"
tmpDir="/Library/Management/xkpasswd"

# Automator workflow variables
bestPwd="Best Password.workflow"
betterPwd="Better Password.workflow"
goodPwd="Good Password.workflow"

# Copy workflows to ~/Library/Services/
$cpr "$tmpDir"/"$bestPwd" "$serviceDir"/"$bestPwd"
$cpr "$tmpDir"/"$betterPwd" "$serviceDir"/"$betterPwd"
$cpr "$tmpDir"/"$goodPwd" "$serviceDir"/"$goodPwd"
