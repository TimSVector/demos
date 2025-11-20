with TEXT_IO;
with TYPES;
with MANAGER;
procedure manager_driver is
   CHOICE : string(1..10);
   LEN    : integer := 0;
   ORDER  : TYPES.ORDER_TYPE;
begin
   TEXT_IO.PUT("P=Place_Order C=ClearTable G=Get_Check_Total A=AddIncludedDessert : ");
   TEXT_IO.GET_LINE(CHOICE,LEN);

   if LEN > 0 then
      case CHOICE(1) is

       when 'p' | 'P' =>
          ORDER.ENTREE := TYPES.STEAK;
          MANAGER.PLACE_ORDER ( 1, 1, ORDER );

       when 'g' | 'G' =>
          ORDER.ENTREE := TYPES.CHICKEN;
          MANAGER.PLACE_ORDER ( 2, 2, ORDER );
          LEN := MANAGER.GET_CHECK_TOTAL ( 2 );
          TEXT_IO.PUT_LINE ( "The Total is" & integer'image ( LEN ) );

       when 'c' | 'C' =>
          MANAGER.CLEAR_TABLE ( 1 );

       when 'a' | 'A' =>
          ORDER.ENTREE   := TYPES.STEAK;
          ORDER.SALAD    := TYPES.CAESAR;
          ORDER.BEVERAGE := TYPES.MIXED_DRINK;
          MANAGER.ADD_INCLUDED_DESSERT ( ORDER );

       when others =>
          null;

       end case;

   end if;

end manager_driver;



