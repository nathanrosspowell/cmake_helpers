@echo off

REM Always run the prescript, if it errors the below will not run.
call %~dp0%win_prescript.bat 

REM Prescript didn't error. Do the steps to build the solution.
echo [HELPERS][UPDATE] Starting Clean...
(
    REM Get the bleeding edge submodules
    git submodule update --recursive --remote
)
echo [HELPERS][UPDATE] Done Clean.

