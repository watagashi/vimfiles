@echo off
setlocal

set UNZIP="%ProgramFiles%\7-Zip\7z" x
set ARCHIVE="%TEMP%\vim.zip"
set DEST="%ProgramFiles%"

set SOURCE=http://files.kaoriya.net/goto/vim74w32
if %PROCESSOR_ARCHITECTURE%==AMD64 set source=http://files.kaoriya.net/goto/vim74w64

curl --location --output %ARCHIVE% %SOURCE%
%UNZIP% %ARCHIVE% -o%DEST% -y
del %ARCHIVE%

endlocal
