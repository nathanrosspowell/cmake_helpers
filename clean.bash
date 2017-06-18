#!/bin/bash

# From the local directory, call the prescript.
dir="${BASH_SOURCE%/*}"
. "$dir/prescript.bash"

# Prescript will abort if there is a problem
echo [HELPERS][CLEAN] Starting...

# Nuke the build folder
rm -rf build

# Undo anything the prescript did.
if [ "$cmake_helpers_pop_when_finished" = true ]
then 
	popd
fi
echo [HELPERS][CLEAN] Done.

