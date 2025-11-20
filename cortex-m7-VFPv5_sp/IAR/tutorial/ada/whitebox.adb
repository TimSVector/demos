
package body WHITEBOX is

   type color is (red, green, blue);
   type day   is (monday, tuesday, wednesday, thursday);

   procedure init_day (val : day);

   procedure init_color (val : color);

   current_day : day;
   current_color : color;

   procedure initialize (pointer : in out pointer_type) is
   begin
      init_day (day'first);
      init_color (color'first);
      pointer.data_index := 1;
      pointer.data_value := 12;
   end initialize;

   procedure init_day (val : day) is
   begin
      current_day := val;
   end init_day;

   procedure init_color (val : color) is
   begin
      current_color := val;
   end init_color;

end WHITEBOX;
