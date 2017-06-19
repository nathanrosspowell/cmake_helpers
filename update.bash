#!/bin/bash

# From the local directory, call the prescript.
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
. "$dir/prescript.bash"
if [ $? -ne 0 ]
then
	exit 1
fi

# Prescript will abort if there is a problem
echo [HELPERS][UPDATE] Starting...

# Store all local work that could cause merge problems
git stash

# Grab latest
git pull

# Make sure we grab all the submodule changes
git submodule update --init

# Get back the local changes
git stash pop

# Undo anything the prescript did.
if [ "$cmake_helpers_pop_when_finished" = true ]
then 
	popd
fi
echo [HELPERS][UPDATE] Done.

