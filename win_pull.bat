@echo off

REM Always run the prescript, if it errors the below will not run.
call %~dp0%win_prescript.bat 

echo [HELPERS][PULL] Starting Pull...
(
    REM Store all local work that could cause merge problems
    git stash

    REM Grab latest
    git pull

    REM Make sure we grab all the submodule changes
    git submodule update --init

    REM Get back the local changes
    git stash pop
)
echo [HELPERS][PULL] Done Pull.
