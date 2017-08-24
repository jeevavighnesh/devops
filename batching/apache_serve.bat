@echo off
httpd -version > nul
if errorlevel 0 (
   echo Apache has already been installed
) else (
   echo Installing Apache Server...
   scoop install apache
)

httpd" -k start
httpd" -k stop
