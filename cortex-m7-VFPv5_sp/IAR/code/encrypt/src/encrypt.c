/***************************************************************************************
 * Unit: encrypt.c                                                                     *
 *                                                                                     *
 * Purpose: Provides psuedo encryption services                                        *
 *                                                                                     *
 * Public API:                                                                         *
 *      - void Add_Included_Dessert(struct order_type* Order)                          *
 *                                                                                     *
 * Private API:                                                                        *
 *      - None                                        *                                *
 *                                                                                     *
 *                                                                                     *
 ***************************************************************************************/

/***************************************************************************************
 *                            Program Headers                                          *
 ***************************************************************************************/

#include "ctypes.h"
#include "matrix_multiply.h"

/***************************************************************************************
 *                            External Defintions                                      *
 ***************************************************************************************/


#ifdef USING_TRUST_ZONE
struct matrix_t TZ_Get_Private_Key(void);
uint32_t TZ_Write_Data(struct matrix_t);
uint32_t TZ_Reset_Hardware(uint32_t);
void log_Error(const int8_t *, uint32_t);
uint32_t TZ_Wait_Reset(uint32_t);
void __SystemReset(const int8_t *);
#define ON_ERROR 1
#define TIMEOUT_10MSEC 1000
#endif

/***************************************************************************************
 *                            Private Prototypes                                       *
 ***************************************************************************************/
static uint32_t sendData(const struct matrix_t data);
static struct matrix_t generate_private_key(void);
static uint32_t Encrypt_Info(const struct matrix_t* private_key, const int8_t * name, const int8_t number[16], const int8_t secCode[3], const uint32_t total);
static uint32_t encrypt_and_send(const int8_t * inData, const uint32_t row, const uint32_t col,  const struct matrix_t * private_key);

/**************************************************************************************
 *  Subprogram: sendData                                                              *
 *                                                                                    * 
 *  Purpose: Sesnd the "encrypted" data to the appropriate place                      *
 *                                                                                    * 
 *  Inputs:                                                                           *
 *       - data - struct matrix_t                                                     *
 *                                                                                    * 
 *  Outputs:                                                                          *
 *       - uint32_t - SUCCESS/FAILURE                                                 *
 *                                                                                    * 
 **************************************************************************************/

static uint32_t sendData(const struct matrix_t data) {
        uint32_t ret_val = SUCCESS;

#ifdef USING_TRUST_ZONE
        static uint32_t failureCount = 0;
        ret_val = TZ_Write_Data(data);
        // send data via the Trust Zone Data Write
        if (ret_val == FAILURE && failureCount < 10) {
            log_Error("Trust Zone Write Error", ++failureCount);
            TZ_Reset_Hardware(ON_ERROR);
            while (TZ_Wait_Reset(TIMEOUT_10MSEC)) ;    // loop until TZ resets                    
        }
        if (failureCount >= 10) __SystemReset("Encryption Failure");
        return ret_val;
#else
        // display result matrix
        //-e534
        printf ("ENCRYPTED DATA (%dx%d): ", data.row, data.col);

        for (uint32_t i = 0; (i < data.row) && (i < MAX_MATRIX); i++)
            for (uint32_t j = 0; (j < data.col) && (j < MAX_MATRIX); j++)
                printf ("%02X ",data.matrix[i][j]);
                
        printf ("\n");
        return ret_val;
#endif
}
/**************************************************************************************
 *  Subprogram: generate_private_key                                                  *
 *                                                                                    * 
 *  Purpose: Generate a "private" key                                                 *
 *                                                                                    * 
 *  Inputs:                                                                           *
 *       - None                                                                       *
 *                                                                                    * 
 *  Outputs:                                                                          *
 *       - struct matrix_t - random data for now                                      *
 *                                                                                    * 
 **************************************************************************************/
static struct matrix_t generate_private_key(void)
{
    srand(0);

    // set up default key
    static struct matrix_t private_key = {-1,-1,};

#ifdef USING_TRUST_ZONE
    // use the hardware's trust zone to generate a private key
    private_key = TZ_Get_Private_Key();
#else
 
    // if no data corruption has occurred...
    if ((private_key.row == -1) && (private_key.col == -1))
    {
        // set the private key to be 4x4
        private_key.row = 4;
        private_key.col = 4;
        
        // loop over the matrix rows
        for (uint32_t i = 0; i < MAX_MATRIX; i++)
        {
            // and loop over the matrix rows
            for (uint32_t j = 0; j < MAX_MATRIX; j++)
            {
                // store random data (for now)
                private_key.matrix[i][j] = rand() % 0xff;
            }
        }
    }
#endif
    // return the private key
    return private_key;
}

/**************************************************************************************
 *  Subprogram: encrypt_and_send                                                      *
 *                                                                                    * 
 *  Purpose: Encrypts the information and transmits it                                * 
 *  Inputs:                                                                           *
 *       - inData - const int8_t *                                                    *
 *       - row - uint32_t                                                             *
 *       - column - uint32_t                                                          *
 *       - private_key - void *                                                       *
 *                                                                                    * 
 *  Outputs:                                                                          *
 *       - uint32_t - SUCCESS/FAILURE                                                 *
 *                                                                                    * 
 **************************************************************************************/
 static uint32_t encrypt_and_send(const int8_t * inData, const uint32_t row, const uint32_t col,  const struct matrix_t * private_key)  
 {
     
    uint32_t ret_val;
    
    // Initialize the local variables
    struct matrix_t data2BSent = NULL_MATRIX;
    struct matrix_t result     = NULL_MATRIX;
    
    // sets the data into the out matrix
    if (inData != NULL)   
    {                                                             
        uint32_t inEnd = 0;                                              
        for (uint32_t i = 0; i < row; i++) {            
            for (uint32_t j = 0; j < col ; j++) {                                                       
                if (*inData == 0) {
                    inEnd = 1;                                      
                }
                if (inEnd > 0) {
                    data2BSent.matrix[i][j] = *inData;               
                    inData++;
                } else {
                    data2BSent.matrix[i][j] = 0;                       
                }
            }                                                       
        }
        data2BSent.row = row;                                        
        data2BSent.col = col;                                        
    } 
    
    // call the matrix multiply routine to encrypt the data
    if (matrix_multiply(&data2BSent, private_key, &result) == FAILURE)
    {
        // if the matrix multiply failed, return FAILURE
        ret_val = FAILURE;
    } else {
        ret_val = sendData(result);
    }

    // otherwise send the data
    return ret_val;
 }
 
/**************************************************************************************
 *  Subprogram: Encrypt_Info                                                          *
 *                                                                                    * 
 *  Purpose: Encrypts the credit card information and transmits it in chucks          * 
 *  Inputs:                                                                           *
 *       - private_key - void *                                                       *
 *       - name        - const int8_t *                                               *
 *       - number      - const int8_t[16]                                             *
 *       - secCode     - const int8_t [3]                                             *
 *       - Info  - float_t                                                            *
 *                                                                                    * 
 *  Outputs:                                                                          *
 *       - uint32_t - SUCCESS/FAILURE                                                 *
 *                                                                                    * 
 **************************************************************************************/
static uint32_t Encrypt_Info(const struct matrix_t* private_key, const int8_t * name, const int8_t number[16], const int8_t secCode[3],  const uint32_t total)
{
    // init the return value
    uint32_t ret_val = SUCCESS;
    
    // send the name
    if ((name != NULL) && (total > 0)){
    
        ret_val |= encrypt_and_send(name    , MAX_MATRIX, MAX_MATRIX, private_key);
        ret_val |= encrypt_and_send(number  , MAX_MATRIX, MAX_MATRIX, private_key);
        ret_val |= encrypt_and_send(secCode , 1         , MAX_MATRIX, private_key);
        
        // send the total
        uint8_t byteArray[4];
        byteArray[0] = (uint8_t)  (total & 0x000000FFU);
        byteArray[1] = (uint8_t) ((total & 0x0000FF00U) >> 8U);
        byteArray[2] = (uint8_t) ((total & 0x00FF0000U) >> 16U);
        byteArray[3] = (uint8_t) ((total & 0x00FF0000U) >> 24U);
        
        ret_val |= encrypt_and_send((const int8_t *)&byteArray, MAX_MATRIX, MAX_MATRIX, private_key);
    }

    //static uint32_t encrypt_and_send(const int8_t * inData, const uint32_t row, const uint32_t col,  const struct matrix_t * private_key)  
    
    // return SUCCESS/FAILURE
    return ret_val;
}

/**************************************************************************************
 *  Subprogram: transmit_Info                                                      *
 *                                                                                    * 
 *  Purpose: Transmit the credit card information                                     *
 *                                                                                    * 
 *  Inputs:                                                                           *
 *       - name        - const int8_t *                                                 *
 *       - number      - const int8_t[16]                                               *
 *       - secCode     - const int8_t [3]                                               *
 *       - Info        - float_t                                                        *
 *                                                                                    * 
 *  Outputs:                                                                          *
 *       - uint32_t - SUCCESS/FAILURE                                                      *
 *                                                                                    * 
 **************************************************************************************/

uint32_t transmit_Info (const int8_t * name, const int8_t number[16], const int8_t secCode[3], float_t Info)
{
    // generate a private key
    const struct matrix_t private_key = generate_private_key();

    const uint32_t total = (uint32_t) Info * 100;

    // Encrypt and send the data
    return Encrypt_Info(&private_key,name,number,secCode, total);
   
}
