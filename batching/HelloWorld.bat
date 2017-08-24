@echo off
echo Hello Bruhs
powershell -Command "Invoke-WebRequest 'http://www.apachehaus.com/downloads/httpd-2.4.27-x86-vc14.zip' -OutFile 'httpd-2.4.27-x86-vc14.zip'"
REM powershell -Command "(New-Object Net.WebClient).DownloadFile('http://www.foo.com/package.zip', 'package.zip')"
REM powershell -Command "Invoke-WebRequest http://www.foo.com/package.zip -OutFile package.zip"
UnZipFile ".\" ".\httpd-2.4.27-x86-vc14.zip"
