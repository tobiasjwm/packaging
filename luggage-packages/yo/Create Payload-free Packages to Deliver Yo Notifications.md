# Create Payload-free Packages to Deliver Yo Notifications

## Purpose

Create a simple way to generate a package that can be deployed via Munki to send an instruction to Yo! to prompt an employee.

## Scope

Creating a payload-free package is simple enough and I often do this with The Luggage but in the case of delivering messages to Yo! 2.0's new yo_scheduler, I needed something that would not persistently send the command. Rich Trouton's [Payload-Free Package Creator.app](https://derflounder.wordpress.com/2015/05/21/payload-free-package-creator-app-revisited/#more-6806) does exactly this.

If you did not notice above, you need Yo! 2.0 for this.

## Process