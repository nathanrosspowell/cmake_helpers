@echo off

REM Start a local block to do all our checks and precursor work.
setlocal
(
    REM We expect to be called from the project root folder, 
    REM but we could be in the submodule folder where the script lives (double click?).
    REM If we are in our own folder, jump up to the parent dir
    if {%cd%\} == {%~dp0} (
        pushd ..
    )

    REM We sohuld be in the project root, use the existence of CMakeLists.txt to check.
    REM If we're in a folder that we don't expect, then we need to exit.
    if not exist "CMakeLists.txt" (
        echo [HELPERS]    ERROR: This folder does not have a CMakeLists.txt file!
        echo [HELPERS]    ERROR: Do you expect to be executing this script from "!cd!" ?
        REM This is an error. Everything will stop after this.
        exit 1 
    )

    REM We're in the good directory, do all the precursor work here.
    (
        REM Make sure the build folder exists.
        if not exist build md build
    )
)
endlocal

REM If the calling script location needed to jump up a dir, do it for real.
if {%cd%\} == {%~dp0} (
    pushd ..
)

REM Finall, let everyone know we're done.
echo [HELPERS]    Finished executing "_win_prescript.bat" on directory "%cd%"
