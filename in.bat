@echo off
setlocal enabledelayedexpansion

:: Ask the user how many numbers to generate
echo Enter the number of phone numbers to generate:
set /p numCount=Number of phone numbers: 

:: Validate the input to ensure it's a positive integer
for /f "delims=0123456789" %%i in ("%numCount%") do (
    echo Invalid input. Please enter a valid number.
    pause
    exit /b
)

:: Define the output file
set outputFile=numbers.txt
echo Generating %numCount% phone numbers... > %outputFile%

:: Generate phone numbers and save to file
for /L %%i in (1,1,%numCount%) do (
    set "phoneNumber=+2547"
    for /L %%j in (1,1,8) do (
        set /a "digit=!random! %% 10"
        set "phoneNumber=!phoneNumber!!digit!"
    )
    
    :: Append the generated phone number to the output file
    if %%i lss %numCount% (
        echo !phoneNumber!;>> %outputFile%
    ) else (
        echo !phoneNumber!>> %outputFile%
    )
)

:: Notify the user
echo Phone numbers have been saved to %outputFile%
pause
