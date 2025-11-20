setlocal

set VCAST_GDB_SERVER_DIR=D:\vector\tools\st\STM32CubeIDE_1.19.0\STM32CubeIDE\plugins\com.st.stm32cube.ide.mcu.externaltools.stlink-gdb-server.win32_2.2.200.202505060755\tools\bin\

set VCAST_ST_PROGRAMMER_DIR=D:\vector\tools\st\STM32CubeIDE_1.19.0\STM32CubeIDE\plugins\com.st.stm32cube.ide.mcu.externaltools.cubeprogrammer.win32_2.2.200.202503041107\tools\bin

%VCAST_GDB_SERVER_DIR%\ST-LINK_gdbserver.exe -p 61234 -e --log-level 1 --swd --verify --stm32cubeprogrammer-path %VCAST_ST_PROGRAMMER_DIR% -m 0 -k

endlocal
