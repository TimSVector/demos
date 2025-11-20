

package WHITEBOX is

   type pointer_type is private;

   procedure initialize (pointer : in out pointer_type);

private
   type pointer_type is 
      record
         data_index : integer;
         data_value : integer;
      end record;

end WHITEBOX;

