package body Sense is

   task body sense_task is
      myClock : Time;
   begin
      brain_functions.set_pins (V => (0, 1, 2));
      brain_functions.set_constants (K => (35.0, 15.0, 5.0));
      brain_functions.set_Last_Time;
      loop
         myClock := Clock;
         brain_functions.set_error;
         delay until myClock + Milliseconds(25);
      end loop;
   end sense_task;
   
end Sense;
