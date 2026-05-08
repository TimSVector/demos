@echo off

manage -p IAR_Testing_Campaign --clean

echo.
echo IAR_STM32F746GN_StLink_C++
echo =======================================================

set VCAST_NUM_JOBS=
powershell -NoProfile -Command "$t = Measure-Command { manage -p IAR_Testing_Campaign --build --level IAR_STM32F746GN_StLink_C++/TestSuite };         'No Parallelization       ; {0:hh\:mm\:ss\.fff}' -f $t"

set VCAST_NUM_JOBS=8
powershell -NoProfile -Command "$t = Measure-Command { manage -p IAR_Testing_Campaign --build --level IAR_STM32F746GN_StLink_C++/TestSuite };         'VC Build Parallel        ; {0:hh\:mm\:ss\.fff}' -f $t
powershell -NoProfile -Command "$t = Measure-Command { manage -p IAR_Testing_Campaign --build --level IAR_STM32F746GN_StLink_C++/TestSuite --jobs 4}; 'Parallel VC and Env Build: {0:hh\:mm\:ss\.fff}' -f $t"



echo.
echo IAR_STM32F746GN_SIM_C++
echo =======================================================

set VCAST_NUM_JOBS=
powershell -NoProfile -Command "$t = Measure-Command { manage -p IAR_Testing_Campaign --build --level IAR_STM32F746GN_SIM_C++/TestSuite };          'No Parallelization       ; {0:hh\:mm\:ss\.fff}' -f $t"

set VCAST_NUM_JOBS=8
powershell -NoProfile -Command "$t = Measure-Command { manage -p IAR_Testing_Campaign --build --level IAR_STM32F746GN_SIM_C++/TestSuite };          'VC Build Parallel        ; {0:hh\:mm\:ss\.fff}' -f $t
powershell -NoProfile -Command "$t = Measure-Command { manage -p IAR_Testing_Campaign --build --level IAR_STM32F746GN_SIM_C++/TestSuite --jobs 4};  'Parallel VC and Env Build: {0:hh\:mm\:ss\.fff}' -f $t"


echo.
echo GNU_Target_Bare_Board_ARM_Cortex-M7_MPS2-AN500_QEMU_C++
echo =======================================================

set VCAST_NUM_JOBS=
powershell -NoProfile -Command "$t = Measure-Command { manage -p IAR_Testing_Campaign --build --level GNU_Target_Bare_Board_ARM_Cortex-M7_MPS2-AN500_QEMU_C++/TestSuite }; 'No Parallelization       ; {0:hh\:mm\:ss\.fff}' -f $t"
set VCAST_NUM_JOBS=8
powershell -NoProfile -Command "$t = Measure-Command { manage -p IAR_Testing_Campaign --build --level GNU_Target_Bare_Board_ARM_Cortex-M7_MPS2-AN500_QEMU_C++/TestSuite }; 'VC Build Parallel        ; {0:hh\:mm\:ss\.fff}' -f $t
powershell -NoProfile -Command "$t = Measure-Command { manage -p IAR_Testing_Campaign --build --level GNU_Target_Bare_Board_ARM_Cortex-M7_MPS2-AN500_QEMU_C++/TestSuite --jobs 4}; 'Parallel VC and Env Build: {0:hh\:mm\:ss\.fff}' -f $t"


echo.
echo VectorCAST_MinGW_C++
echo =======================================================

set VCAST_NUM_JOBS=
powershell -NoProfile -Command "$t = Measure-Command { manage -p IAR_Testing_Campaign --build --level VectorCAST_MinGW_C++/TestSuite }; 'No Parallelization       ; {0:hh\:mm\:ss\.fff}' -f $t"

set VCAST_NUM_JOBS=8
powershell -NoProfile -Command "$t = Measure-Command { manage -p IAR_Testing_Campaign --build --level VectorCAST_MinGW_C++/TestSuite }; 'VC Build Parallel        ; {0:hh\:mm\:ss\.fff}' -f $t
powershell -NoProfile -Command "$t = Measure-Command { manage -p IAR_Testing_Campaign --build --level VectorCAST_MinGW_C++/TestSuite --jobs 4}; 'Parallel VC and Env Build: {0:hh\:mm\:ss\.fff}' -f $t"