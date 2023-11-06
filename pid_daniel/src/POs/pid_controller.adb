package body pid_controller is

   protected body pid_calc is
      
      procedure set_pins (V      : line_pins) is
      begin
         Pins := V;
      
         Console.Put(LineTrack1'Image);
         Console.Put(LineTrack2'Image);
         Console.Put(LineTrack3'Image);
      end set_pins;
   
      procedure set_constants (K : pid_const) is
      begin
         Constants := K;
      end set_constants;
      
      procedure get_error is    
      begin
         if set (2) = false and set (1) = false and set (0) = true then
            lost_track := false;
            error := 2;
            Console.Put ("LLH ");
         elsif set (2) = false and set (1) = true and set (0) = true then
            lost_track := false;
            error := 1;
            Console.Put ("LHH ");
         elsif set (2) = false and set (1) = true and set (0) = false then
            lost_track := false;
            error := 0;
            Console.Put ("LHL ");
         elsif set (2) = true and set (1) = true and set (0) = false then
            lost_track := false;
            error := -1;
            Console.Put ("HHL ");
         elsif set (2) = true and set (1) = false and set (0) = false then
            lost_track := false;
            error := -2;
            Console.Put ("HLL ");
         else
            lost_track := true;
            Console.Put ("LLL : Lost Track");
         end if;
            
         --  set_pid(error);

         --  delay(0.1);
         
      end get_error;
   end pid_calc;
   
end pid_controller;
