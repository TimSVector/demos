@echo off
set NEWFOLDER=cortex-m7-VFPv5_sp

rem Create the folder if it doesn't exist
if not exist "%NEWFOLDER%" mkdir "%NEWFOLDER%"

rem Move everything except .git and the new folder itself
for /f "delims=" %%F in ('dir /a:-d /b ^| findstr /vix ".git" ^| findstr /vix "%NEWFOLDER%"') do (
    move "%%F" "%NEWFOLDER%" >nul
)

rem Move subdirectories
for /f "delims=" %%D in ('dir /a:d /b ^| findstr /vix ".git" ^| findstr /vix "%NEWFOLDER%"') do (
    move "%%D" "%NEWFOLDER%" >nul
)

echo Done.
