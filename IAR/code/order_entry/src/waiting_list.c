/***************************************************************************************
 * Unit: waiting_list.c                                                                *
 *                                                                                     *
 * Purpose: Used as a demostration module for point of sales termainal                 *
 *                                                                                     *
 * Public API:                                                                         *
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

#include "waiting_list.h"


/***************************************************************************************
 *                        Private local variables                                      *
 ***************************************************************************************/

/* Allow 10 Parties to wait */
static name_type WaitingList[10];
static uint32_t WaitingListSize = 0;
static uint32_t WaitingListIndex = 0;

/**************************************************************************************
 *  Subprogram: Add_Party_To_Waiting_List                                             *
 *                                                                                    *
 *  Purpose: Add Party To Waiting List                                                *
 *                                                                                    *
 *  Inputs:                                                                           *
 *       - name  char * - name of party to be seated                                  *
 *                                                                                    *
 *  Outputs:                                                                          *
 *       - 0/-1 - Pass/Fail (bill not paid)                                           *
 *                                                                                    * 
 **************************************************************************************/
void Add_Party_To_Waiting_List(int8_t * Name)
{
  int8_t i = 0;
  
  // if waiting list is greater that 9...
  if(WaitingListSize > 9)
  {
    // clear it out (maybe an error here)
    WaitingListSize = '\0';
  }
  
  // copy the name onto the waiting list (should use strcpy)
  while( (Name != NULL) && (*Name != '\0')) 
  {
    // Go to the next name
    WaitingList[WaitingListSize][i++] = *Name;
    Name++;
  }
  // set the end of the string to '\0'
  WaitingList[WaitingListSize++][i] = '\0';
}


/**************************************************************************************
 *  Subprogram: Add_Party_To_Waiting_List                                             *
 *                                                                                    *
 *  Purpose: Add Party To Waiting List                                                *
 *                                                                                    *
 *  Inputs:                                                                           *
 *       - None                                                                       *
 *                                                                                    *
 *  Outputs:                                                                          *
 *       - int8_t * - name from waiting list                                            *
 *                                                                                    * 
 **************************************************************************************/
int8_t * Get_Next_Party_To_Be_Seated(void)
{
  // if the waiting list is over 9
  if(WaitingListIndex > 9)
  {
    // roll back to beginning(maybe an error here)
    WaitingListIndex = 0;
  }

  // return the name from the list
  return WaitingList[WaitingListIndex++];
}
