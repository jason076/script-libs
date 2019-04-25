#!/bin/sh

trap 'echo Error...' ERR
set -Ee

mkdir ./hallo/test
echo "I should not be visible!"
