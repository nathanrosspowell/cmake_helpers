echo [HELPERS][PRE] Starting...

# Get the directory of this script.
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

echo HERE: $PWD
echo DIR: $dir


# If we are in the same directory as the script, then try and move up one folder.
if [ $PWD -ef $dir ]
then 
	# move up one folder
	pushd .. 

	# Let the caller know we moved up one dir.
	export cmake_helpers_pop_when_finished=true
fi

# Look for the CMake config file.
if [ ! -f CMakeLists.txt ]
then
	if [$PWD -ef $script_dir]
	then 
		# Reset the location.
		popd
	fi
	echo [HELPERS][PRE] ERROR: There is no "CMakeLists.txt" file in this directory.	
	echo [HELPERS][PRE] ERROR: Direcotry = $PWD
	exit 1
fi

# Make the 'out of source' folder.
mkdir -p build

# Let everyone know were done.
echo [HELPERS][PRE] Prescript done.
