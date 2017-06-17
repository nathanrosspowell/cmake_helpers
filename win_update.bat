@echo off

REM Always run the prescript, if it errors the below will not run.
call %~dp0%_win_prescript.bat 

echo [HELPERS]    Starting Update...
(
    REM We want to bump all submodules to their latest versions
    echo [HELPERS]    Updating all git submodules
    git submodule update --recursive --remote
)
echo [HELPERS]    Done Update.
