
if "%1"=="SIM" (

    copy NUL %VCV_EXECUTABLE_NAME%.ewp & iaridepm --DBG ARM %VCAST_IAR_INSTALL_DIR%\bin\armstlink.dll %VCV_EXECUTABLE_NAME% --plugin %VCAST_IAR_INSTALL_DIR%\bin\armLibsupportUniversal.dll --backend -d sim --endian=little --cpu=Cortex-M7 --fpu=VFPv5_SP -On --semihosting --multicore_nr_of_cores=1
) else (

    copy NUL %VCV_EXECUTABLE_NAME%.ewp & iaridepm --DBG ARM %VCAST_IAR_INSTALL_DIR%\bin\armstlink.dll %VCV_EXECUTABLE_NAME% --plugin %VCAST_IAR_INSTALL_DIR%\bin\armLibsupportUniversal.dll --backend --endian=little --cpu=Cortex-M7 --fpu=VFPv5_SP -p %VCAST_IAR_INSTALL_DIR%\config\debugger\ST\STM32F746NG.ddf --drv_verify_download --semihosting --device=STM32F746NG --drv_interface=SWD --stlink_reset_strategy=0,0 --drv_swo_clock_setup=216000000,1,2000000 --drv_catch_exceptions=0x000 --drv_debug_ap=0 --stlink_probe_supplied_power=3.3

)
