package TYPES is

   SEATS_AT_ONE_TABLE : constant integer := 4;
   NUMBER_OF_TABLES   : constant integer := 6;

   type SOUPS     is (NO_ORDER, ONION, CHOWDER);
   type SALADS    is (NO_ORDER, CAESAR, GREEN);
   type ENTREES   is (NO_ORDER, STEAK, CHICKEN, LOBSTER, PASTA);
   type DESSERTS  is (NO_ORDER, CAKE, PIE, FRUIT);
   type BEVERAGES is (NO_ORDER, WINE, BEER, MIXED_DRINK, SODA);

   type ORDER_TYPE is
      record
         SOUP     : SOUPS := NO_ORDER;
         SALAD    : SALADS := NO_ORDER;
         ENTREE   : ENTREES := NO_ORDER;
         DESSERT  : DESSERTS := NO_ORDER;
         BEVERAGE : BEVERAGES := NO_ORDER;
      end record;

   type SEAT_RANGE_TYPE is new integer range 0 .. SEATS_AT_ONE_TABLE;
   subtype SEAT_INDEX_TYPE is SEAT_RANGE_TYPE range 1 .. SEAT_RANGE_TYPE'last;
   type TABLE_INDEX_TYPE is new integer range 1..NUMBER_OF_TABLES;
   subtype WAIT_PERSON_NAME is string (1..10);

   type TABLE_ORDER_TYPE is array (SEAT_INDEX_TYPE) of ORDER_TYPE;

   type TABLE_DATA_TYPE is 
      record
         IS_OCCUPIED     : boolean := false;
         NUMBER_IN_PARTY : SEAT_RANGE_TYPE := 0;
         DESIGNATOR      : character := ' ';
         WAIT_PERSON     : WAIT_PERSON_NAME := "          ";
         ORDER           : TABLE_ORDER_TYPE;
         CHECK_TOTAL     : integer := 0;
      end record;

end TYPES;



