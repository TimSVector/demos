#ifndef __DATABASE_H
#define __DATABASE_H

#include "ctypes.h"

extern data_type Get_Record(uint32_t Table);
extern void Update_Record(uint32_t Table, data_type Data);
extern void Remove_Record(uint32_t Table);


#endif