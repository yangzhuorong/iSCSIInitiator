#! /bin/bash

# Define targets
DAEMON=iscsid
TOOL=iscsictl
KEXT=iSCSIInitiator.kext

# Stop, unload and remove launch daemon
sudo launchctl stop /System/Library/LaunchDaemons/com.github.iscsi-osx.iscsid
sudo launchctl unload /System/Library/LaunchDaemons/com.github.iscsi-osx.iscsid.plist
sudo rm -f /System/Library/LaunchDaemons/com.github.iscsi-osx.iscsid.plist
sudo rm -f /usr/sbin/$DAEMON # Old location
sudo rm -f /Library/PrivilegedHelperTools/$DAEMON

# Unload & remove kernel extension
sudo kextunload /Library/Extensions/$KEXT
sudo rm -f -R /Library/Extensions/$KEXT

# Remove user tools
sudo rm -f /usr/bin/$TOOL # Old location
sudo rm -f /usr/local/bin/$TOOL

# Remove man pages
sudo rm -f /usr/share/man/man8/iscsictl.8
sudo rm -f /usr/share/man/man8/iscsid.8