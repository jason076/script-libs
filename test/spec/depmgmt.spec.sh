#!/bin/sh
# Test of need.sh
# Author: jason076
set -u
. "$1"/../lib/libmgmt.sh
cd "$1"
libmgmt__load "depmgmt"
depmgmt__need ssh
depmgmt__need dbus
depmgmt__need kate

# TODO(jason076): Implement a verification logic
exit 0

