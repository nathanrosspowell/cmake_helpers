@echo off

REM Always run the prescript, if it errors the below will not run.
call %~dp0%win_prescript.bat 

REM Prescript didn't error. Do the steps to build the solution.
echo [HELPERS][CLEAN] Starting Clean...
(
    REM Move into build folder to generated intermediate files out of source.
    rmdir /s /q build
)
echo [HELPERS][CLEAN] Done Clean.

