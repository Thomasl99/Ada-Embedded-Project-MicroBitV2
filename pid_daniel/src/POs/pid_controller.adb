package body pid_controller is

   protected body pid_call is
      
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
            
         set_pid;
         --  delay(0.1);
         
      end get_error;
         
      procedure set_pid is
         --  error_int : Integer := error_val;
      begin 
         --  PID_calc.I := PID_calc.I + Integer(error);
         PID_calc := ( P => error,
                       I => PID_calc.I + Integer(error),
                       D => Integer(error) - Integer(previousError));
         
         PIDvalue := (Constants.Kp*Integer(PID_calc.P)) + (Constants.Ki*PID_calc.I) + (Constants.Kd*PID_calc.D);
         Console.Put (PIDvalue'Image);
      end set_pid;
      
         
   end pid_call;
   
end pid_controller;
