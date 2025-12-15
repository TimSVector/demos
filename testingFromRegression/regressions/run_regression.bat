
@echo off
setlocal enabledelayedexpansion

call ..\setenv.bat
rmdir /s /q results > nul 2>&1
rmdir /s /q reports > nul 2>&1

mkdir results 
mkdir reports

echo "Regression Testing %DATE% %TIME%" > regression.log

for /d %%D in (*) do (
    if exist "%%D\%%~nxD.bat" (
        echo ==========================================
        echo Running %%~nxD.bat in %%D
        pushd "%%D"
        call "%%~nxD.bat" >> ..\regression.log
        if defined JENKINS_URL {
            vpython %WORKSPACE%\vc_scripts\generate_xml.py "%%~nxD.vce"
        )
        popd
    )
)

echo ==========================================
echo All done.
endlocal
