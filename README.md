# cmake_helpers
A set of tools to be used as a git sub module of a C++ CMake project

# Dependecies
You will need the following software to use these scripts:

* `git`
* `cmake`

# Expected C++ project structure
To use these scripts in your C++ project, we expect to have this simple folder structure

```
your_project/
├── build/
├── CMakeLists.txt
```

## The `build` folder
This does not need to exits (the scripts will make it automatically) but it needs to be an 'out of source' folder because it is where all of the intermediate files will be generated.
If you are using git you can put `/build/` as an entry in your `.gitignore` file.

## The `CMakeLists.txt` file
The scripts will verify that the working directory is correct by checking for the existence of a `CMakeLists.txt`.
This file is what will be used in the `cmake` and `ctest` commands which are embedded in the scripts.

# Git Usage
Use this repository as a git submodule inside your project.

```bash
git submodule add https://github.com/nathanrosspowell/cmake_helpers.git helpers
git submodule init
```

You may want to ignore all changes in this folder, you can do do by adding `ignore = dirty` to your `.gitmodules` file.

```
[submodule "helpers"]
	path = helpers
	url = https://github.com/nathanrosspowell/cmake_helpers.git
  ignore = dirty
```

This will leave you with a folder structure looking like this

```
your_project/
├── helpers/
├── CMakeLists.txt
```

You can then execute scripts from your project root, or directly from the `helpers/` directory.

### Unix-like 
```bash
user@computer:~$ pushd my_project
user@computer:~/my_project ./helpers/build.bash
```

### Windows
```bat
~\Documents> pushd GitHub\my_project
~\Documents\GitHub\my_project> .\helpers\win_build.bat
```



# Naming convention
The default scripts are made for unix-like systems.
If a platform specific version of the script is needed, then the plaform name (or an abriviation) will be prepended onto the script name.

```
cmake_helpers/
├── build.bash # this is for unix-like systems
├── win_build.bat # this is the Windows platform specific version
```

