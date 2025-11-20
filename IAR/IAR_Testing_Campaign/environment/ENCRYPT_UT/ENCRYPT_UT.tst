-- VectorCAST 25.sp4 (08/19/25)
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
--

-- Unit: encrypt

-- Subprogram: transmit_Info

-- Test Case: encrypt.transmit_Info.failure
TEST.UNIT:encrypt
TEST.SUBPROGRAM:transmit_Info
TEST.NEW
TEST.NAME:encrypt.transmit_Info.failure
TEST.IMPORT_FAILURES:
(E) @LINE: 411 TEST.VALUE:encrypt.transmit_Info.Info:12.34
    >>> Value for 'numeric type' out of range
    >>>    Read "12.34"
    >>>    The script line will be ignored.
TEST.END_IMPORT_FAILURES:
TEST.STUB:encrypt.generate_private_key
TEST.VALUE:encrypt.transmit_Info.name:<<malloc 14>>
TEST.VALUE:encrypt.transmit_Info.name:"Tim Schneider"
TEST.VALUE:encrypt.transmit_Info.number:<<malloc 17>>
TEST.VALUE:encrypt.transmit_Info.number:"0000111122223333"
TEST.VALUE:encrypt.transmit_Info.secCode:<<malloc 4>>
TEST.VALUE:encrypt.transmit_Info.secCode:"012"
TEST.VALUE:uut_prototype_stubs.matrix_multiply.return:-1
TEST.EXPECTED:encrypt.transmit_Info.return:<<MAX>>
TEST.VALUE_USER_CODE:encrypt.transmit_Info.Info
<<encrypt.transmit_Info.Info>> = ( 14.75 );
TEST.END_VALUE_USER_CODE:
TEST.END

-- Test Case: encrypt.transmit_Info.good
TEST.UNIT:encrypt
TEST.SUBPROGRAM:transmit_Info
TEST.NEW
TEST.NAME:encrypt.transmit_Info.good
TEST.IMPORT_FAILURES:
(E) @LINE: 427 TEST.VALUE:encrypt.transmit_Info.Info:12.34
    >>> Value for 'numeric type' out of range
    >>>    Read "12.34"
    >>>    The script line will be ignored.
TEST.END_IMPORT_FAILURES:
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
