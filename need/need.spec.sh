#!/bin/sh
# Test of need.sh
# Author: jason076
set -ux
cd ..

# load library manager
. ./libmgmt.sh

./need.sh -b ssh
./need.sh -p dbus
./need.sh -B ssh vim
./need.sh -P dbus dbus-x11 
