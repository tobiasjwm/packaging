#!/usr/bin/python

# slack_loginItem.py
# outset login-once script that adds Slack.app to Login Items for the current user.
# Requires pyLoginItems.py https://github.com/pudquick/pyLoginItems

import pyLoginItems

pyLoginItems.add_login_item('/Applications/Slack.app', 0)