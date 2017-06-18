#!/bin/bash

# From the local directory, call the prescript.
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
. "$dir/prescript.bash"
if [ $? -ne 0 ]
then
	exit 1
fi

# Prescript will abort if there is a problem
echo [HELPERS][TEST] Starting...

# Go into the build folder
pushd build

# Run the tests
ctest

# Get out of the build folder
popd

# Undo anything the prescript did.
if [ "$cmake_helpers_pop_when_finished" = true ]
then 
	popd
fi
echo [HELPERS][TEST] Done.

