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
) ELSE (
  echo incorrect usage
  EXIT /B %errorlevel%
)

:Uninstall
echo Terminating tomcat
net stop tomcat8
echo Removing tomcat server
choco uninstall tomcat -y
echo Successfully removed tomcat server
EXIT /b 0

:Start
echo Starting tomcat server
net start tomcat8
EXIT /B 0

:Stop
echo Stoping tomcat server
net stop tomcat8
EXIT /B 0

:Install
echo Installing tomcat Server...
choco install tomcat -y
EXIT /B 0
