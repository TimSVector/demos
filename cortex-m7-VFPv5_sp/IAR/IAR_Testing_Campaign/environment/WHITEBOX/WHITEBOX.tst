-- VectorCAST 26.sp1 (04/27/26)
-- Test Case Script
--
-- Environment    : WHITEBOX
-- Unit(s) Under Test: whitebox
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

-- Unit: whitebox

-- Subprogram: InitColor

-- Test Case: ATG-TEST-1
TEST.UNIT:whitebox
TEST.SUBPROGRAM:InitColor
TEST.NEW
TEST.NAME:ATG-TEST-1
TEST.NOTES:
This is an automatically generated test case.
   Test Path 1
       # CurrentColor := Val
   Test Case Generation Notes:

TEST.END_NOTES:
TEST.VALUE:whitebox.InitColor.Val:RED
TEST.END

-- Subprogram: InitDay

-- Test Case: ATG-TEST-1
TEST.UNIT:whitebox
TEST.SUBPROGRAM:InitDay
TEST.NEW
TEST.NAME:ATG-TEST-1
TEST.NOTES:
This is an automatically generated test case.
   Test Path 1
       # CurrentDay := Val
   Test Case Generation Notes:

TEST.END_NOTES:
TEST.VALUE:whitebox.InitDay.Val:MONDAY
TEST.END

-- Subprogram: Initialize

-- Test Case: ATG-TEST-1
TEST.UNIT:whitebox
TEST.SUBPROGRAM:Initialize
TEST.NEW
TEST.NAME:ATG-TEST-1
TEST.NOTES:
This is an automatically generated test case.
   Test Path 1
       # InitDay(WEDNESDAY)
       # InitColor(BLUE)
       # P.DataIndex := 1
       # P.DataValue := 12
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.STUB:whitebox.InitDay
TEST.STUB:whitebox.InitColor
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.END

-- Subprogram: doMath

-- Test Case: ATG-TEST-1
TEST.UNIT:whitebox
TEST.SUBPROGRAM:doMath
TEST.NEW
TEST.NAME:ATG-TEST-1
TEST.NOTES:
This is an automatically generated test case.
   Test Path 1
       # return a * b
   Test Case Generation Notes:
      No TEST.VALUE lines generated (no decisions on path and --init-reads is disabled)
TEST.END_NOTES:
TEST.END
