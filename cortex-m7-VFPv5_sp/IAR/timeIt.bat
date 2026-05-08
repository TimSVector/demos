@echo off

call setenv.bat
set VCAST_MESSAGE_TIMESTAMPS=1 
manage -p IAR_Testing_Campaign --clean

echo.
echo IAR_STM32F746GN_StLink_C++
echo =======================================================

set VCAST_NUM_JOBS=
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew(); manage -p IAR_Testing_Campaign --build --level IAR_STM32F746GN_StLink_C++/TestSuite ; $sw.Stop(); '[TIMING] No Parallelization        : {0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew(); manage -p IAR_Testing_Campaign --build --level IAR_STM32F746GN_StLink_C++/TestSuite --jobs 4; $sw.Stop(); '[TIMING] Parallel Env Build        : {0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"

set VCAST_NUM_JOBS=8
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew(); manage -p IAR_Testing_Campaign --build --level IAR_STM32F746GN_StLink_C++/TestSuite ; $sw.Stop(); '[TIMING] VC Build Parallel         : {0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew(); manage -p IAR_Testing_Campaign --build --level IAR_STM32F746GN_StLink_C++/TestSuite --jobs 4; $sw.Stop(); '[TIMING] Parallel VC and Env Build : {0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"



echo.
echo IAR_STM32F746GN_SIM_C++
echo =======================================================

set VCAST_NUM_JOBS=
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew(); manage -p IAR_Testing_Campaign --build --level IAR_STM32F746GN_SIM_C++/TestSuite ; $sw.Stop(); '[TIMING] No Parallelization        : {0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew(); manage -p IAR_Testing_Campaign --build --level IAR_STM32F746GN_SIM_C++/TestSuite --jobs 4; $sw.Stop(); '[TIMING] Parallel Env Build        : {0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"


set VCAST_NUM_JOBS=8
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew(); manage -p IAR_Testing_Campaign --build --level IAR_STM32F746GN_SIM_C++/TestSuite ; $sw.Stop(); '[TIMING] VC Build Parallel         : {0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew(); manage -p IAR_Testing_Campaign --build --level IAR_STM32F746GN_SIM_C++/TestSuite --jobs 4; $sw.Stop(); '[TIMING] Parallel VC and Env Build : {0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"


echo.
echo GNU_Target_Bare_Board_ARM_Cortex-M7_MPS2-AN500_QEMU_C++
echo =======================================================

set VCAST_NUM_JOBS=
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew(); manage -p IAR_Testing_Campaign --build --level GNU_Target_Bare_Board_ARM_Cortex-M7_MPS2-AN500_QEMU_C++/TestSuite ; $sw.Stop(); '[TIMING] No Parallelization        : {0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew(); manage -p IAR_Testing_Campaign --build --level GNU_Target_Bare_Board_ARM_Cortex-M7_MPS2-AN500_QEMU_C++/TestSuite --jobs 4; $sw.Stop(); '[TIMING] Parallel Env Build        : {0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"

set VCAST_NUM_JOBS=8
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew(); manage -p IAR_Testing_Campaign --build --level GNU_Target_Bare_Board_ARM_Cortex-M7_MPS2-AN500_QEMU_C++/TestSuite ; $sw.Stop(); '[TIMING] VC Build Parallel         : {0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew(); manage -p IAR_Testing_Campaign --build --level GNU_Target_Bare_Board_ARM_Cortex-M7_MPS2-AN500_QEMU_C++/TestSuite --jobs 4; $sw.Stop(); '[TIMING] Parallel VC and Env Build : {0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"


echo.
echo VectorCAST_MinGW_C++
echo =======================================================

set VCAST_NUM_JOBS=
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew(); manage -p IAR_Testing_Campaign --build --level VectorCAST_MinGW_C++/TestSuite ; $sw.Stop(); '[TIMING] No Parallelization        : {0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew(); manage -p IAR_Testing_Campaign --build --level VectorCAST_MinGW_C++/TestSuite --jobs 4; $sw.Stop(); '[TIMING] Parallel Env Build        : {0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"

set VCAST_NUM_JOBS=8
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew(); manage -p IAR_Testing_Campaign --build --level VectorCAST_MinGW_C++/TestSuite ; $sw.Stop(); '[TIMING] VC Build Parallel         : {0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"
powershell -NoProfile -Command "$sw = [Diagnostics.Stopwatch]::StartNew(); manage -p IAR_Testing_Campaign --build --level VectorCAST_MinGW_C++/TestSuite --jobs 4; $sw.Stop(); '[TIMING] Parallel VC and Env Build : {0:hh\:mm\:ss\.fff}' -f $sw.Elapsed"
