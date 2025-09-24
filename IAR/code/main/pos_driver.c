/**************************************************************************************
 * Unit: manager_driver.c                                                              *
 *                                                                                     *
 * Purpose: This is the main driver for the point of sales demo                        *
 *                                                                                     *
 * Public API:                                                                         *
 *      - main                                                                         *
 *                                                                                     *
 * Private API:                                                                        *
 *      - run_order_test                                                               *
 *                                                                                     *
 *                                                                                     *
 ***************************************************************************************/
                                                                                      
/****************************************************************************************
 *                               System Header Files                                    *
 ****************************************************************************************/

/**************************************************************************************
 *                               Program Header Files                                 *
 **************************************************************************************/

#include "ctypes.h"
#include "manager.h"
#include "database.h"

#ifdef __cplusplus 
    extern "C" {
#endif

int Place_Order(table_index_type Table,
                       seat_index_type Seat,
                       struct order_type Order);

int Clear_Table(table_index_type Table);

float Get_Check_Total(table_index_type Table);

void Add_Included_Dessert(struct order_type* Order);
int Pay_The_Bill(const char * name, const char cardNumber[16], const char secCode[3], int Table);

#ifdef __cplusplus 
}
#endif


/**************************************************************************************
 *  Subprogram: run_order_test                                                        *
 *                                                                                    * 
 *  Purpose: To drive the                                                             *
 *                                                                                    * 
 *  Inputs:                                                                           *
 *       - entree - Integer - Order Entree                                            *
 *       - value  - Integer - Value to verify                                         *
 *       - name   - Integer - Name to printout after the operation is complete        *
 *                                                                                    * 
 *  Outputs:                                                                          *
 *       - return (int): 0/-1: Success/Failure                                        *
 *                                                                                    * 
 **************************************************************************************/

static int run_order_test(enum entrees entree, int value, const char * name)
{
    // Stores the order for input into the point of sales terminal
    struct order_type order;
    
    int ret_val = 0;
    
    // setup the order
    order.Entree = entree;
    
    // place the order
    Place_Order(1, 1, order);
    
    // process the results
    if (Get_Check_Total(1) == value)
    {
        printf ("%s: PASSED\n", name);
    }
    else 
    {
        printf ("%s: FAILED %d\n",name, --ret_val);
    }
    
    // send the return value
    return ret_val;
}

/**************************************************************************************
 *  Subprogram: Standard C main                                                       *
 *                                                                                    *
 *  Purpose: This is the main driver for the point of sales demo                      *
 *                                                                                    *
 *  Inputs:                                                                           *
 *       - argc - Integer - count of number of command line arguments                 *
 *       - argv - Character Array Pointer                                             *
 *                   Array of strings containing command line arguments.              *
 *                      From the command line arguments, main will take the           *
 *                      First character (upper/lower case) and use it as follows:     *
 *                         A: Add Free Dessert                                        *
 *                         C: Order Chicken                                           *
 *                         G: Get Check Total                                         *
 *                         L: Order Lobster                                           *
 *                         O: Check Occupied Status                                   *
 *                         P: Pay the Bill                                            *
 *                         S: Order Steak                                             *
 *                         T: Cleat the Table                                         *
 *                         _: Run a Sequence Test                                     *
 *                                                                                    *
 *  Outputs:                                                                          *
 *       - return (int): execution return value:                                      *
 *            - 0 : success                                                           *
 *            - Negative Number : Number of failures                                  *
 *                                                                                    *
 **************************************************************************************/
 
int main(int argc, const char *argv[])
{
    const char cardnum[17] = "1234568711115508";
    const char secCode[4] = "918";

    // Stores the order for input into the point of sales terminal
    struct order_type order;

    // Stores return value
    int ret_val = 0;

    // Counter for command line argument list
    int i = 1;
    
    if (argc == 0) {
      argc = 10;
      argv = malloc(10*sizeof(char *));
      argv[0] = "vcast";
      argv[1] = "P";
      argv[2] = "O";
      argv[3] = "S";
      argv[4] = "T";
      argv[5] = "_";
      argv[6] = "C";
      argv[7] = "L";
      argv[8] = "A";
      argv[9] = "G";
    }

    // Loop over the command line arguments
    while (i < argc)
    {
        // determine which case needs to run
        switch (argv[i++][0])
        {
            // Check Occupied Table Status
            case 'o': case 'O':
                // Place an order
                order.Entree = STEAK;
                Place_Order(1, 1, order);
                
                // check the status
                if (Get_Record(1).Is_Occupied)
                {
                    printf ("Occupied Status: PASSED\n");
                }
                else
                {
                    printf ("Occupied Status: FAILED %d\n", --ret_val);
                }
                break;
                
            // _Sequence Test
            case '_':
                // Steak Order
                ret_val += run_order_test(STEAK,14,"Ordered Steak");
                
                // Chicken Order
                ret_val += run_order_test(CHICKEN,24,"Ordered Chicken");
                
                // Lobster Order
                ret_val += run_order_test(LOBSTER,42,"Ordered Lobster");
                
                // Pay the bill
                if (Pay_The_Bill("Tim Schneider", "4568772911000937","919",1) == -1)
                {
                    printf ("PayBill: FAILED %d\n", --ret_val);
                }
                else
                {
                    printf ("PayBill: PASSED\n");
                }
                
                // Get check and clear table
                printf("The Total is %d\n", (int)Get_Check_Total(1));
                
                // Clear the table
                if (Clear_Table(1) == -1)
                {
                    printf ("Clear_Table: FAILED %d\n", --ret_val);
                }
                else
                {
                    printf ("Clear_Table: PASSED\n");
                }
                
                // Setup the order for free dessert
                order.Entree = STEAK;
                order.Salad = CAESAR;
                order.Beverage = MIXED_DRINK;
                
                // run the function that adds the dessert
                Add_Included_Dessert(&order);
                
                // check the status
                if (order.Dessert == PIE)
                {
                    printf ("Add Dessert: PASSED\n");
                }
                else
                {
                    printf ("Add Dessert: FAILED %d\n", --ret_val);
                }
                break;
            default: break;
           
            // Add Free Dessert
            case 'a': case 'A':
                order.Entree = STEAK;
                order.Salad = CAESAR;
                order.Beverage = MIXED_DRINK;
                Add_Included_Dessert(&order);
                if (order.Dessert == PIE)
                {
                    printf ("Add Dessert: PASSED\n");
                }
                else
                {
                    printf ("Add Dessert: FAILED %d\n", --ret_val);
                }
                break;

            // Steak Case
            case 'S': case 's':
                ret_val += run_order_test(STEAK,14,"Ordered Steak");
                break;
                
            // Chicken Case
            case 'C': case 'c':
                ret_val += run_order_test(CHICKEN,10,"Ordered Chicken");
                break;
                
            // Lobster Case
            case 'L': case 'l':
                ret_val += run_order_test(LOBSTER,18,"Ordered Lobster");
                break;
                
            // Pay the bill
            case 'p': case 'P':
                if (Pay_The_Bill("Tim Schneider", "4568772911000937","919",1) == -1)
                {
                    printf ("PayBill: FAILED %d\n", --ret_val);
                }
                else
                {
                    printf ("PayBill: PASSED\n");
                }
                break;
                
            // Get the check total
            case 'g': case 'G':
                printf("The Total is %d\n", (int)Get_Check_Total(1));
                break;
                
            // Clear the table    
            case 'T': 
            case 't':

                Pay_The_Bill("NoOne", cardnum,secCode,1);
                if (Clear_Table(1) == -1)
                {
                    printf ("Clear_Table: FAILED %d\n", --ret_val);
                }
                else
                {
                    printf ("Clear_Table: PASSED\n");
                }
                break;
        }
    }

  // return the number of failures
  return ret_val;
}
