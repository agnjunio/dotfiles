@echo off
setlocal ENABLEDELAYEDEXPANSION

:: WSL IP is the first argument
set WSL_IP=%1
shift /1

:: Remaining arguments are ports
:parse
if "%1"=="" goto done
set PORT=%1
netsh interface portproxy delete v4tov4 listenport=%PORT% listenaddress=0.0.0.0 >nul 2>&1
netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=%PORT% connectaddress=%WSL_IP% connectport=%PORT%
shift /1
goto parse

:done
echo Port forwarding complete to %WSL_IP%
