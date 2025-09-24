#ifndef ___MM_H
#define ___MM_H

#define MAX_MATRIX 4

struct matrix_t
{
	uint32_t row, col;
	uint32_t matrix[MAX_MATRIX][MAX_MATRIX];
};

#define NULL_MATRIX  {MAX_MATRIX,MAX_MATRIX, 	\
{  {0,0,0,0},				\
   {0,0,0,0},				\
   {0,0,0,0},				\
   {0,0,0,0},				\
}					 }

#define IDENTITY_MATRIX  {MAX_MATRIX,MAX_MATRIX, 	\
{  {1,0,0,0},				\
   {0,1,0,0},				\
   {0,0,1,0},				\
   {0,0,0,1},				\
}                         }

extern int32_t matrix_multiply(const struct matrix_t * M1, const struct matrix_t * M2, struct matrix_t * result);

#ifndef RAND_REG
#define RAND_REG() (-1)
#endif

#endif
