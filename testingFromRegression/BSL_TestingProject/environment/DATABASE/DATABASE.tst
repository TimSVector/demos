-- VectorCAST 25.sp4 (08/19/25)
-- Test Case Script
--
-- Environment    : DATABASE
-- Unit(s) Under Test: database
--
-- Script Features
TEST.SCRIPT_FEATURE:C_DIRECT_ARRAY_INDEXING
TEST.SCRIPT_FEATURE:CPP_CLASS_OBJECT_REVISION
TEST.SCRIPT_FEATURE:MULTIPLE_UUT_SUPPORT
TEST.SCRIPT_FEATURE:REMOVED_CL_PREFIX
TEST.SCRIPT_FEATURE:MIXED_CASE_NAMES
TEST.SCRIPT_FEATURE:STATIC_HEADER_FUNCS_IN_UUTS
TEST.SCRIPT_FEATURE:VCAST_MAIN_NOT_RENAMED
--

-- Unit: database

-- Subprogram: Get_Record

-- Test Case: ATG-TEST-1-PARTIAL
TEST.UNIT:database
TEST.SUBPROGRAM:Get_Record
TEST.NEW
TEST.NAME:ATG-TEST-1-PARTIAL
TEST.NOTES:
This is an automatically generated test case.
   Test Path 1
       #  dataItem := {0 [0, 0, 0, 0, b'\x00', [[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]], 0.0]}
       #  dataItem.table := Table
       #  dPtr := findData(dataItem)
      (1) if (dPtr == (void *)0) ==> FALSE
       #  return dPtr->Data
   Test Case Generation Notes:
      ATG constructed a partial test-case.
      Unable to handle: #  dataItem := {0 [0, 0, 0, 0, b'\x00', [[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]], 0.0]} (Unable to fully process assignment)
TEST.END_NOTES:
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:database.Get_Record.Table:0
TEST.VALUE:uut_prototype_stubs.findData.return:<<malloc 1>>
TEST.VALUE:uut_prototype_stubs.findData.return[0].table:0
TEST.END

-- Test Case: ATG-TEST-2-PARTIAL
TEST.UNIT:database
TEST.SUBPROGRAM:Get_Record
TEST.NEW
TEST.NAME:ATG-TEST-2-PARTIAL
TEST.NOTES:
This is an automatically generated test case.
   Test Path 2
       #  dataItem := {0 [0, 0, 0, 0, b'\x00', [[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]], 0.0]}
       #  dataItem.table := Table
       #  dPtr := findData(dataItem)
      (1) if (dPtr == (void *)0) ==> TRUE
       #  InsertDataItem(&dataItem)
       #  dPtr := &dataItem
       #  return dPtr->Data
   Test Case Generation Notes:
      ATG constructed a partial test-case.
      Unable to handle: #  dataItem := {0 [0, 0, 0, 0, b'\x00', [[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]], 0.0]} (Unable to fully process assignment)
TEST.END_NOTES:
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:database.Get_Record.Table:262143
TEST.VALUE:uut_prototype_stubs.findData.return:<<null>>
TEST.VALUE:uut_prototype_stubs.InsertDataItem.Data[0].table:0
TEST.VALUE:uut_prototype_stubs.InsertDataItem.return:0
TEST.END

-- Subprogram: Remove_Record

-- Test Case: ATG-TEST-1
TEST.UNIT:database
TEST.SUBPROGRAM:Remove_Record
TEST.NEW
TEST.NAME:ATG-TEST-1
TEST.NOTES:
This is an automatically generated test case.
   Test Path 1
       #  dataItem.table := Table
       #  RemoveDataItem(&dataItem)
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:database.Remove_Record.Table:262143
TEST.VALUE:uut_prototype_stubs.RemoveDataItem.Data[0].table:0
TEST.VALUE:uut_prototype_stubs.RemoveDataItem.return:0
TEST.END

-- Subprogram: Update_Record

-- Test Case: ATG-TEST-1-PARTIAL
TEST.UNIT:database
TEST.SUBPROGRAM:Update_Record
TEST.NEW
TEST.NAME:ATG-TEST-1-PARTIAL
TEST.NOTES:
This is an automatically generated test case.
   Test Path 1
       #  dataItem := {0 [0, 0, 0, 0, b'\x00', [[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]], 0.0]}
       #  dataItem.table := Table
       #  entry := findData(dataItem)
      (1) if (entry != (void *)0) ==> FALSE
   Test Case Generation Notes:
      ATG constructed a partial test-case.
      Unable to handle: #  dataItem := {0 [0, 0, 0, 0, b'\x00', [[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]], 0.0]} (Unable to fully process assignment)
TEST.END_NOTES:
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:database.Update_Record.Table:0
TEST.VALUE:uut_prototype_stubs.findData.return:<<null>>
TEST.END

-- Test Case: ATG-TEST-2-PARTIAL
TEST.UNIT:database
TEST.SUBPROGRAM:Update_Record
TEST.NEW
TEST.NAME:ATG-TEST-2-PARTIAL
TEST.NOTES:
This is an automatically generated test case.
   Test Path 2
       #  dataItem := {0 [0, 0, 0, 0, b'\x00', [[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]], 0.0]}
       #  dataItem.table := Table
       #  entry := findData(dataItem)
      (1) if (entry != (void *)0) ==> TRUE
       #  entry->Data := Data
   Test Case Generation Notes:
      ATG constructed a partial test-case.
      Unable to handle: #  dataItem := {0 [0, 0, 0, 0, b'\x00', [[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]], 0.0]} (Unable to fully process assignment)
TEST.END_NOTES:
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:database.Update_Record.Table:262143
TEST.VALUE:uut_prototype_stubs.findData.return:<<malloc 1>>
TEST.VALUE:uut_prototype_stubs.findData.return[0].table:0
TEST.END
