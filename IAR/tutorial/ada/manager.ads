with TYPES;

package MANAGER is

   procedure PLACE_ORDER (
      TABLE : in     TYPES.TABLE_INDEX_TYPE;
      SEAT  : in     TYPES.SEAT_INDEX_TYPE;
      ORDER : in out TYPES.ORDER_TYPE);

   procedure ADD_INCLUDED_DESSERT ( ORDER : in out TYPES.ORDER_TYPE );

   procedure CLEAR_TABLE (
      TABLE : in     TYPES.TABLE_INDEX_TYPE);

   function GET_CHECK_TOTAL (TABLE : TYPES.TABLE_INDEX_TYPE)
      return integer;

   procedure ADD_PARTY_TO_WAITING_LIST ( NAME : in     string );

   function GET_NEXT_PARTY_TO_BE_SEATED return string;

end MANAGER;



