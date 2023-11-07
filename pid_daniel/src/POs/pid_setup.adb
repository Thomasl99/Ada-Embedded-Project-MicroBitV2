package body pid_setup is

   protected body pid_set is
      
      function get_constants return pid_const is
      begin
         return Constants;
      end set_constants;
      
      function get_error return error_val is
      begin
         return error;
      end get_error;
      
      function get_PIDvalue return integer is
      begin
         return PIDvalue;
      end get_PIDvalue;
      
      
      procedure set_pins (Line1 : Pin_Id; Line2 : Pin_Id; Line3 : Pin_Id) is
      begin
         Pin_Ids := (Line_1 => Line1, Line_2 => Line2, Line_3 => Line3);
         
         Pins.LineTrack1 := Set (Line1);
         Pins.LineTrack2 := Set (Line2);
         Pins.LineTrack3 := Set (Line3);
      
         --  Console.Put(Pins.LineTrack1'Image);
         --  Console.Put(Pins.LineTrack2'Image);
         --  Console.Put(Pins.LineTrack3'Image);
      end set_pins;
   
      procedure set_constants (K : pid_const) is
      begin
         Constants := K;
      end set_constants;
      
   end pid_set;
   

end pid_setup;
