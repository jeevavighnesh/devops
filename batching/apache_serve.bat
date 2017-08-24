@echo off
if "%1"==install (
  call :Install
  EXIT /B %errorlevel%
)
if "%1"==start (
  call :Start
  EXIT /B %errorlevel%
)
if "%1"==stop (
  call :Stop
  EXIT /B %errorlevel%
)
if "%1"=="" (
  echo incorrect usage
  EXIT /B %errorlevel%
)

:Start
echo Starting Apache server
httpd -k start
EXIT /B 0

:Stop
echo Stoping Apache server
httpd -k stop
EXIT /B 0

:Install
httpd -version > nul
if errorlevel 9009 (
  echo Installing Apache Server...
  scoop install apache
) else (
  echo Apache has already been installed
)
EXIT /B 0
