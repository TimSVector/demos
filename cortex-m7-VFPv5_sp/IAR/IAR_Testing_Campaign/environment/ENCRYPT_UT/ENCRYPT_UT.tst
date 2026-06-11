-- VectorCAST 26.sp1 (04/27/26)
-- Test Case Script
--
-- Environment    : ENCRYPT_UT
-- Unit(s) Under Test: encrypt
--
-- Script Features
TEST.SCRIPT_FEATURE:C_DIRECT_ARRAY_INDEXING
TEST.SCRIPT_FEATURE:CPP_CLASS_OBJECT_REVISION
TEST.SCRIPT_FEATURE:MULTIPLE_UUT_SUPPORT
TEST.SCRIPT_FEATURE:REMOVED_CL_PREFIX
TEST.SCRIPT_FEATURE:MIXED_CASE_NAMES
TEST.SCRIPT_FEATURE:STANDARD_SPACING_R2
TEST.SCRIPT_FEATURE:OVERLOADED_CONST_SUPPORT
TEST.SCRIPT_FEATURE:UNDERSCORE_NULLPTR
TEST.SCRIPT_FEATURE:FULL_PARAMETER_TYPES
TEST.SCRIPT_FEATURE:STRUCT_DTOR_ADDS_POINTER
TEST.SCRIPT_FEATURE:STRUCT_FIELD_CTOR_ADDS_POINTER
TEST.SCRIPT_FEATURE:STRUCT_BASE_CTOR_ADDS_POINTER
TEST.SCRIPT_FEATURE:STATIC_HEADER_FUNCS_IN_UUTS
TEST.SCRIPT_FEATURE:VCAST_MAIN_NOT_RENAMED
TEST.SCRIPT_FEATURE:USING_DECL_FOR_BASE_MEMBER_HANDLED
--

-- Unit: encrypt

-- Subprogram: Encrypt_Info

-- Test Case: ATG-TEST-1
TEST.UNIT:encrypt
TEST.SUBPROGRAM:Encrypt_Info
TEST.NEW
TEST.NAME:ATG-TEST-1
TEST.NOTES:
This is an automatically generated test case.
   Test Path 1
       # ret_val := 0
      (1) if (name != (void *)0 && total > (0)) ==> FALSE
       # return ret_val
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.STUB:encrypt.encrypt_and_send
TEST.VALUE:encrypt.Encrypt_Info.private_key:<<malloc 1>>
TEST.VALUE:encrypt.Encrypt_Info.name:<<malloc 1>>
TEST.VALUE:encrypt.Encrypt_Info.name[0]:0
TEST.VALUE:encrypt.Encrypt_Info.total:0
TEST.END

-- Test Case: ATG-TEST-2
TEST.UNIT:encrypt
TEST.SUBPROGRAM:Encrypt_Info
TEST.NEW
TEST.NAME:ATG-TEST-2
TEST.NOTES:
This is an automatically generated test case.
   Test Path 2
       # ret_val := 0
      (1) if (name != (void *)0 && total > (0)) ==> TRUE
       # ret_val |= encrypt_and_send(name, 4, 4, private_key)
       # ret_val |= encrypt_and_send(number, 4, 4, private_key)
       # ret_val |= encrypt_and_send(secCode, 1, 4, private_key)
       # byteArray[0] := (uint8_t)(total & (0xffU))
       # byteArray[1] := (uint8_t)((total & (0xff00U)) >> 8U)
       # byteArray[2] := (uint8_t)((total & (0xff0000U)) >> 16U)
       # byteArray[3] := (uint8_t)((total & (0xff0000U)) >> 24U)
       # ret_val |= encrypt_and_send((const int8_t *)(&byteArray), 4, 4, private_key)
       # return ret_val
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.STUB:encrypt.encrypt_and_send
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:encrypt.encrypt_and_send.return:0
TEST.VALUE:encrypt.Encrypt_Info.private_key:<<malloc 1>>
TEST.VALUE:encrypt.Encrypt_Info.name:<<malloc 1>>
TEST.VALUE:encrypt.Encrypt_Info.name[0]:0
TEST.VALUE:encrypt.Encrypt_Info.number[0]:0
TEST.VALUE:encrypt.Encrypt_Info.secCode[0]:0
TEST.VALUE:encrypt.Encrypt_Info.total:1
TEST.END

-- Subprogram: encrypt_and_send

-- Test Case: ATG-TEST-1
TEST.UNIT:encrypt
TEST.SUBPROGRAM:encrypt_and_send
TEST.NEW
TEST.NAME:ATG-TEST-1
TEST.NOTES:
This is an automatically generated test case.
   Test Path 1
       # data2BSent := {4,4,{{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}}}
       # result := {4,4,{{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}}}
      (1) if (inData != (void *)0) ==> FALSE
      (6) if (matrix_multiply(&data2BSent, private_key, &result) == (FAILURE)) ==> FALSE
       # ret_val := sendData(result)
       # return ret_val
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.STUB:encrypt.sendData
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:encrypt.sendData.return:0
TEST.VALUE:encrypt.encrypt_and_send.inData:<<null>>
TEST.VALUE:encrypt.encrypt_and_send.private_key:<<malloc 1>>
TEST.VALUE:uut_prototype_stubs.matrix_multiply.return:-2
TEST.END

-- Test Case: ATG-TEST-2
TEST.UNIT:encrypt
TEST.SUBPROGRAM:encrypt_and_send
TEST.NEW
TEST.NAME:ATG-TEST-2
TEST.NOTES:
This is an automatically generated test case.
   Test Path 2
       # data2BSent := {4,4,{{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}}}
       # result := {4,4,{{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}}}
      (1) if (inData != (void *)0) ==> FALSE
      (6) if (matrix_multiply(&data2BSent, private_key, &result) == (FAILURE)) ==> TRUE
       # ret_val := FAILURE
       # return ret_val
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.STUB:encrypt.sendData
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:encrypt.encrypt_and_send.inData:<<null>>
TEST.VALUE:encrypt.encrypt_and_send.private_key:<<malloc 1>>
TEST.VALUE:uut_prototype_stubs.matrix_multiply.return:-1
TEST.END

-- Test Case: ATG-TEST-3
TEST.UNIT:encrypt
TEST.SUBPROGRAM:encrypt_and_send
TEST.NEW
TEST.NAME:ATG-TEST-3
TEST.NOTES:
This is an automatically generated test case.
   Test Path 3
       # data2BSent := {4,4,{{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}}}
       # result := {4,4,{{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}}}
      (1) if (inData != (void *)0) ==> TRUE
       # inEnd := 0
       # i := 0
      (2) for (i < row) ==> FALSE
       # data2BSent.row := row
       # data2BSent.col := col
      (6) if (matrix_multiply(&data2BSent, private_key, &result) == (FAILURE)) ==> FALSE
       # ret_val := sendData(result)
       # return ret_val
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.STUB:encrypt.sendData
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:encrypt.sendData.return:0
TEST.VALUE:encrypt.encrypt_and_send.inData:<<malloc 1>>
TEST.VALUE:encrypt.encrypt_and_send.inData[0]:0
TEST.VALUE:encrypt.encrypt_and_send.row:0
TEST.VALUE:encrypt.encrypt_and_send.col:262143
TEST.VALUE:encrypt.encrypt_and_send.private_key:<<malloc 1>>
TEST.VALUE:uut_prototype_stubs.matrix_multiply.return:-2
TEST.END

-- Test Case: ATG-TEST-4
TEST.UNIT:encrypt
TEST.SUBPROGRAM:encrypt_and_send
TEST.NEW
TEST.NAME:ATG-TEST-4
TEST.NOTES:
This is an automatically generated test case.
   Test Path 4
       # data2BSent := {4,4,{{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}}}
       # result := {4,4,{{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}}}
      (1) if (inData != (void *)0) ==> TRUE
       # inEnd := 0
       # i := 0
      (2) for (i < row) ==> TRUE
       # j := 0
      (3) for (j < col) ==> FALSE
       # i++
       # data2BSent.row := row
       # data2BSent.col := col
      (6) if (matrix_multiply(&data2BSent, private_key, &result) == (FAILURE)) ==> FALSE
       # ret_val := sendData(result)
       # return ret_val
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.STUB:encrypt.sendData
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:encrypt.sendData.return:0
TEST.VALUE:encrypt.encrypt_and_send.inData:<<malloc 1>>
TEST.VALUE:encrypt.encrypt_and_send.inData[0]:0
TEST.VALUE:encrypt.encrypt_and_send.row:1
TEST.VALUE:encrypt.encrypt_and_send.col:0
TEST.VALUE:encrypt.encrypt_and_send.private_key:<<malloc 1>>
TEST.VALUE:uut_prototype_stubs.matrix_multiply.return:-2
TEST.END

-- Test Case: ATG-TEST-5-PARTIAL
TEST.UNIT:encrypt
TEST.SUBPROGRAM:encrypt_and_send
TEST.NEW
TEST.NAME:ATG-TEST-5-PARTIAL
TEST.NOTES:
This is an automatically generated test case.
   Test Path 5
       # data2BSent := {4,4,{{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}}}
       # result := {4,4,{{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}}}
      (1) if (inData != (void *)0) ==> TRUE
       # inEnd := 0
       # i := 0
      (2) for (i < row) ==> TRUE
       # j := 0
      (3) for (j < col) ==> TRUE
      (4) if (*inData == 0) ==> FALSE
      (5) if (inEnd > (0)) ==> FALSE
       # data2BSent.matrix[i][j] := 0
       # j++
       # i++
       # data2BSent.row := row
       # data2BSent.col := col
      (6) if (matrix_multiply(&data2BSent, private_key, &result) == (FAILURE)) ==> FALSE
       # ret_val := sendData(result)
       # return ret_val
   Test Case Generation Notes:
      ATG constructed a partial test-case.
      Unable to handle: # data2BSent.matrix[i][j] := 0 (Unable to satisfy decision)
TEST.END_NOTES:
TEST.STUB:encrypt.sendData
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:encrypt.sendData.return:0
TEST.VALUE:encrypt.encrypt_and_send.inData:<<malloc 1>>
TEST.VALUE:encrypt.encrypt_and_send.inData[0]:1
TEST.VALUE:encrypt.encrypt_and_send.row:1
TEST.VALUE:encrypt.encrypt_and_send.col:1
TEST.VALUE:encrypt.encrypt_and_send.private_key:<<malloc 1>>
TEST.VALUE:uut_prototype_stubs.matrix_multiply.return:-2
TEST.END

-- Test Case: ATG-TEST-6-PARTIAL
TEST.UNIT:encrypt
TEST.SUBPROGRAM:encrypt_and_send
TEST.NEW
TEST.NAME:ATG-TEST-6-PARTIAL
TEST.NOTES:
This is an automatically generated test case.
   Test Path 6
       # data2BSent := {4,4,{{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}}}
       # result := {4,4,{{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}}}
      (1) if (inData != (void *)0) ==> TRUE
       # inEnd := 0
       # i := 0
      (2) for (i < row) ==> TRUE
       # j := 0
      (3) for (j < col) ==> TRUE
      (4) if (*inData == 0) ==> FALSE
      (5) if (inEnd > (0)) ==> TRUE
       # data2BSent.matrix[i][j] := *inData
       # inData++
       # j++
       # i++
       # data2BSent.row := row
       # data2BSent.col := col
      (6) if (matrix_multiply(&data2BSent, private_key, &result) == (FAILURE)) ==> FALSE
       # ret_val := sendData(result)
       # return ret_val
   Test Case Generation Notes:
      ATG constructed a partial test-case.
      Unable to handle: (5) if (inEnd > (0)) ==> TRUE (Unable to satisfy decision)
      Unable to handle: # data2BSent.matrix[i][j] := *inData (Unable to satisfy decision)
TEST.END_NOTES:
TEST.STUB:encrypt.sendData
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:encrypt.sendData.return:0
TEST.VALUE:encrypt.encrypt_and_send.inData:<<malloc 1>>
TEST.VALUE:encrypt.encrypt_and_send.inData[0]:1
TEST.VALUE:encrypt.encrypt_and_send.row:1
TEST.VALUE:encrypt.encrypt_and_send.col:1
TEST.VALUE:encrypt.encrypt_and_send.private_key:<<malloc 1>>
TEST.VALUE:uut_prototype_stubs.matrix_multiply.return:-2
TEST.END

-- Test Case: ATG-TEST-7-PARTIAL
TEST.UNIT:encrypt
TEST.SUBPROGRAM:encrypt_and_send
TEST.NEW
TEST.NAME:ATG-TEST-7-PARTIAL
TEST.NOTES:
This is an automatically generated test case.
   Test Path 7
       # data2BSent := {4,4,{{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}}}
       # result := {4,4,{{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}}}
      (1) if (inData != (void *)0) ==> TRUE
       # inEnd := 0
       # i := 0
      (2) for (i < row) ==> TRUE
       # j := 0
      (3) for (j < col) ==> TRUE
      (4) if (*inData == 0) ==> TRUE
       # inEnd := 1
      (5) if (inEnd > (0)) ==> FALSE
       # data2BSent.matrix[i][j] := 0
       # j++
       # i++
       # data2BSent.row := row
       # data2BSent.col := col
      (6) if (matrix_multiply(&data2BSent, private_key, &result) == (FAILURE)) ==> FALSE
       # ret_val := sendData(result)
       # return ret_val
   Test Case Generation Notes:
      ATG constructed a partial test-case.
      Unable to handle: (5) if (inEnd > (0)) ==> FALSE (Unable to satisfy decision)
      Unable to handle: # data2BSent.matrix[i][j] := 0 (Unable to satisfy decision)
TEST.END_NOTES:
TEST.STUB:encrypt.sendData
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:encrypt.sendData.return:0
TEST.VALUE:encrypt.encrypt_and_send.inData:<<malloc 1>>
TEST.VALUE:encrypt.encrypt_and_send.inData[0]:0
TEST.VALUE:encrypt.encrypt_and_send.row:1
TEST.VALUE:encrypt.encrypt_and_send.col:1
TEST.VALUE:encrypt.encrypt_and_send.private_key:<<malloc 1>>
TEST.VALUE:uut_prototype_stubs.matrix_multiply.return:-2
TEST.END

-- Test Case: ATG-TEST-8-TOP-UP-PARTIAL
TEST.UNIT:encrypt
TEST.SUBPROGRAM:encrypt_and_send
TEST.NEW
TEST.NAME:ATG-TEST-8-TOP-UP-PARTIAL
TEST.NOTES:
This is an automatically generated test case.
   Test Path 8
       # data2BSent := {4,4,{{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}}}
       # result := {4,4,{{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}}}
      (1) if (inData != (void *)0) ==> TRUE
       # inEnd := 0
       # i := 0
      (2) for (i < row) ==> TRUE
       # j := 0
      (3) for (j < col) ==> TRUE
      (4) if (*inData == 0) ==> TRUE
       # inEnd := 1
      (5) if (inEnd > (0)) ==> TRUE (TOP-UP target)
       # data2BSent.matrix[i][j] := *inData
       # inData++
       # j++
       # i++
       # data2BSent.row := row
       # data2BSent.col := col
      (6) if (matrix_multiply(&data2BSent, private_key, &result) == (FAILURE)) ==> FALSE
       # ret_val := sendData(result)
       # return ret_val
   Test Case Generation Notes:
      ATG constructed a partial test-case.
      Unable to handle: # data2BSent.matrix[i][j] := *inData (Unable to satisfy decision)
TEST.END_NOTES:
TEST.STUB:encrypt.sendData
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:encrypt.sendData.return:0
TEST.VALUE:encrypt.encrypt_and_send.inData:<<malloc 1>>
TEST.VALUE:encrypt.encrypt_and_send.inData[0]:0
TEST.VALUE:encrypt.encrypt_and_send.row:1
TEST.VALUE:encrypt.encrypt_and_send.col:1
TEST.VALUE:encrypt.encrypt_and_send.private_key:<<malloc 1>>
TEST.VALUE:uut_prototype_stubs.matrix_multiply.return:-2
TEST.END

-- Subprogram: generate_private_key

-- Test Case: ATG-TEST-1-PARTIAL
TEST.UNIT:encrypt
TEST.SUBPROGRAM:generate_private_key
TEST.NEW
TEST.NAME:ATG-TEST-1-PARTIAL
TEST.NOTES:
This is an automatically generated test case.
   Test Path 1
       # private_key := {4294967295,4294967295}
       # srand(0)
      (1) if (private_key.row == -1 && private_key.col == -1) ==> FALSE
       # return private_key
   Test Case Generation Notes:
      ATG constructed a partial test-case.
      No TEST.VALUE lines generated (function has no controllable inputs: no parameters, globals, stub calls, or class fields on this path; note: static locals and const globals are not controllable)
      Unable to handle: # srand(0) (Unable to fully process expression)
      Unable to handle: (1) if (private_key.row == -1 && private_key.col == -1) ==> FALSE (Unable to satisfy decision)
TEST.END_NOTES:
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.END

-- Test Case: ATG-TEST-2-PARTIAL
TEST.UNIT:encrypt
TEST.SUBPROGRAM:generate_private_key
TEST.NEW
TEST.NAME:ATG-TEST-2-PARTIAL
TEST.NOTES:
This is an automatically generated test case.
   Test Path 2
       # private_key := {4294967295,4294967295}
       # srand(0)
      (1) if (private_key.row == -1 && private_key.col == -1) ==> TRUE
       # private_key.row := 4
       # private_key.col := 4
       # i := 0
      (2) for (i < (4)) ==> FALSE
       # return private_key
   Test Case Generation Notes:
      ATG constructed a partial test-case.
      No TEST.VALUE lines generated (function has no controllable inputs: no parameters, globals, stub calls, or class fields on this path; note: static locals and const globals are not controllable)
      Unable to handle: # srand(0) (Unable to fully process expression)
      Unable to handle: (2) for (i < (4)) ==> FALSE (Unable to satisfy decision)
TEST.END_NOTES:
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.END

-- Test Case: ATG-TEST-3-PARTIAL
TEST.UNIT:encrypt
TEST.SUBPROGRAM:generate_private_key
TEST.NEW
TEST.NAME:ATG-TEST-3-PARTIAL
TEST.NOTES:
This is an automatically generated test case.
   Test Path 3
       # private_key := {4294967295,4294967295}
       # srand(0)
      (1) if (private_key.row == -1 && private_key.col == -1) ==> TRUE
       # private_key.row := 4
       # private_key.col := 4
       # i := 0
      (2) for (i < (4)) ==> TRUE
       # j := 0
      (3) for (j < (4)) ==> TRUE (unroll BEGIN)
       # private_key.matrix[i][j] := rand() % 0xff
       # j++
       # private_key.matrix[i][j] := rand() % 0xff
       # j++
       # private_key.matrix[i][j] := rand() % 0xff
       # j++
       # private_key.matrix[i][j] := rand() % 0xff
       # j++
      (3) for (j < (4)) ==> FALSE (unroll END)
       # i++
       # return private_key
   Test Case Generation Notes:
      ATG constructed a partial test-case.
      No TEST.VALUE lines generated (has stubs but solver couldn't determine values)
      Unable to handle: # srand(0) (Unable to fully process expression)
      Unable to handle: # private_key.matrix[i][j] := rand() % 0xff (Unable to fully process expression)
TEST.END_NOTES:
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.END

-- Subprogram: sendData

-- Test Case: ATG-TEST-1-PARTIAL
TEST.UNIT:encrypt
TEST.SUBPROGRAM:sendData
TEST.NEW
TEST.NAME:ATG-TEST-1-PARTIAL
TEST.NOTES:
This is an automatically generated test case.
   Test Path 1
       # ret_val := 0
       # printf("ENCRYPTED DATA (%dx%d): ", data.row, data.col)
       # i := 0
      (1) for (i < data.row && i < (4)) ==> FALSE
       # printf("\n")
       # return ret_val
   Test Case Generation Notes:
      ATG constructed a partial test-case.
      Unable to handle: # printf("ENCRYPTED DATA (%dx%d): ", data.row, data.col) (Unable to fully process expression)
      Unable to handle: # printf("\n") (Unable to fully process expression)
TEST.END_NOTES:
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:encrypt.sendData.data.row:0
TEST.END

-- Test Case: ATG-TEST-2-PARTIAL
TEST.UNIT:encrypt
TEST.SUBPROGRAM:sendData
TEST.NEW
TEST.NAME:ATG-TEST-2-PARTIAL
TEST.NOTES:
This is an automatically generated test case.
   Test Path 2
       # ret_val := 0
       # printf("ENCRYPTED DATA (%dx%d): ", data.row, data.col)
       # i := 0
      (1) for (i < data.row && i < (4)) ==> TRUE
       # j := 0
      (2) for (j < data.col && j < (4)) ==> FALSE
       # i++
       # printf("\n")
       # return ret_val
   Test Case Generation Notes:
      ATG constructed a partial test-case.
      Unable to handle: # printf("ENCRYPTED DATA (%dx%d): ", data.row, data.col) (Unable to fully process expression)
      Unable to handle: # printf("\n") (Unable to fully process expression)
TEST.END_NOTES:
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:encrypt.sendData.data.row:1
TEST.VALUE:encrypt.sendData.data.col:0
TEST.END

-- Test Case: ATG-TEST-3-PARTIAL
TEST.UNIT:encrypt
TEST.SUBPROGRAM:sendData
TEST.NEW
TEST.NAME:ATG-TEST-3-PARTIAL
TEST.NOTES:
This is an automatically generated test case.
   Test Path 3
       # ret_val := 0
       # printf("ENCRYPTED DATA (%dx%d): ", data.row, data.col)
       # i := 0
      (1) for (i < data.row && i < (4)) ==> TRUE
       # j := 0
      (2) for (j < data.col && j < (4)) ==> TRUE
       # printf("%02X ", data.matrix[i][j])
       # j++
       # i++
       # printf("\n")
       # return ret_val
   Test Case Generation Notes:
      ATG constructed a partial test-case.
      Unable to handle: # printf("ENCRYPTED DATA (%dx%d): ", data.row, data.col) (Unable to fully process expression)
      Unable to handle: # printf("%02X ", data.matrix[i][j]) (Unable to fully process expression)
      Unable to handle: # printf("\n") (Unable to fully process expression)
TEST.END_NOTES:
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:encrypt.sendData.data.row:1
TEST.VALUE:encrypt.sendData.data.col:1
TEST.END

-- Subprogram: transmit_Info

-- Test Case: ATG-TEST-1
TEST.UNIT:encrypt
TEST.SUBPROGRAM:transmit_Info
TEST.NEW
TEST.NAME:ATG-TEST-1
TEST.NOTES:
This is an automatically generated test case.
   Test Path 1
       # private_key := generate_private_key()
       # total := (uint32_t)Info * (100)
       # return Encrypt_Info(&private_key, name, number, secCode, total)
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.STUB:encrypt.generate_private_key
TEST.STUB:encrypt.Encrypt_Info
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:encrypt.Encrypt_Info.return:0
TEST.VALUE:encrypt.transmit_Info.name:<<malloc 1>>
TEST.VALUE:encrypt.transmit_Info.name[0]:0
TEST.VALUE:encrypt.transmit_Info.number[0]:0
TEST.VALUE:encrypt.transmit_Info.secCode[0]:0
TEST.VALUE:encrypt.transmit_Info.Info:1.401298464324817E-45
TEST.END

-- Test Case: encrypt.transmit_Info.failure
TEST.UNIT:encrypt
TEST.SUBPROGRAM:transmit_Info
TEST.NEW
TEST.NAME:encrypt.transmit_Info.failure
TEST.STUB:encrypt.generate_private_key
TEST.VALUE:encrypt.transmit_Info.name:<<malloc 14>>
TEST.VALUE:encrypt.transmit_Info.name:"Tim Schneider"
TEST.VALUE:encrypt.transmit_Info.number:<<malloc 17>>
TEST.VALUE:encrypt.transmit_Info.number:"0000111122223333"
TEST.VALUE:encrypt.transmit_Info.secCode:<<malloc 4>>
TEST.VALUE:encrypt.transmit_Info.secCode:"012"
TEST.VALUE:uut_prototype_stubs.matrix_multiply.return:-1
TEST.VALUE_USER_CODE:encrypt.transmit_Info.Info
<<encrypt.transmit_Info.Info>> = ( 14.75 );
TEST.END_VALUE_USER_CODE:
TEST.END

-- Test Case: encrypt.transmit_Info.good
TEST.UNIT:encrypt
TEST.SUBPROGRAM:transmit_Info
TEST.NEW
TEST.NAME:encrypt.transmit_Info.good
TEST.VALUE:encrypt.transmit_Info.name:<<malloc 14>>
TEST.VALUE:encrypt.transmit_Info.name:"Tim Schneider"
TEST.VALUE:encrypt.transmit_Info.number:<<malloc 17>>
TEST.VALUE:encrypt.transmit_Info.number:"0000111122223333"
TEST.VALUE:encrypt.transmit_Info.secCode:<<malloc 4>>
TEST.VALUE:encrypt.transmit_Info.secCode:"012"
TEST.EXPECTED:encrypt.transmit_Info.return:MACRO=SUCCESS
TEST.VALUE_USER_CODE:encrypt.transmit_Info.Info
<<encrypt.transmit_Info.Info>> = ( 45.0 );
TEST.END_VALUE_USER_CODE:
TEST.END
