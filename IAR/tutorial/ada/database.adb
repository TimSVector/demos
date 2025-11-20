with types;

package body DATABASE is


   TABLE_DATA : array (TYPES.TABLE_INDEX_TYPE) of TYPES.TABLE_DATA_TYPE;

   procedure GET_TABLE_RECORD (
      TABLE : in     TYPES.TABLE_INDEX_TYPE;
      DATA  :    out TYPES.TABLE_DATA_TYPE) is

   begin
      DATA := TABLE_DATA (TABLE);
   end GET_TABLE_RECORD;

   procedure UPDATE_TABLE_RECORD (
      TABLE : in     TYPES.TABLE_INDEX_TYPE;
      DATA  : in     TYPES.TABLE_DATA_TYPE) is

   begin
      TABLE_DATA (TABLE) := DATA;
   end UPDATE_TABLE_RECORD;

end DATABASE;

