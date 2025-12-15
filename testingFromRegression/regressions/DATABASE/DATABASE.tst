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

-- Subprogram: Get_Table_Record

-- Test Case: Get_Table_Record.001
TEST.UNIT:database
TEST.SUBPROGRAM:Get_Table_Record
TEST.NEW
TEST.NAME:Get_Table_Record.001
TEST.BASIS_PATH:1 of 1
TEST.NOTES:
   No branches in subprogram
TEST.END_NOTES:
TEST.VALUE:database.<<GLOBAL>>.Table_Data[0].Is_Occupied:v_true
TEST.VALUE:database.<<GLOBAL>>.Table_Data[0].Number_In_Party:1
TEST.VALUE:database.<<GLOBAL>>.Table_Data[0].Order[1].Soup:NO_SOUP
TEST.VALUE:database.<<GLOBAL>>.Table_Data[0].Order[1].Salad:GREEN
TEST.VALUE:database.<<GLOBAL>>.Table_Data[0].Order[1].Entree:CHICKEN
TEST.VALUE:database.<<GLOBAL>>.Table_Data[0].Order[1].Dessert:NO_DESSERT
TEST.VALUE:database.<<GLOBAL>>.Table_Data[0].Order[1].Beverage:BEER
TEST.VALUE:database.<<GLOBAL>>.Table_Data[0].Check_Total:10.0
TEST.VALUE:database.Get_Table_Record.Table:0
TEST.EXPECTED:database.Get_Table_Record.return.Check_Total:10.0
TEST.END

-- Subprogram: Update_Table_Record

-- Test Case: Update_Table_Record.001
TEST.UNIT:database
TEST.SUBPROGRAM:Update_Table_Record
TEST.NEW
TEST.NAME:Update_Table_Record.001
TEST.BASIS_PATH:1 of 1
TEST.NOTES:
   No branches in subprogram
TEST.END_NOTES:
TEST.VALUE:database.<<GLOBAL>>.Table_Data[0].Is_Occupied:v_true
TEST.VALUE:database.<<GLOBAL>>.Table_Data[0].Number_In_Party:1
TEST.VALUE:database.<<GLOBAL>>.Table_Data[0].Order[1].Soup:NO_SOUP
TEST.VALUE:database.<<GLOBAL>>.Table_Data[0].Order[1].Salad:GREEN
TEST.VALUE:database.<<GLOBAL>>.Table_Data[0].Order[1].Entree:CHICKEN
TEST.VALUE:database.<<GLOBAL>>.Table_Data[0].Order[1].Dessert:NO_DESSERT
TEST.VALUE:database.<<GLOBAL>>.Table_Data[0].Order[1].Beverage:BEER
TEST.VALUE:database.<<GLOBAL>>.Table_Data[0].Check_Total:10.0
TEST.VALUE:database.Update_Table_Record.Table:0
TEST.VALUE:database.Update_Table_Record.Data.Is_Occupied:v_false
TEST.EXPECTED:database.Update_Table_Record.Data.Is_Occupied:v_false
TEST.END
