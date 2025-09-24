/***************************************************************************************
 * Unit: manager.c                                                                     *
 *                                                                                     *
 * Purpose: Used as a demostration module for point32_t of sales termainal                 *
 *                                                                                     *
 * Public API:                                                                         *
 *      - void Add_Included_Dessert(struct order_type* Order)                          *
 *      - int32_t Place_Order(table_index_type Table,                                      *
 *              seat_index_type Seat,                                                  *
 *              struct order_type Order)                                               *
 *      - int32_t Clear_Table(table_index_type Table)                                      *
 *      - float_t Get_Check_Total(table_index_type Table)                                *
 *      - int32_t Pay_The_Bill(const char * name,                                          *
 *              const char cardNumber[16],                                             *
 *              const char secCode[3],                                                 *
 *              int32_t Table)                                                             *
 *      - void Add_Party_To_Waiting_List(char* Name)                                   *
 *      - char* Get_Next_Party_To_Be_Seated(void)                                      *
 *                                                                                     *
 *                                                                                     *
 * Private API:                                                                        *
 *      - None                                        *                                *
 *                                                                                     *
 *                                                                                     *
 ***************************************************************************************/

/***************************************************************************************
 *                             System Headers                                          *
 ***************************************************************************************/

/***************************************************************************************
 *                             Program Headers                                         *
 ***************************************************************************************/

#include "ctypes.h"

/***************************************************************************************
 *                             External Prototypes                                     *
 ***************************************************************************************/

#include "database.h"
#include "encrypt.h"

#define TAX_RATE 1.00F

/***************************************************************************************
 *                        Private local variables                                      *
 ***************************************************************************************/

/**************************************************************************************
 *  Subprogram: Add_Included_Dessert                                                  *
 *                                                                                    * 
 *  Purpose: Add a free dessert to specific orders based on the                       *
 *           entree, salad, and beverage choice                                       *
 *                                                                                    * 
 *  Inputs:                                                                           *
 *       - Order - struct order_type*                                                 *
 *                                                                                    * 
 *  Outputs:                                                                          *
 *       - None                                                                       *
 *                                                                                    * 
 **************************************************************************************/

void Add_Included_Dessert(struct order_type* Order)
{
  // Null pointer check
  if (Order != NULL) {
  
    // if special steak order
    if(Order->Entree == STEAK &&
     Order->Salad == CAESAR &&
     Order->Beverage == MIXED_DRINK) 
    {
      Order->Dessert = PIE;
    } 

    // if special lobster order
    else if(Order->Entree == LOBSTER &&
            Order->Salad == GREEN &&
            Order->Beverage == WINE) 
    {  
      Order->Dessert = CAKE;  
    }
    else {
      Order->Dessert = FRUIT;  
    }
  }      
}

/**************************************************************************************
 *  Subprogram: Place_Order                                                           *
 *                                                                                    *
 *  Purpose: Updates the flags and check totals of the table/seat in the database     *
 *                                                                                    *
 *  Inputs:                                                                           *
 *       - Table - table_index_type - table number                                    *
 *       - Seat - seat_index_type - Seat number                                       *
 *       - Order - struct order_type - Order                                          *
 *                                                                                    *
 *  Outputs:                                                                          *
 *       - 0 - Pass                                                                   *
 *                                                                                    * 
 **************************************************************************************/

int32_t Place_Order(table_index_type Table,
                seat_index_type Seat,
                struct order_type Order)
{
  // Local Table Data
  struct table_data_type Table_Data = Get_Record(Table);

  // Set the Table Data Flags
  Table_Data.Is_Occupied = v_true;
  Table_Data.Number_In_Party = Table_Data.Number_In_Party + 1;
  Table_Data.Is_Bill_Paid = v_false;

  // Add the order to the data structure
  Table_Data.Order[Seat] = Order;
  
  // Add a free dessert in some cases
  Add_Included_Dessert(&Table_Data.Order[Seat]);
 
  // Update the check total based on Entree Type
  switch(Order.Entree)
  {
    case NO_ENTREE : 
      break;
    case STEAK :
      Table_Data.Check_Total = Table_Data.Check_Total + (float_t) COST_OF_STEAK;
      break;
    case CHICKEN :
      Table_Data.Check_Total = Table_Data.Check_Total + (float_t) COST_OF_CHICKEN;
      break;
    case LOBSTER :
      Table_Data.Check_Total = Table_Data.Check_Total + (float_t) COST_OF_LOBSTER;
      break;
    case PASTA :
      Table_Data.Check_Total = Table_Data.Check_Total + (float_t) COST_OF_PASTA;
      break;
    default:
      break;
  }

  // add sales tax
  Table_Data.Check_Total *= TAX_RATE;

  // Updated the database with the new information
  Update_Record(Table, Table_Data);
  
  return 0;
}

/**************************************************************************************
 *  Subprogram: Clear_Table                                                           *
 *                                                                                    *
 *  Purpose: Clears the entry for the table/seat combination                          *
 *                                                                                    *
 *  Inputs:                                                                           *
 *       - Table - table_index_type - table number                                    *
 *                                                                                    *
 *  Outputs:                                                                          *
 *       - 0/-1 - Pass/Fail (bill not paid)                                           *
 *                                                                                    * 
 **************************************************************************************/
int32_t Clear_Table(table_index_type Table)
{
  int32_t ret_val = SUCCESS;
  
  // Local Table Data
  const struct table_data_type Table_Data = Get_Record(Table);

  // can't clear the table is the bill isn't paid
  if (Table_Data.Is_Bill_Paid == v_true)
  {
    // Remove the record from the database
    Remove_Record(Table);
  }
  else
  {
    ret_val = FAILURE;
  }

  // return pass
  return ret_val;
}

/**************************************************************************************
 *  Subprogram: Get_Check_Total                                                       *
 *                                                                                    *
 *  Purpose: Returns the check total for the table/seat combination                   *
 *                                                                                    *
 *  Inputs:                                                                           *
 *       - Table - table_index_type - table number                                    *
 *                                                                                    *
 *  Outputs:                                                                          *
 *       - Check Total - float_t                                                        *
 *                                                                                    * 
 **************************************************************************************/
float_t Get_Check_Total(table_index_type Table)
{
  float_t largePartyAutoTip = 0.0F;

  struct table_data_type Table_Data;
  Table_Data = Get_Record(Table);

  // Parties over 8 get an automatic large party tip added
  if (Table_Data.Number_In_Party >= 8)
  {
    largePartyAutoTip = Table_Data.Check_Total * 0.18F;
  }
  
  Table_Data.Check_Total *= TAX_RATE;
  Table_Data.Check_Total += largePartyAutoTip;
  
  return (Table_Data.Check_Total);
}

/**************************************************************************************
 *  Subprogram: Pay_The_Bill                                                          *
 *                                                                                    *
 *  Purpose: Pays the bill (CC only) for the Table                                    *
 *                                                                                    *
 *  Inputs:                                                                           *
 *       - name - const char * - name on the CC                                       *
 *       - cardNumber - const char[16] - number on the CC                             *
 *       - secCode - const char[3] - security code on the CC                          *
 *       - Table - table_index_type - table number                                    *
 *                                                                                    *
 *  Outputs:                                                                          *
 *       - 0/-1 - Pass/Fail (bill not paid)                                           *
 *                                                                                    * 
 **************************************************************************************/

int32_t Pay_The_Bill(const int8_t * name, const int8_t cardNumber[16], const int8_t secCode[3], int32_t Table)
{
  int32_t ret_value = FAILURE;
  
  // local table dat
  struct table_data_type Table_Data = Get_Record(Table);

  // make call to transmit the CC info
  if (transmit_Info(name,cardNumber,secCode,Table_Data.Check_Total) == SUCCESS)
  {
     
    // if trasmission was good - set the bill to paid 
    Table_Data.Is_Bill_Paid = v_true;
    
    // Reset check total
    Table_Data.Check_Total = 0.0F;
      
    // Push the cleared record back into database
    Update_Record(Table, Table_Data);

    // return SUCCESS
    ret_value = SUCCESS;
  }

  // return FAILURE
  return ret_value;
}

