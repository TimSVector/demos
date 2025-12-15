del commands.tmp > nul 2>&1
echo options COVERAGE_IO_TYPE VCAST_COVERAGE_IO_BUFFERED >> commands.tmp
echo options C_COMPILER_CFG_SOURCE PY_CONFIGURATOR >> commands.tmp
echo options C_COMPILER_FAMILY_NAME GNU_Native >> commands.tmp
echo options C_COMPILER_HIERARCHY_STRING VectorCAST MinGW_C >> commands.tmp
echo options C_COMPILER_OUTPUT_FLAG -o >> commands.tmp
echo options C_COMPILER_PY_ARGS --lang c --version Built-in-MinGW >> commands.tmp
echo options C_COMPILER_TAG BUILTIN_MINGW_C >> commands.tmp
echo options C_COMPILER_VERSION_CMD gcc --version >> commands.tmp
echo options C_COMPILE_CMD gcc -c -g >> commands.tmp
echo options C_DEBUG_CMD gdb >> commands.tmp
echo options C_DEFINE_LIST __USE_MINGW_ANSI_STDIO >> commands.tmp
echo options C_EDG_FLAGS -w --gcc --gnu_version 100200 --64_bit_target --x86_64 --mingw >> commands.tmp
echo options C_LINKER_VERSION_CMD ld --version >> commands.tmp
echo options C_LINK_CMD gcc -g >> commands.tmp
echo options C_PREPROCESS_CMD gcc -E -ftrack-macro-expansion=0 -C >> commands.tmp
echo options STANDARD_ERROR NORMAL >> commands.tmp
echo options STANDARD_OUTPUT NORMAL >> commands.tmp
echo options TEST_CASE_TIMEOUT 3 >> commands.tmp
echo options VARIANT_LOGICS_PATH  >> commands.tmp
echo options VCAST_ASSEMBLY_FILE_EXTENSIONS s >> commands.tmp
echo options VCAST_BUFFER_OUTPUT TRUE >> commands.tmp
echo options VCAST_COLLAPSE_STD_HEADERS COLLAPSE_NONE >> commands.tmp
echo options VCAST_COMMAND_LINE_DEBUGGER TRUE >> commands.tmp
echo options VCAST_DISABLE_STD_WSTRING_DETECTION TRUE >> commands.tmp
echo options VCAST_DISPLAY_UNINST_EXPR FALSE >> commands.tmp
echo options VCAST_DUMP_BUFFER TRUE >> commands.tmp
echo options VCAST_ENVIRONMENT_FILES  >> commands.tmp
echo options VCAST_EXECUTE_WITH_STDOUT TRUE >> commands.tmp
echo options VCAST_GNU_SYSTEM_MARKER TRUE >> commands.tmp
echo options VCAST_HAS_LONGLONG TRUE >> commands.tmp
echo options VCAST_NO_FLOAT TRUE >> commands.tmp
echo options VCAST_NO_MALLOC TRUE >> commands.tmp
echo options VCAST_NO_STDIN TRUE >> commands.tmp
echo options VCAST_PREPEND_TO_PATH_DIRS $(VECTORCAST_DIR)/MinGW/bin >> commands.tmp
echo options VCAST_STDIO FALSE >> commands.tmp
echo options VCAST_STRICT_TEST_CASE_IMPORT TRUE >> commands.tmp
echo options VCAST_TESTCASE_FAIL_ON_NO_EXPECTED FALSE >> commands.tmp
echo options VCAST_TEST_VALUES_DICTIONARY  >> commands.tmp
echo options VCAST_TYPEOF_OPERATOR TRUE >> commands.tmp
echo options VCAST_VCDB_FLAG_STRING -isystem=1 >> commands.tmp
echo options VCDB_CMD_VERB  >> commands.tmp
echo options VCDB_FILENAME  >> commands.tmp
echo options WHITEBOX YES >> commands.tmp
echo clear_default_source_dirs  >> commands.tmp
echo options TESTABLE_SOURCE_DIR $(VCAST_BASE_DIR)\database\inc >> commands.tmp
echo options TESTABLE_SOURCE_DIR $(VCAST_BASE_DIR)\database\src >> commands.tmp
echo options TESTABLE_SOURCE_DIR $(VCAST_BASE_DIR)\order_entry\inc >> commands.tmp
echo options TESTABLE_SOURCE_DIR $(VCAST_BASE_DIR)\order_entry\src >> commands.tmp
echo options TESTABLE_SOURCE_DIR $(VCAST_BASE_DIR)\main >> commands.tmp
echo options TESTABLE_SOURCE_DIR $(VCAST_BASE_DIR)\utils\inc >> commands.tmp
echo options TESTABLE_SOURCE_DIR $(VCAST_BASE_DIR)\utils\src >> commands.tmp
echo environment build INTEGRATION_TEST.env >> commands.tmp
echo /E:INTEGRATION_TEST tools script run INTEGRATION_TEST.tst >> commands.tmp
echo /E:INTEGRATION_TEST execute all ..\reports\INTEGRATION_TEST_management_report.html >> commands.tmp
echo /E:INTEGRATION_TEST REports Custom CSv_metrics ..\results\INTEGRATION_TEST_coverage.csv >> commands.tmp

setlocal
set PATH=%PATH%;%VECTORCAST_DIR%
WHERE clicast
IF %ERRORLEVEL% NEQ 0 ECHO Error: clicast was not found on System PATH. Add the VectorCAST installation directory to System PATH or set the environment variable VECTORCAST_DIR to the VectorCAST installation directory. && exit /b 1
"CLICAST"  /L:C tools execute commands.tmp true
IF %ERRORLEVEL% NEQ 0 exit /b %ERRORLEVEL%
endlocal
