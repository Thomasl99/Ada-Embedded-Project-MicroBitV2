package body pid_setup is

   protected body pid_set is
      
      function get_lost_track return Boolean is
      begin
         return lost_track;
      end get_lost_track;
      
      function get_error return error_val is
      begin
         return error;
      end get_error;
      
      function get_PIDvalue return integer is
      begin
         return PIDvalue;
      end get_PIDvalue;
      
      
      procedure set_pins (Line1  : Pin_Id; Line2 : Pin_Id; Line3 : Pin_Id) is
      begin
         Pin_Ids := (Line_1 => Line1, Line_2 => Line2, Line_3 => Line3);
         
         --  Pins.LineTrack1 := Set (Line1);
         --  Pins.LineTrack2 := Set (Line2);
         --  Pins.LineTrack3 := Set (Line3);
      
         --  Console.Put(Pins.LineTrack1'Image);
         --  Console.Put(Pins.LineTrack2'Image);
         --  Console.Put(Pins.LineTrack3'Image);
      end set_pins;
   
      procedure set_constants (K : pid_const) is
      begin
         Constants := K;
      end set_constants;
      
      procedure set_error is 
      begin
         Console.Put ("Start of setup");
         if set (Pin_Ids.Line_3) = false and set (Pin_Ids.Line_2) = false and set (Pin_Ids.Line_1) = true then
            lost_track := false;
            error := 2;
            Console.Put ("LLH ");
         elsif set (Pin_Ids.Line_3) = false and set (Pin_Ids.Line_2) = true and set (Pin_Ids.Line_1) = true then
            lost_track := false;
            error := 1;
            Console.Put ("LHH ");
         elsif set (Pin_Ids.Line_3) = false and set (Pin_Ids.Line_2) = true and set (Pin_Ids.Line_1) = false then
            lost_track := false;
            error := 0;
            Console.Put ("LHL ");
         elsif set (Pin_Ids.Line_3) = true and set (Pin_Ids.Line_2) = true and set (Pin_Ids.Line_1) = false then
            lost_track := false;
            error := -1;
            Console.Put ("HHL ");
         elsif set (Pin_Ids.Line_3) = true and set (Pin_Ids.Line_2) = false and set (Pin_Ids.Line_1) = false then
            lost_track := false;
            error := -2;
            Console.Put ("HLL ");
         else
            lost_track := true;
            Console.Put ("LLL    : Lost Track");
         end if;
            
         --  set_pid;
         --  delay(0.1);
         
      end set_error;
         
      procedure set_pid is
         --  error_int           : Integer := error_val;
      begin 
         --  PID_calc.I := PID_calc.I + Integer(error);
         PID_calc := ( P => error,
                       I => PID_calc.I + Integer(error),
                       D => Integer(error) - Integer(previousError));
         
         PIDvalue := (Constants.Kp*Integer(PID_calc.P)) + (Constants.Ki*PID_calc.I) + (Constants.Kd*PID_calc.D);
         Console.Put (PIDvalue'Image);
      end set_pid;
      
   end pid_set;
   

end pid_setup;
