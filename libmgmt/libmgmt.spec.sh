#!/bin/sh

set -u
# TODO(jason076): Add automatic verification
. ./libmgmt.sh

libmgmt__load testlib
testlib__print

libmgmt__load testliblib
testliblib__print

# testlocallib must be copied to ~/.local/lib to pass
libmgmt__load testlocallib
testlocallib__print

# testusrlocallib must be copied to /usr/local/lib to pass
libmgmt__load testusrlocallib
testusrlocallib__print


set | grep "LIB_*"

