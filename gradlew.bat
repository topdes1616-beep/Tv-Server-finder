@rem Gradle Wrapper for Windows
@if "%DEBUG%"=="" @echo off
set APP_HOME=%~dp0
set GRADLE_VERSION=8.2
set GRADLE_HOME=%USERPROFILE%\.gradle\wrapper\dists\gradle-%GRADLE_VERSION%
set GRADLE_BIN=%GRADLE_HOME%\gradle-%GRADLE_VERSION%\bin\gradle.bat
if not exist "%GRADLE_BIN%" (
    echo Downloading Gradle %GRADLE_VERSION%...
    powershell -Command "Invoke-WebRequest -Uri 'https://services.gradle.org/distributions/gradle-%GRADLE_VERSION%-bin.zip' -OutFile '%GRADLE_HOME%\gradle.zip'"
    powershell -Command "Expand-Archive -Path '%GRADLE_HOME%\gradle.zip' -DestinationPath '%GRADLE_HOME%'"
    del "%GRADLE_HOME%\gradle.zip"
)
call "%GRADLE_BIN%" %*
