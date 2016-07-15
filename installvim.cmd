@echo off
setlocal

set UNZIP="%ProgramFiles%\7-Zip\7z" x
set ARCHIVE="%TEMP%\vim.zip"
if not "%1"=="" set ARCHIVE=%1
set DEST="%ProgramFiles%"

set SOURCE=http://files.kaoriya.net/goto/vim74w32
if %PROCESSOR_ARCHITECTURE%==AMD64 set source=http://files.kaoriya.net/goto/vim74w64

if "%1"=="" curl --location --output %ARCHIVE% %SOURCE%
%UNZIP% %ARCHIVE% -o%DEST% -y
if not "%1"=="" del %ARCHIVE%

endlocal
