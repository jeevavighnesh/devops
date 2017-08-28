@echo off
if "%1"=="install" (
  call :Install
  EXIT /B %errorlevel%
)
if "%1"=="start" (
  call :Start
  EXIT /B %errorlevel%
)
if "%1"=="stop" (
  call :Stop
  EXIT /B %errorlevel%
)
if "%1"=="uninstall" (
  call :Uninstall
  EXIT /B %errorlevel%
) else (
  echo incorrect usage
  EXIT /B %errorlevel%
)

:Uninstall
echo Terminating apache
net stop apache
echo Removing apache server
choco uninstall apache-httpd -y
echo Successfully removed apache server
EXIT /b 0

:Start
echo Starting Apache server
net start apache
EXIT /B 0

:Stop
echo Stoping Apache server
net stop apache
EXIT /B 0

:Install
echo Installing Apache Server...
choco install apache-httpd -y
EXIT /B 0
