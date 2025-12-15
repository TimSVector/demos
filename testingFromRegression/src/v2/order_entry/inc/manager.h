#ifndef __MANAGER_H
#define __MANAGER_H

#include "ctypes.h"

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

#endif