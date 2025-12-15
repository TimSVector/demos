-- VectorCAST 25.sp4 (08/19/25)
-- Test Case Script
--
-- Environment    : MANAGER
-- Unit(s) Under Test: manager
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

-- Unit: manager

-- Subprogram: Add_Included_Dessert

-- Test Case: Add_Included_Dessert.All_Specials
TEST.UNIT:manager
TEST.SUBPROGRAM:Add_Included_Dessert
TEST.NEW
TEST.NAME:Add_Included_Dessert.All_Specials
TEST.VALUE:manager.Add_Included_Dessert.Order:<<malloc 1>>
TEST.VALUE:manager.Add_Included_Dessert.Order[0].Salad:NO_SALAD,CAESAR,GREEN
TEST.VALUE:manager.Add_Included_Dessert.Order[0].Entree:NO_ENTREE,STEAK,LOBSTER
TEST.VALUE:manager.Add_Included_Dessert.Order[0].Dessert:FRUIT
TEST.VALUE:manager.Add_Included_Dessert.Order[0].Beverage:BEER,MIXED_DRINK,WINE
TEST.EXPECTED:manager.Add_Included_Dessert.Order[0].Dessert:FRUIT,PIE,CAKE
TEST.END

-- Subprogram: Clear_Table

-- Test Case: Clear_Table.NotPaid
TEST.UNIT:manager
TEST.SUBPROGRAM:Clear_Table
TEST.NEW
TEST.NAME:Clear_Table.NotPaid
TEST.VALUE:manager.Clear_Table.Table:1
TEST.VALUE:uut_prototype_stubs.Get_Record.return.Is_Bill_Paid:v_false
TEST.EXPECTED:manager.Clear_Table.return:MACRO=FAILURE
TEST.END

-- Test Case: Clear_Table.Paid
TEST.UNIT:manager
TEST.SUBPROGRAM:Clear_Table
TEST.NEW
TEST.NAME:Clear_Table.Paid
TEST.VALUE:manager.Clear_Table.Table:1
TEST.VALUE:uut_prototype_stubs.Get_Record.return.Is_Bill_Paid:v_true
TEST.EXPECTED:manager.Clear_Table.return:MACRO=SUCCESS
TEST.END

-- Subprogram: Get_Check_Total

-- Test Case: Get_Check_Total.001
TEST.UNIT:manager
TEST.SUBPROGRAM:Get_Check_Total
TEST.NEW
TEST.NAME:Get_Check_Total.001
TEST.VALUE:uut_prototype_stubs.Get_Record.return.Check_Total:21.0
TEST.EXPECTED:manager.Get_Check_Total.return:21.0
TEST.END

-- Subprogram: Pay_The_Bill

-- Test Case: Pay_The_Bill.001
TEST.UNIT:manager
TEST.SUBPROGRAM:Pay_The_Bill
TEST.NEW
TEST.NAME:Pay_The_Bill.001
TEST.VALUE:manager.Pay_The_Bill.name:<<malloc 6>>
TEST.VALUE:manager.Pay_The_Bill.name:"Derek"
TEST.VALUE:manager.Pay_The_Bill.cardNumber:<<malloc 14>>
TEST.VALUE:manager.Pay_The_Bill.cardNumber:"0000111111111"
TEST.VALUE:manager.Pay_The_Bill.secCode:<<malloc 4>>
TEST.VALUE:manager.Pay_The_Bill.secCode:"999"
TEST.VALUE:manager.Pay_The_Bill.Table:1
TEST.END

-- Subprogram: Place_Order

-- Test Case: Place_Order.All_Entrees
TEST.UNIT:manager
TEST.SUBPROGRAM:Place_Order
TEST.NEW
TEST.NAME:Place_Order.All_Entrees
TEST.VALUE:manager.Place_Order.Table:1
TEST.VALUE:manager.Place_Order.Seat:1
TEST.VALUE:manager.Place_Order.Order.Entree:VARY FROM:NO_ENTREE TO:PASTA BY: 1
TEST.EXPECTED:uut_prototype_stubs.Update_Record.Data.Check_Total:0.0..20.0
TEST.END
