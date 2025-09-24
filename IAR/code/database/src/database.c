 /***************************************************************************************
 * Unit: manager.c                                                                     *
 *                                                                                     *
 * Purpose: Used as a demostration module for point of sales termainal                 *
 *                                                                                     *
 * Public API:                                                                         *
 *      - struct table_data_type Get_Record(table_index_type Table)                    *
 *      - void Update_Record(table_index_type Table,                                   *
 *           struct table_data_type Data)                                              *
 *      - void Remove_Record(table_index_type Table)                                   *
 *                                                                                     *
 *                                                                                     *
 * Private API:                                                                        *
 *      - None                                                                         *
 *                                                                                     *
 ***************************************************************************************/

/***************************************************************************************
 *                             Program Headers                                         *
 ***************************************************************************************/


#include "ctypes.h"
#include "linked_list.h"
#include "database.h"

/***************************************************************************************
 *                             Local Defines                                           *
 ***************************************************************************************/

/**************************************************************************************
 *  Subprogram: Get_Record                                                            *
 *                                                                                    * 
 *  Purpose: Sets the unit private variable CurrentColor                              *
 *                                                                                    * 
 *  Inputs:                                                                           *
 *       - Table - uint32_t                                                           *
 *                                                                                    * 
 *  Outputs:                                                                          *
 *       - struct data_type                                                           *
 *                                                                                    * 
 **************************************************************************************/

data_type Get_Record(uint32_t Table)
{
  // setup the local variables 
  struct DataItem * dPtr;
  struct DataItem dataItem = BLANK_DATA_ITEM;

  // set the search key (table) in the data items
  dataItem.table = Table;

  // seatch for the data item
  dPtr = findData(dataItem);
  
  // if the items was NOT found...
  if (dPtr == NULL)
  {
    // Insert the item into the list 
    InsertDataItem(&dataItem);
    
    // set the data pointer to the current data items
    dPtr = &dataItem;
  }

  // return the table data from the data pointer
  return (dPtr->Data);
}

/**************************************************************************************
 *  Subprogram: Update_Record                                                         *
 *                                                                                    * 
 *  Purpose: Updates the current table record with input information                  *
 *                                                                                    * 
 *  Inputs:                                                                           *
 *       - Table - int                                                                *
 *       - Data - struct data_type                                                    *
 *                                                                                    * 
 *  Outputs:                                                                          *
 *       - None                                                                       *
 *                                                                                    * 
 **************************************************************************************/
void Update_Record(uint32_t Table, data_type Data)
{
  // setup the local variables
  struct DataItem dataItem = BLANK_DATA_ITEM;
  struct DataItem * entry;

  // set the search key (table) in the data items
  dataItem.table = Table;

  // seatch for the data item
  entry = findData(dataItem);
  
  // if the items was found...
  if (entry != NULL)
  {
    // set the data
    entry->Data = Data;
  }
}

/**************************************************************************************
 *  Subprogram: Remove_Record                                                         *
 *                                                                                    * 
 *  Purpose: Removes the record from the database                                     *
 *                                                                                    * 
 *  Inputs:                                                                           *
 *       - Val - enum COLOR - Color input                                             *
 *                                                                                    * 
 *  Outputs:                                                                          *
 *       - None                                                                       *
 *                                                                                    * 
 **************************************************************************************/
void Remove_Record(uint32_t Table)
{
  // setup local variables
  struct DataItem dataItem;
    
  // set the search key (table) in the data items
  dataItem.table = Table;

  // remove the item from the linked list
  RemoveDataItem(&dataItem);
}


