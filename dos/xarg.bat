@echo off
:: modified from https://github.com/DoctorLai/BatchUtils/blob/master/xargs.cmd

:: example:   git branch | grep -v "develop" | xargs git branch -D
:: example    xargs -a input.txt echo
:: https://helloacm.com/simple-xargs-batch-implementation-for-windows/
setlocal enabledelayedexpansion

set args=
set file='more'

:: read from file
if "%1" == "-a" (
    if "%2" == "" (
        echo Correct Usage: %0 -a Input.txt command
        goto end
    )
    set file=%2
    shift
    shift
    goto start
)

:: git rid of '-0'
if "%1" == "-0" (
    shift
)

:: read from stdin
set args=%1
shift

:start
    if [%1] == [] goto xargs
    set args=%args% %1
    shift
    goto start

:xargs
    for /F "tokens=*" %%a in (!file!) do (
        %args% %%a
    )

:end
