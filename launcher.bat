@echo off
set WORK=%LOCALAPPDATA%\LiquidMusic
if not exist "%WORK%" mkdir "%WORK%"
echo Extracting files...
powershell -NoProfile -ExecutionPolicy Bypass -Command "Expand-Archive -Path '%~dp0app.zip' -DestinationPath '%WORK%' -Force"
copy /y "%~dp0node.exe" "%WORK%\node.exe" >nul
echo Starting Liquid Music...
start "" "http://localhost:3000"
cd /d "%WORK%"
echo ============================================
echo  Liquid Music is running at http://localhost:3000
echo  Close this window to stop the server.
echo ============================================
echo  Android APK files are located at:
echo    %WORK%\冈易音乐正式版v1.0.1.apk
echo    %WORK%\开源音乐-debug.apk
echo ============================================
node server.js
pause