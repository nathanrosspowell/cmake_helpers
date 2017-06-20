@echo off

REM Always run the prescript, if it errors the below will not run.
call %~dp0%win_prescript.bat 

REM Prescript didn't error. Do the steps to build the solution.
echo [HELPERS][TEST] Starting Tests...
(
    REM Move into build folder to generated intermediate files out of source.
    pushd build

    REM Run the test command
    call ctest

    REM Move back out of the build folder.
    popd
)
echo [HELPERS][TEST] Done Tests.
