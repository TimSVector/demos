
with DATABASE;
with TYPES; use TYPES;

package body MANAGER is

   MAX_NAME_LENGTH : constant := 20;
   subtype WAITING_LIST_NAME_TYPE is string(1..MAX_NAME_LENGTH);
   type WAITING_LIST_TYPE;
   type WAITING_LIST_TYPE_PTR is access WAITING_LIST_TYPE;
   type WAITING_LIST_TYPE is
      record
         NAME : WAITING_LIST_NAME_TYPE := ( others => ' ' );
         NEXT : WAITING_LIST_TYPE_PTR := null;
      end record;
   WAITING_LIST : WAITING_LIST_TYPE_PTR := null;

   procedure PLACE_ORDER (
      TABLE : in     TYPES.TABLE_INDEX_TYPE;
      SEAT  : in     TYPES.SEAT_INDEX_TYPE;
      ORDER : in out TYPES.ORDER_TYPE) is

   TABLE_DATA : TYPES.TABLE_DATA_TYPE;

   begin

      DATABASE.GET_TABLE_RECORD (
         TABLE => TABLE,
         DATA  => TABLE_DATA);

      TABLE_DATA.IS_OCCUPIED := true;
      TABLE_DATA.NUMBER_IN_PARTY := TABLE_DATA.NUMBER_IN_PARTY + 1;
      TABLE_DATA.ORDER (SEAT) := ORDER;

      ADD_INCLUDED_DESSERT ( TABLE_DATA.ORDER(SEAT) );

      case ORDER.ENTREE is
      when TYPES.NO_ORDER => 
         null;
      when TYPES.STEAK =>
         TABLE_DATA.CHECK_TOTAL := TABLE_DATA.CHECK_TOTAL + 14;
      when TYPES.CHICKEN =>
         TABLE_DATA.CHECK_TOTAL := TABLE_DATA.CHECK_TOTAL + 10;
      when TYPES.LOBSTER =>
         TABLE_DATA.CHECK_TOTAL := TABLE_DATA.CHECK_TOTAL + 18;
      when TYPES.PASTA =>
         TABLE_DATA.CHECK_TOTAL := TABLE_DATA.CHECK_TOTAL + 12;
      end case;

      DATABASE.UPDATE_TABLE_RECORD (
         TABLE => TABLE,
         DATA  => TABLE_DATA);

   end PLACE_ORDER;

   procedure ADD_INCLUDED_DESSERT ( ORDER : in out TYPES.ORDER_TYPE ) is
   begin
      if ORDER.ENTREE   = STEAK and
         ORDER.SALAD    = CAESAR and
         ORDER.BEVERAGE = MIXED_DRINK
      then
         ORDER.DESSERT := PIE;
      elsif ORDER.ENTREE   = LOBSTER and
            ORDER.SALAD    = GREEN and
            ORDER.BEVERAGE = WINE
      then
         ORDER.DESSERT := CAKE;
      end if;
   end ADD_INCLUDED_DESSERT;

   procedure CLEAR_TABLE (
      TABLE : in     TYPES.TABLE_INDEX_TYPE) is

   TABLE_DATA : TYPES.TABLE_DATA_TYPE;
   NULL_ORDER : TYPES.ORDER_TYPE := 
      (SOUP      => TYPES.NO_ORDER,
       SALAD     => TYPES.NO_ORDER,
       ENTREE    => TYPES.NO_ORDER,
       DESSERT   => TYPES.NO_ORDER,
       BEVERAGE  => TYPES.NO_ORDER);

   begin

      DATABASE.GET_TABLE_RECORD (
         TABLE => TABLE,
         DATA  => TABLE_DATA);

      TABLE_DATA.IS_OCCUPIED := false;
      TABLE_DATA.NUMBER_IN_PARTY := 1;
      for SEAT in TYPES.SEAT_INDEX_TYPE loop
         TABLE_DATA.ORDER (SEAT) := NULL_ORDER;
      end loop;
      TABLE_DATA.CHECK_TOTAL := 0;
  
      DATABASE.UPDATE_TABLE_RECORD (
         TABLE => TABLE,
         DATA  => TABLE_DATA);

   end CLEAR_TABLE;


   function GET_CHECK_TOTAL (TABLE : TYPES.TABLE_INDEX_TYPE)
      return integer is

   TABLE_DATA : TYPES.TABLE_DATA_TYPE;

   begin

      DATABASE.GET_TABLE_RECORD (
         TABLE => TABLE,
         DATA  => TABLE_DATA);

      return TABLE_DATA.CHECK_TOTAL;

   end GET_CHECK_TOTAL;

   procedure ADD_PARTY_TO_WAITING_LIST ( NAME : in     string ) is
      TO_ADD : WAITING_LIST_TYPE_PTR := new WAITING_LIST_TYPE;
   begin
      if NAME'length > MAX_NAME_LENGTH then
         TO_ADD.NAME := NAME(NAME'first..NAME'first+MAX_NAME_LENGTH-1);
      else
         TO_ADD.NAME(1..NAME'length) := NAME;
      end if;
      TO_ADD.NEXT := WAITING_LIST;
      WAITING_LIST := TO_ADD;
   end ADD_PARTY_TO_WAITING_LIST;

   function GET_NEXT_PARTY_TO_BE_SEATED return string is
      PTR : WAITING_LIST_TYPE_PTR := WAITING_LIST;
      RET : WAITING_LIST_NAME_TYPE := ( others => ' ' );
   begin
      if PTR = null then
         null;
      elsif PTR.NEXT = null then
         RET := PTR.NAME;
         WAITING_LIST := null;
      else
         while PTR.NEXT.NEXT /= null loop
            PTR := PTR.NEXT;
         end loop;
         RET := PTR.NEXT.NAME;
         PTR.NEXT := null;
      end if;
      for IDX in reverse 1 .. RET'length loop
         if RET(IDX) /= ' ' then
            return RET(1..IDX);
         end if;
      end loop;
      return "";
   end GET_NEXT_PARTY_TO_BE_SEATED;

end MANAGER;

