@echo off

set VCAST_USE_CI_LICENSES=1

copy /y code\order_entry\src\manager_orig.c code\order_entry\src\manager.c
copy /y code\order_entry\src\waiting_list_orig.c code\order_entry\src\waiting_list.c

call setenv.bat
set VCAST_MESSAGE_TIMESTAMPS=1
manage -p IAR_Testing_Campaign --status
manage -p IAR_Testing_Campaign --refresh
manage -p IAR_Testing_Campaign --clean
manage -p IAR_Testing_Campaign --remove-imported-result Results_From_IAR_Testing.vcr
manage -p IAR_Testing_Campaign --refresh

del /q Results_From_IAR_Testing.vcr 

REM set VCAST_NUM_JOBS=
REM powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew();manage -p IAR_Testing_Campaign --build --level IAR_STM32F746GN_StLink_C++/TestSuite         ;$sw.Stop();'[TIMING];BUILD;IAR_StLink_C++;No Parallelization (1/1);{0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"
REM set VCAST_NUM_JOBS=4                                                                                                                                                  
REM powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew();manage -p IAR_Testing_Campaign --build --level IAR_STM32F746GN_StLink_C++/TestSuite         ;$sw.Stop();'[TIMING];BUILD;IAR_StLink_C++;Parallel CodeGen/Compile (4/1);{0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"
REM set VCAST_NUM_JOBS=
REM powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew();manage -p IAR_Testing_Campaign --build --level IAR_STM32F746GN_StLink_C++/TestSuite --jobs 8;$sw.Stop();'[TIMING];BUILD;IAR_StLink_C++;Parallel Env Build (1/8);{0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"
REM set VCAST_NUM_JOBS=4
REM powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew();manage -p IAR_Testing_Campaign --build --level IAR_STM32F746GN_StLink_C++/TestSuite --jobs 8;$sw.Stop();'[TIMING];BUILD;IAR_StLink_C++;Parallel CodeGen/Compile and Env Build (4/8);{0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"


set VCAST_NUM_JOBS=
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew();manage -p IAR_Testing_Campaign --build --level IAR_STM32F746GN_SIM_C++/TestSuite --jobs 1;$sw.Stop(); '[TIMING];BUILD;IAR_SIM_C++;No Parallelization (1/1);{0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"
set VCAST_NUM_JOBS=4                                                                                                                                               
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew();manage -p IAR_Testing_Campaign --build --level IAR_STM32F746GN_SIM_C++/TestSuite --jobs 1;$sw.Stop(); '[TIMING];BUILD;IAR_SIM_C++;Parallel CodeGen/Compile (4/1);{0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"
set VCAST_NUM_JOBS=
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew();manage -p IAR_Testing_Campaign --build --level IAR_STM32F746GN_SIM_C++/TestSuite --jobs 8;$sw.Stop(); '[TIMING];BUILD;IAR_SIM_C++;Parallel Env Build (1/8);{0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"
set VCAST_NUM_JOBS=4
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew();manage -p IAR_Testing_Campaign --build --level IAR_STM32F746GN_SIM_C++/TestSuite --jobs 8;$sw.Stop(); '[TIMING];BUILD;IAR_SIM_C++;Parallel CodeGen/Compile and Env Build (4/8);{0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"


set VCAST_NUM_JOBS=
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew();manage -p IAR_Testing_Campaign --build --level GNU_ARM_QEMU_C++/TestSuite --jobs 1;$sw.Stop();'[TIMING];BUILD;GNU_ARM_C++;No Parallelization (1/1);{0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"
set VCAST_NUM_JOBS=4                                                                                                                                        
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew();manage -p IAR_Testing_Campaign --build --level GNU_ARM_QEMU_C++/TestSuite --jobs 1;$sw.Stop();'[TIMING];BUILD;GNU_ARM_C++;Parallel CodeGen/Compile (4/1);{0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"
set VCAST_NUM_JOBS=
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew();manage -p IAR_Testing_Campaign --build --level GNU_ARM_QEMU_C++/TestSuite --jobs 8;$sw.Stop();'[TIMING];BUILD;GNU_ARM_C++;Parallel Env Build (1/8);{0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"
set VCAST_NUM_JOBS=4
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew();manage -p IAR_Testing_Campaign --build --level GNU_ARM_QEMU_C++/TestSuite --jobs 8;$sw.Stop();'[TIMING];BUILD;GNU_ARM_C++;Parallel CodeGen/Compile and Env Build (4/8);{0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"


set VCAST_NUM_JOBS=
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew();manage -p IAR_Testing_Campaign --build --level VectorCAST_MinGW_C++/TestSuite --jobs 1;$sw.Stop(); '[TIMING];BUILD;MinGW_C++;No Parallelization (1/1);{0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"
set VCAST_NUM_JOBS=4                                                                                                                                            
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew();manage -p IAR_Testing_Campaign --build --level VectorCAST_MinGW_C++/TestSuite --jobs 1;$sw.Stop(); '[TIMING];BUILD;MinGW_C++;Parallel CodeGen/Compile (4/1);{0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"
set VCAST_NUM_JOBS=
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew();manage -p IAR_Testing_Campaign --build --level VectorCAST_MinGW_C++/TestSuite --jobs 8;$sw.Stop();'[TIMING];BUILD;MinGW_C++;Parallel Env Build (1/8);{0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"
set VCAST_NUM_JOBS=4
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew();manage -p IAR_Testing_Campaign --build --level VectorCAST_MinGW_C++/TestSuite --jobs 8;$sw.Stop();'[TIMING];BUILD;MinGW_C++;Parallel CodeGen/Compile and Env Build (4/8);{0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"


goto END

manage -p IAR_Testing_Campaign --full-status

set VCAST_NUM_JOBS=

powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew();manage -p IAR_Testing_Campaign --execute --level IAR_STM32F746GN_StLink_C++/TestSuite            ;$sw.Stop(); '[TIMING];EXECUTE;IAR_StLink_C++;No Parallelization (1/1);{0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew();manage -p IAR_Testing_Campaign --execute --level IAR_STM32F746GN_StLink_C++/TestSuite --jobs 8   ;$sw.Stop(); '[TIMING];EXECUTE;IAR_StLink_C++;Parallel Env Execution (1/8);{0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"

powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew();manage -p IAR_Testing_Campaign --execute --level IAR_STM32F746GN_SIM_C++/TestSuite               ;$sw.Stop(); '[TIMING];EXECUTE;IAR_SIM_C++;No Parallelization (1/1);{0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew();manage -p IAR_Testing_Campaign --execute --level IAR_STM32F746GN_SIM_C++/TestSuite --jobs 8      ;$sw.Stop(); '[TIMING];EXECUTE;IAR_SIM_C++;Parallel Env Execution (1/8);{0:hh\:mm\:ss\.fff}e -                                  f                   $sw         .Elapsed"

powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew();manage -p IAR_Testing_Campaign --execute --level GNU_ARM_QEMU_C++/TestSuite                      ;$sw.Stop();'[TIMING];EXECUTE;GNU_ARM_C++;No Parallelization (1/1);{0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew();manage -p IAR_Testing_Campaign --execute --level GNU_ARM_QEMU_C++/TestSuite --jobs 8             ;$sw.Stop();'[TIMING];EXECUTE;GNU_ARM_C++;Parallel Env Execution (1/8);{0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"

powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew();manage -p IAR_Testing_Campaign --execute --level VectorCAST_MinGW_C++/TestSuite                  ;$sw.Stop();'[TIMING];EXECUTE;MinGW_C++;No Parallelization (1/1);{0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew();manage -p IAR_Testing_Campaign --execute --level VectorCAST_MinGW_C++/TestSuite --jobs 8         ;$sw.Stop();'[TIMING];EXECUTE;MinGW_C++;Parallel Env Execution (1/8);{0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"



set VCAST_NUM_JOBS=
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew();manage -p IAR_Testing_Campaign --build-execute                                                   ;$sw.Stop();'[TIMING];BUILD-EXECUTE;Complete Project;No Parallelization (1/1);{0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"

set VCAST_NUM_JOBS=4
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew();manage -p IAR_Testing_Campaign --build-execute --jobs 8                                          ;$sw.Stop();'[TIMING];BUILD-EXECUTE;Complete Project;Parallel CodeGen/Compile and Env Build-Execute (4/8);{0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"

type code\order_entry\src\manager_update_1.c > code\order_entry\src\manager.c
set VCAST_NUM_JOBS=4
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew();manage -p IAR_Testing_Campaign --build-execute --incremental --jobs 8                           ;$sw.Stop();'[TIMING];BUILD-EXECUTE;Complete Project;Incremental Build (4/8);{0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"

manage -p IAR_Testing_Campaign --export-result Results_From_IAR_Testing.vcr
manage -p IAR_Testing_Campaign --clean
manage -p IAR_Testing_Campaign --import-result Results_From_IAR_Testing.vcr

type code\order_entry\src\waiting_list_update_1.c > code\order_entry\src\waiting_list.c

powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew();manage -p IAR_Testing_Campaign --build-execute --incremental --jobs 8                           ;$sw.Stop();'[TIMING];BUILD-EXECUTE;Complete Project;Incremental CBT Import (4/8);{0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"

:END