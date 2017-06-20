@echo off

REM Always run the prescript, if it errors the below will not run.
call %~dp0%win_prescript.bat 

REM Prescript didn't error. Do the steps to build the solution.
echo [HELPERS][BUILD] Starting Build...
(
    REM Move into build folder to generated intermediate files out of source.
    pushd build

    REM Generate our solution files.
    cmake .. -G "Visual Studio 15 2017"

    REM Compile command
    cmake --build .

    REM Move back out of the build folder.
    popd
)
echo [HELPERS[BUILD] Done Build.
