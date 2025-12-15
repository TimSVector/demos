@echo off
pushd %~dp0

set ORIG_PATH=%PATH%

call ..\..\setenv.bat

echo Making PointOfSales Platform v1 

mkdir build > nul 2>&1
del /q post.exe > nul 2>&1
del /q build\*.o > nul 2>&1


echo order_entry

@echo Starting Make > build.log
gcc -g -I encrypt\inc -I order_entry\inc -I database\inc -I utils\inc -o build\database.o        -c database\src\database.c        >> build.log 2>&1
gcc -g -I encrypt\inc -I order_entry\inc -I database\inc -I utils\inc -o build\manager.o         -c order_entry\src\manager.c      >> build.log 2>&1
gcc -g -I encrypt\inc -I order_entry\inc -I database\inc -I utils\inc -o build\pos_driver.o      -c main\pos_driver.c              >> build.log 2>&1
gcc -g -I encrypt\inc -I order_entry\inc -I database\inc -I utils\inc -o build\whitebox.o        -c utils\src\whitebox.c           >> build.log 2>&1

gcc build/*.o -o post.exe >> build.log 2>&1
@echo Completed Make >> build.log

type build.log 
