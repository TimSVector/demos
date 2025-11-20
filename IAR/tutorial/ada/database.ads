with types;

package DATABASE is

   procedure GET_TABLE_RECORD (
      TABLE : in     TYPES.TABLE_INDEX_TYPE;
      DATA  :    out TYPES.TABLE_DATA_TYPE);

   procedure UPDATE_TABLE_RECORD (
      TABLE : in     TYPES.TABLE_INDEX_TYPE;
      DATA  : in     TYPES.TABLE_DATA_TYPE);

end DATABASE;


