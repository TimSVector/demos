-- VectorCAST 26.sp1 (04/27/26)
-- Test Case Script
--
-- Environment    : INTEGRATION_TEST
-- Unit(s) Under Test: database encrypt linked_list manager matrix_multiply waiting_list
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

-- Unit: manager

-- Subprogram: Add_Included_Dessert

-- Test Case: ATG-TEST-1
TEST.UNIT:manager
TEST.SUBPROGRAM:Add_Included_Dessert
TEST.NEW
TEST.NAME:ATG-TEST-1
TEST.NOTES:
This is an automatically generated test case.
   Test Path 1
      (1) if ((Order->Entree == (STEAK) && Order->Salad == (CAESAR)) && Order->Beverage == (MIXED_DRINK)) ==> FALSE
      (2) if ((Order->Entree == (LOBSTER) && Order->Salad == (GREEN)) && Order->Beverage == (WINE)) ==> FALSE
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.VALUE:manager.Add_Included_Dessert.Order:<<malloc 1>>
TEST.VALUE:manager.Add_Included_Dessert.Order[0].Salad:GREEN
TEST.VALUE:manager.Add_Included_Dessert.Order[0].Entree:LOBSTER
TEST.VALUE:manager.Add_Included_Dessert.Order[0].Beverage:NO_BEVERAGE
TEST.END

-- Test Case: ATG-TEST-2
TEST.UNIT:manager
TEST.SUBPROGRAM:Add_Included_Dessert
TEST.NEW
TEST.NAME:ATG-TEST-2
TEST.NOTES:
This is an automatically generated test case.
   Test Path 2
      (1) if ((Order->Entree == (STEAK) && Order->Salad == (CAESAR)) && Order->Beverage == (MIXED_DRINK)) ==> FALSE
      (2) if ((Order->Entree == (LOBSTER) && Order->Salad == (GREEN)) && Order->Beverage == (WINE)) ==> TRUE
       # Order->Dessert := CAKE
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.VALUE:manager.Add_Included_Dessert.Order:<<malloc 1>>
TEST.VALUE:manager.Add_Included_Dessert.Order[0].Salad:GREEN
TEST.VALUE:manager.Add_Included_Dessert.Order[0].Entree:LOBSTER
TEST.VALUE:manager.Add_Included_Dessert.Order[0].Beverage:WINE
TEST.END

-- Test Case: ATG-TEST-3
TEST.UNIT:manager
TEST.SUBPROGRAM:Add_Included_Dessert
TEST.NEW
TEST.NAME:ATG-TEST-3
TEST.NOTES:
This is an automatically generated test case.
   Test Path 3
      (1) if ((Order->Entree == (STEAK) && Order->Salad == (CAESAR)) && Order->Beverage == (MIXED_DRINK)) ==> TRUE
       # Order->Dessert := PIE
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.VALUE:manager.Add_Included_Dessert.Order:<<malloc 1>>
TEST.VALUE:manager.Add_Included_Dessert.Order[0].Salad:CAESAR
TEST.VALUE:manager.Add_Included_Dessert.Order[0].Entree:STEAK
TEST.VALUE:manager.Add_Included_Dessert.Order[0].Beverage:MIXED_DRINK
TEST.END

-- Subprogram: Clear_Table

-- Test Case: ATG-TEST-1
TEST.UNIT:manager
TEST.SUBPROGRAM:Clear_Table
TEST.NEW
TEST.NAME:ATG-TEST-1
TEST.NOTES:
This is an automatically generated test case.
   Test Path 1
       # ret_val := 0
       # Table_Data := Get_Record(Table)
      (1) if (Table_Data.Is_Bill_Paid == (v_true)) ==> FALSE
       # ret_val := FAILURE
       # return ret_val
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.STUB:database.Remove_Record
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:manager.Clear_Table.Table:0
TEST.END

-- Test Case: ATG-TEST-2
TEST.UNIT:manager
TEST.SUBPROGRAM:Clear_Table
TEST.NEW
TEST.NAME:ATG-TEST-2
TEST.NOTES:
This is an automatically generated test case.
   Test Path 2
       # ret_val := 0
       # Table_Data := Get_Record(Table)
      (1) if (Table_Data.Is_Bill_Paid == (v_true)) ==> TRUE
       # Remove_Record(Table)
       # return ret_val
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.STUB:database.Remove_Record
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:manager.Clear_Table.Table:0
TEST.END

-- Test Case: Clear_Table.SteakSequence
TEST.UNIT:manager
TEST.SUBPROGRAM:Clear_Table
TEST.NEW
TEST.NAME:Clear_Table.SteakSequence
TEST.COMPOUND_ONLY
TEST.VALUE:manager.Clear_Table.Table:1
TEST.EXPECTED:manager.Clear_Table.return:MACRO=SUCCESS
TEST.END

-- Subprogram: Get_Check_Total

-- Test Case: ATG-TEST-1
TEST.UNIT:manager
TEST.SUBPROGRAM:Get_Check_Total
TEST.NEW
TEST.NAME:ATG-TEST-1
TEST.NOTES:
This is an automatically generated test case.
   Test Path 1
       # largePartyAutoTip := 0.0
       # Table_Data := Get_Record(Table)
      (1) if (Table_Data.Number_In_Party >= 8) ==> FALSE
       # Table_Data.Check_Total *= (1.0F)
       # Table_Data.Check_Total += largePartyAutoTip
       # return Table_Data.Check_Total
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:manager.Get_Check_Total.Table:0
TEST.END

-- Test Case: ATG-TEST-2
TEST.UNIT:manager
TEST.SUBPROGRAM:Get_Check_Total
TEST.NEW
TEST.NAME:ATG-TEST-2
TEST.NOTES:
This is an automatically generated test case.
   Test Path 2
       # largePartyAutoTip := 0.0
       # Table_Data := Get_Record(Table)
      (1) if (Table_Data.Number_In_Party >= 8) ==> TRUE
       # largePartyAutoTip := Table_Data.Check_Total * (0.1800000072F)
       # Table_Data.Check_Total *= (1.0F)
       # Table_Data.Check_Total += largePartyAutoTip
       # return Table_Data.Check_Total
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:manager.Get_Check_Total.Table:0
TEST.END

-- Test Case: Get_Check_Total.SteakSequence
TEST.UNIT:manager
TEST.SUBPROGRAM:Get_Check_Total
TEST.NEW
TEST.NAME:Get_Check_Total.SteakSequence
TEST.COMPOUND_ONLY
TEST.IMPORT_FAILURES:
(E) Errors from previous script import(s)
    >>> (E) @LINE: 47 TEST.EXPECTED:manager.Get_Check_Total.return:MACRO=COST_OF_STEAK
    >>>     >>> Value for 'numeric type' out of range
TEST.END_IMPORT_FAILURES:
TEST.VALUE:manager.Get_Check_Total.Table:1
TEST.EXPECTED_USER_CODE:manager.Get_Check_Total.return
{{ <<manager.Get_Check_Total.return>> == ( COST_OF_STEAK ) }}
TEST.END_EXPECTED_USER_CODE:
TEST.END

-- Subprogram: Pay_The_Bill

-- Test Case: ATG-TEST-1
TEST.UNIT:manager
TEST.SUBPROGRAM:Pay_The_Bill
TEST.NEW
TEST.NAME:ATG-TEST-1
TEST.NOTES:
This is an automatically generated test case.
   Test Path 1
       # ret_value := -1
       # Table_Data := Get_Record(Table)
      (1) if (transmit_Info(name, cardNumber, secCode, Table_Data.Check_Total) == (SUCCESS)) ==> FALSE
       # return ret_value
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.STUB:database.Update_Record
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:encrypt.transmit_Info.return:1
TEST.VALUE:manager.Pay_The_Bill.name:<<malloc 1>>
TEST.VALUE:manager.Pay_The_Bill.name[0]:0
TEST.VALUE:manager.Pay_The_Bill.cardNumber[0]:0
TEST.VALUE:manager.Pay_The_Bill.secCode[0]:0
TEST.VALUE:manager.Pay_The_Bill.Table:0
TEST.END

-- Test Case: ATG-TEST-2
TEST.UNIT:manager
TEST.SUBPROGRAM:Pay_The_Bill
TEST.NEW
TEST.NAME:ATG-TEST-2
TEST.NOTES:
This is an automatically generated test case.
   Test Path 2
       # ret_value := -1
       # Table_Data := Get_Record(Table)
      (1) if (transmit_Info(name, cardNumber, secCode, Table_Data.Check_Total) == (SUCCESS)) ==> TRUE
       # Table_Data.Is_Bill_Paid := v_true
       # Table_Data.Check_Total := (0.0F)
       # Update_Record(Table, Table_Data)
       # ret_value := SUCCESS
       # return ret_value
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.STUB:database.Update_Record
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:encrypt.transmit_Info.return:0
TEST.VALUE:manager.Pay_The_Bill.name:<<malloc 1>>
TEST.VALUE:manager.Pay_The_Bill.name[0]:0
TEST.VALUE:manager.Pay_The_Bill.cardNumber[0]:0
TEST.VALUE:manager.Pay_The_Bill.secCode[0]:0
TEST.VALUE:manager.Pay_The_Bill.Table:0
TEST.END

-- Test Case: Pay_The_Bill.SteakSequence
TEST.UNIT:manager
TEST.SUBPROGRAM:Pay_The_Bill
TEST.NEW
TEST.NAME:Pay_The_Bill.SteakSequence
TEST.COMPOUND_ONLY
TEST.VALUE:manager.Pay_The_Bill.name:<<malloc 7>>
TEST.VALUE:manager.Pay_The_Bill.name:"Robert"
TEST.VALUE:manager.Pay_The_Bill.cardNumber:<<malloc 5>>
TEST.VALUE:manager.Pay_The_Bill.cardNumber:"0000"
TEST.VALUE:manager.Pay_The_Bill.secCode:<<malloc 4>>
TEST.VALUE:manager.Pay_The_Bill.secCode:"345"
TEST.VALUE:manager.Pay_The_Bill.Table:1
TEST.EXPECTED:manager.Pay_The_Bill.return:MACRO=SUCCESS
TEST.END

-- Subprogram: Place_Order

-- Test Case: ATG-TEST-1
TEST.UNIT:manager
TEST.SUBPROGRAM:Place_Order
TEST.NEW
TEST.NAME:ATG-TEST-1
TEST.NOTES:
This is an automatically generated test case.
   Test Path 1
       # Table_Data := Get_Record(Table)
       # Table_Data.Is_Occupied := v_true
       # Table_Data.Number_In_Party := Table_Data.Number_In_Party + 1
       # Table_Data.Is_Bill_Paid := v_false
       # Table_Data.Order[Seat] := Order
       # Add_Included_Dessert(&(Table_Data.Order[Seat]))
      (1) case (Order.Entree) ==> NO_ENTREE 0
       # Table_Data.Check_Total *= (1.0F)
       # Update_Record(Table, Table_Data)
       # return 0
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.STUB:database.Update_Record
TEST.STUB:manager.Add_Included_Dessert
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:manager.Place_Order.Table:0
TEST.VALUE:manager.Place_Order.Seat:3
TEST.VALUE:manager.Place_Order.Order.Entree:NO_ENTREE
TEST.END

-- Test Case: ATG-TEST-2
TEST.UNIT:manager
TEST.SUBPROGRAM:Place_Order
TEST.NEW
TEST.NAME:ATG-TEST-2
TEST.NOTES:
This is an automatically generated test case.
   Test Path 2
       # Table_Data := Get_Record(Table)
       # Table_Data.Is_Occupied := v_true
       # Table_Data.Number_In_Party := Table_Data.Number_In_Party + 1
       # Table_Data.Is_Bill_Paid := v_false
       # Table_Data.Order[Seat] := Order
       # Add_Included_Dessert(&(Table_Data.Order[Seat]))
      (2) case (Order.Entree) ==> STEAK 1
       # Table_Data.Check_Total := Table_Data.Check_Total + (float_t)14
       # Table_Data.Check_Total *= (1.0F)
       # Update_Record(Table, Table_Data)
       # return 0
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.STUB:database.Update_Record
TEST.STUB:manager.Add_Included_Dessert
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:manager.Place_Order.Table:0
TEST.VALUE:manager.Place_Order.Seat:3
TEST.VALUE:manager.Place_Order.Order.Entree:STEAK
TEST.END

-- Test Case: ATG-TEST-3
TEST.UNIT:manager
TEST.SUBPROGRAM:Place_Order
TEST.NEW
TEST.NAME:ATG-TEST-3
TEST.NOTES:
This is an automatically generated test case.
   Test Path 3
       # Table_Data := Get_Record(Table)
       # Table_Data.Is_Occupied := v_true
       # Table_Data.Number_In_Party := Table_Data.Number_In_Party + 1
       # Table_Data.Is_Bill_Paid := v_false
       # Table_Data.Order[Seat] := Order
       # Add_Included_Dessert(&(Table_Data.Order[Seat]))
      (3) case (Order.Entree) ==> CHICKEN 2
       # Table_Data.Check_Total := Table_Data.Check_Total + (float_t)10
       # Table_Data.Check_Total *= (1.0F)
       # Update_Record(Table, Table_Data)
       # return 0
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.STUB:database.Update_Record
TEST.STUB:manager.Add_Included_Dessert
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:manager.Place_Order.Table:0
TEST.VALUE:manager.Place_Order.Seat:3
TEST.VALUE:manager.Place_Order.Order.Entree:CHICKEN
TEST.END

-- Test Case: ATG-TEST-4
TEST.UNIT:manager
TEST.SUBPROGRAM:Place_Order
TEST.NEW
TEST.NAME:ATG-TEST-4
TEST.NOTES:
This is an automatically generated test case.
   Test Path 4
       # Table_Data := Get_Record(Table)
       # Table_Data.Is_Occupied := v_true
       # Table_Data.Number_In_Party := Table_Data.Number_In_Party + 1
       # Table_Data.Is_Bill_Paid := v_false
       # Table_Data.Order[Seat] := Order
       # Add_Included_Dessert(&(Table_Data.Order[Seat]))
      (4) case (Order.Entree) ==> LOBSTER 3
       # Table_Data.Check_Total := Table_Data.Check_Total + (float_t)18
       # Table_Data.Check_Total *= (1.0F)
       # Update_Record(Table, Table_Data)
       # return 0
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.STUB:database.Update_Record
TEST.STUB:manager.Add_Included_Dessert
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:manager.Place_Order.Table:0
TEST.VALUE:manager.Place_Order.Seat:3
TEST.VALUE:manager.Place_Order.Order.Entree:LOBSTER
TEST.END

-- Test Case: ATG-TEST-5
TEST.UNIT:manager
TEST.SUBPROGRAM:Place_Order
TEST.NEW
TEST.NAME:ATG-TEST-5
TEST.NOTES:
This is an automatically generated test case.
   Test Path 5
       # Table_Data := Get_Record(Table)
       # Table_Data.Is_Occupied := v_true
       # Table_Data.Number_In_Party := Table_Data.Number_In_Party + 1
       # Table_Data.Is_Bill_Paid := v_false
       # Table_Data.Order[Seat] := Order
       # Add_Included_Dessert(&(Table_Data.Order[Seat]))
      (5) case (Order.Entree) ==> PASTA 4
       # Table_Data.Check_Total := Table_Data.Check_Total + (float_t)12
       # Table_Data.Check_Total *= (1.0F)
       # Update_Record(Table, Table_Data)
       # return 0
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.STUB:database.Update_Record
TEST.STUB:manager.Add_Included_Dessert
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:manager.Place_Order.Table:0
TEST.VALUE:manager.Place_Order.Seat:3
TEST.VALUE:manager.Place_Order.Order.Entree:PASTA
TEST.END

-- Test Case: ATG-TEST-6
TEST.UNIT:manager
TEST.SUBPROGRAM:Place_Order
TEST.NEW
TEST.NAME:ATG-TEST-6
TEST.NOTES:
This is an automatically generated test case.
   Test Path 6
       # Table_Data := Get_Record(Table)
       # Table_Data.Is_Occupied := v_true
       # Table_Data.Number_In_Party := Table_Data.Number_In_Party + 1
       # Table_Data.Is_Bill_Paid := v_false
       # Table_Data.Order[Seat] := Order
       # Add_Included_Dessert(&(Table_Data.Order[Seat]))
      (6) case (Order.Entree) ==> default -1
       # Table_Data.Check_Total *= (1.0F)
       # Update_Record(Table, Table_Data)
       # return 0
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.STUB:database.Update_Record
TEST.STUB:manager.Add_Included_Dessert
TEST.VALUE:<<OPTIONS>>.SHOW_ONLY_DATA_WITH_EXPECTED_RESULTS:TRUE
TEST.VALUE:manager.Place_Order.Table:0
TEST.VALUE:manager.Place_Order.Seat:3
TEST.VALUE:manager.Place_Order.Order.Entree:8
TEST.END

-- Test Case: Place_Order.SteakSequence
TEST.UNIT:manager
TEST.SUBPROGRAM:Place_Order
TEST.NEW
TEST.NAME:Place_Order.SteakSequence
TEST.COMPOUND_ONLY
TEST.VALUE:manager.Place_Order.Table:1
TEST.VALUE:manager.Place_Order.Seat:1
TEST.VALUE:manager.Place_Order.Order.Entree:STEAK
TEST.END

-- Unit: waiting_list

-- Subprogram: Add_Party_To_Waiting_List

-- Test Case: ATG-TEST-1
TEST.UNIT:waiting_list
TEST.SUBPROGRAM:Add_Party_To_Waiting_List
TEST.NEW
TEST.NAME:ATG-TEST-1
TEST.NOTES:
This is an automatically generated test case.
   Test Path 1
       # i := 0
      (1) if (WaitingListSize > (9)) ==> FALSE
      (2) while (Name != (void *)0 && *Name != 0) ==> FALSE
       # WaitingList[WaitingListSize++][i] := 0
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.VALUE:waiting_list.<<GLOBAL>>.WaitingListSize:4
TEST.VALUE:waiting_list.Add_Party_To_Waiting_List.Name:<<malloc 1>>
TEST.VALUE:waiting_list.Add_Party_To_Waiting_List.Name[0]:0
TEST.END

-- Test Case: ATG-TEST-2
TEST.UNIT:waiting_list
TEST.SUBPROGRAM:Add_Party_To_Waiting_List
TEST.NEW
TEST.NAME:ATG-TEST-2
TEST.NOTES:
This is an automatically generated test case.
   Test Path 2
       # i := 0
      (1) if (WaitingListSize > (9)) ==> FALSE
      (2) while (Name != (void *)0 && *Name != 0) ==> TRUE
       # WaitingList[WaitingListSize][i++] := *Name
       # Name++
       # WaitingList[WaitingListSize++][i] := 0
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.VALUE:waiting_list.<<GLOBAL>>.WaitingListSize:7
TEST.VALUE:waiting_list.Add_Party_To_Waiting_List.Name:<<malloc 1>>
TEST.VALUE:waiting_list.Add_Party_To_Waiting_List.Name[0]:-114
TEST.END

-- Test Case: ATG-TEST-3
TEST.UNIT:waiting_list
TEST.SUBPROGRAM:Add_Party_To_Waiting_List
TEST.NEW
TEST.NAME:ATG-TEST-3
TEST.NOTES:
This is an automatically generated test case.
   Test Path 3
       # i := 0
      (1) if (WaitingListSize > (9)) ==> TRUE
       # WaitingListSize := 0
      (2) while (Name != (void *)0 && *Name != 0) ==> FALSE
       # WaitingList[WaitingListSize++][i] := 0
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.VALUE:waiting_list.<<GLOBAL>>.WaitingListSize:131081
TEST.VALUE:waiting_list.Add_Party_To_Waiting_List.Name:<<malloc 1>>
TEST.VALUE:waiting_list.Add_Party_To_Waiting_List.Name[0]:0
TEST.END

-- Subprogram: Get_Next_Party_To_Be_Seated

-- Test Case: ATG-TEST-1
TEST.UNIT:waiting_list
TEST.SUBPROGRAM:Get_Next_Party_To_Be_Seated
TEST.NEW
TEST.NAME:ATG-TEST-1
TEST.NOTES:
This is an automatically generated test case.
   Test Path 1
      (1) if (WaitingListIndex > (9)) ==> FALSE
       # return WaitingList[WaitingListIndex++]
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.VALUE:waiting_list.<<GLOBAL>>.WaitingListIndex:9
TEST.END

-- Test Case: ATG-TEST-2
TEST.UNIT:waiting_list
TEST.SUBPROGRAM:Get_Next_Party_To_Be_Seated
TEST.NEW
TEST.NAME:ATG-TEST-2
TEST.NOTES:
This is an automatically generated test case.
   Test Path 2
      (1) if (WaitingListIndex > (9)) ==> TRUE
       # WaitingListIndex := 0
       # return WaitingList[WaitingListIndex++]
   Test Case Generation Notes:
      ATG constructed a complete test-case.
TEST.END_NOTES:
TEST.VALUE:waiting_list.<<GLOBAL>>.WaitingListIndex:131081
TEST.END

-- COMPOUND TESTS

TEST.SUBPROGRAM:<<COMPOUND>>
TEST.NEW
TEST.NAME:Steak_Sequence
TEST.SLOT: "1", "manager", "Place_Order", "1", "Place_Order.SteakSequence"
TEST.SLOT: "2", "manager", "Get_Check_Total", "1", "Get_Check_Total.SteakSequence"
TEST.SLOT: "3", "manager", "Pay_The_Bill", "1", "Pay_The_Bill.SteakSequence"
TEST.SLOT: "4", "manager", "Clear_Table", "1", "Clear_Table.SteakSequence"
TEST.END
--
