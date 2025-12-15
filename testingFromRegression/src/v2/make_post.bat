@echo off
pushd %~dp0

set ORIG_PATH=%PATH%

call ..\setenv.bat

echo Making PointOfSales Platform v2 

mkdir build > nul 2>&1
del /q post.exe > nul 2>&1
del /q build\*.o > nul 2>&1

@echo Starting Make > build.log
gcc -g -I encrypt\inc -I order_entry\inc -I database\inc -I utils\inc -o build\database.o        -c database\src\database.c        >> build.log 2>&1
gcc -g -I encrypt\inc -I order_entry\inc -I database\inc -I utils\inc -o build\encrypt.o         -c encrypt\src\encrypt.c          >> build.log 2>&1
gcc -g -I encrypt\inc -I order_entry\inc -I database\inc -I utils\inc -o build\matrix_multiply.o -c encrypt\src\matrix_multiply.c  >> build.log 2>&1
gcc -g -I encrypt\inc -I order_entry\inc -I database\inc -I utils\inc -o build\manager.o         -c order_entry\src\manager.c      >> build.log 2>&1
gcc -g -I encrypt\inc -I order_entry\inc -I database\inc -I utils\inc -o build\pos_driver.o      -c main\pos_driver.c              >> build.log 2>&1
gcc -g -I encrypt\inc -I order_entry\inc -I database\inc -I utils\inc -o build\waiting_list.o    -c order_entry\src\waiting_list.c >> build.log 2>&1
gcc -g -I encrypt\inc -I order_entry\inc -I database\inc -I utils\inc -o build\whitebox.o        -c utils\src\whitebox.c           >> build.log 2>&1
gcc -g -I encrypt\inc -I order_entry\inc -I database\inc -I utils\inc -o build\linked_list.o     -c utils\src\linked_list.c        >> build.log 2>&1

gcc build/*.o -o post.exe >> build.log 2>&1
@echo Completed Make >> build.log

type build.log 


if EXIST "%EXEC%" goto:end

:error
popd

set PATH=%ORIG_PATH%

exit /b -1

:end

popd

set PATH=%ORIG_PATH%
