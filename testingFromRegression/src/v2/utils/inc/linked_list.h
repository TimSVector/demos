/*
 * linked_list.h
 *
 *  Created on: Aug 21, 2013
 *      Author: tms
 */


#ifndef ___LINKED_LIST
#define ___LINKED_LIST

#ifndef FAILURE
#define FAILURE -1
#endif
#ifndef SUCCESS
#define SUCCESS 0
#endif

struct DataItem
{
	int table;
	data_type Data;
};

extern struct DataItem * findData (struct DataItem searchData);
extern int InsertDataItem(struct DataItem * Data);
extern int RemoveDataItem(struct DataItem * Data);
extern void initLinkList(void);
extern void destroyLinkedList(void);

#endif /* LL_H_ */
