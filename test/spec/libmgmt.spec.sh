#!/bin/sh

set -u
# TODO(jason076): Add automatic verification
. ../../lib/libmgmt.sh

# change to lib test directory
cd "$1"/assets/libmgmt
echo "Copy test libs to the system folders..."
sudo cp -f ./test-templates/testusrlocallib.sh /usr/local/lib/ 
cp -f ./test-templates/testlocallib.sh ~/.local/lib

if libmgmt__load testlib; then
  testlib__print
else
  exit 1;
fi

if libmgmt__load testliblib; then
  testliblib__print
else
  exit 1;
fi

# testlocallib must be copied to ~/.local/lib to pass
if libmgmt__load testlocallib; then
  testlocallib__print
else
  exit 1;
fi

# testusrlocallib must be copied to /usr/local/lib to pass
if libmgmt__load testusrlocallib; then
  testusrlocallib__print
else
  exit 1
fi

set | grep "LIB_*"

# TODO(jason076): Implement a verification logic
exit 0
