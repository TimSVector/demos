
set VCAST_IAR_INSTALL_DIR=D:\vector\tools\iar.9.50\arm


set VCAST_SUPPORT_FILES=%~dp0SupportFiles

set VCAST_DEMO_SRC_BASE=%~dp0

:: Path to GNU ARM Compiler
set path=%path%;D:\vector\tools\gcc-toolchain\arm-32b-13\bin;D:\vector\tools\gcc-toolchain\arm-64b-13\bin;

:: Path to IAR ARM Compiler
set PATH=%PATH%;%VCAST_IAR_INSTALL_DIR%\bin;%VCAST_IAR_INSTALL_DIR%\..\common\bin;C:\qemu-10.2.90
