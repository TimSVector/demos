/***************************************************************************************
 * Unit: whitebox.c                                                                    *
 *                                                                                     *
 * Purpose: Used as a demostration module for whitebox testing                         *
 *          (public and private API) vs blackbox testing (no private API)              *
 *                                                                                     *
 * Public API:                                                                         *
 *      - void Initialize(void)                                                        *
 *                                                                                     *
 * Private API:                                                                        *
 *      - void InitDay(enum DAY Val)                                                   *
 *      - static void InitColor(enum COLOR Val)                                        *
 *                                                                                     *
 *                                                                                     *
 ***************************************************************************************/


/****************************************************************************************
 *                             Local Data Structures                                    *
 ****************************************************************************************/

// Define the Pointer Type 
struct PointerType
{
  // Index into data array
  int DataIndex;
  
  // Data Value stored
  int DataValue;
};

/****************************************************************************************
 *                             Local enumerated types                                   *
 ****************************************************************************************/

// Enumeration of colors used
enum COLOR {RED, GREEN, BLUE};

// Emueration of the valid days
// Not that Friday, Saturday, Sunday are not valid
enum DAY   {MONDAY, TUESDAY, WEDNESDAY, THURSDAY};

/****************************************************************************************
 *                             Private Variables                                        *
 ****************************************************************************************/

// Private variable declaration for Current Color and Day
static enum COLOR CurrentColor;
static enum DAY  CurrentDay;

// Private Pointer Structure
static struct PointerType P;

/**************************************************************************************
 *  Subprogram: InitDay                                                               *
 *                                                                                    * 
 *  Purpose: Sets the unit private variable CurrentDay                                *
 *                                                                                    * 
 *  Inputs:                                                                           *
 *       - Val - enum DAY - Day input                                                 *
 *                                                                                    * 
 *  Outputs:                                                                          *
 *       - None                                                                       *
 *                                                                                    * 
 **************************************************************************************/
static void InitDay(enum DAY Val)
{
  // Save the day
  CurrentDay = Val;
}

/**************************************************************************************
 *  Subprogram: InitDay                                                               *
 *                                                                                    * 
 *  Purpose: Sets the unit private variable CurrentColor                              *
 *                                                                                    * 
 *  Inputs:                                                                           *
 *       - Val - enum COLOR - Color input                                             *
 *                                                                                    * 
 *  Outputs:                                                                          *
 *       - None                                                                       *
 *                                                                                    * 
 **************************************************************************************/
static void InitColor(enum COLOR Val)
{
  // Save the color
  CurrentColor = Val;
}

/**************************************************************************************
 *  Subprogram: doMath                                                                *
 *                                                                                    * 
 *  Purpose: Returns C=A+B                                                            *
 *                                                                                    * 
 *  Inputs:                                                                           *
 *       - int A                                                                      *
 *       - int B                                                                      *
 *                                                                                    * 
 *  Outputs:                                                                          *
 *       - int a + b                                                                  *
 *                                                                                    * 
 **************************************************************************************/
static int doMath(int a, int b)
{
    return a * b;
}

/**************************************************************************************
 *  Subprogram: Initialize                                                            *
 *                                                                                    * 
 *  Purpose: Initializes the white box subsystem                                      *
 *                                                                                    * 
 *  Inputs:                                                                           *
 *       - None                                                                       *
 *                                                                                    * 
 *  Outputs:                                                                          *
 *       - None                                                                       *
 *                                                                                    * 
 **************************************************************************************/
void Initialize(void) 
{
  // Initialize the day
  InitDay(WEDNESDAY);

  // Initialize the color
  InitColor(BLUE);

  // Initialize the private pointer P
  P.DataIndex = 1;
  P.DataValue = 12;
}

