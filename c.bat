@echo off
setlocal enabledelayedexpansion

REM Specify the path to your text file
set "file=numbers.txt"

REM Check if the file exists
if not exist "!file!" (
    echo File not found: !file!
    exit /b
)

REM Read each line in the text file
for /f "tokens=*" %%a in (!file!) do (
    echo %%a
    echo %%a| clip
    echo Number copied to clipboard: %%a
    pause
)

echo Finished reading numbers.
