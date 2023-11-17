package body PID_Controller is

   protected body PID is
      
      function get_error return Float is
         begin
         return error;
      end get_error;
        
      function get_PIDvalue return Float is
      begin
         return PIDvalue;
      end get_PIDvalue;
      function get_invalid return boolean is
      begin
         return invalid;
      end get_invalid;
      
   
      procedure set_constants (K : pid_const) is
      begin
         constants := K;
      end set_constants;
      
      procedure set_error (V1 : Boolean; V2 : Boolean; V3 : Boolean) is
         
      begin
         if V3 = false and V2 = false and V1 = true then
            error := 2.0;
            invalid := false;
            --Put_Line ("LLH ");
         elsif  V3 = false and V2 = true and V1 = true then
            error := 1.0;
            invalid := false;
            --Put_Line ("LHH ");
         elsif V3 = false and V2 = true and V1 = false then
            error := 0.0;
            invalid := false;
            --Put_Line ("LHL ");
         elsif V3 = true and V2 = true and V1 = false then
            error := -1.0;
            invalid := false;
            --Put_Line ("HHL ");
         elsif V3 = true and V2 = false and V1 = false then
            error := -2.0;
            invalid := false;
            --Put_Line ("HLL ");
         elsif V3 = false and V2 = false and V1 = false then
            invalid := true;
            --Put_Line ("LLL    : Lost Track");
         elsif V3 = true and V2 = true and V1 = true then
            invalid := true;
         end if;
      end set_error;
      
                         
      procedure calculate_PIDvalue is
         Now_Time : Time;
         delta_time : Time_Span;
      begin
         Now_Time := Clock;
         delta_time := Now_Time - previous_time;
         
         PID_calc := ( P => constants.Kp*error,
                       I => PID_calc.I + (constants.Ki*(error * Float(To_Duration(delta_time)))),
                       D => constants.Kd*((error-previous_error)/Float(To_Duration(delta_time))));
         
         PIDvalue := (PID_calc.P + PID_calc.I + PID_calc.D);
         previous_error := error;
         previous_time := Now_Time;
      end calculate_PIDvalue;
      
   end PID;
   
end PID_Controller;
