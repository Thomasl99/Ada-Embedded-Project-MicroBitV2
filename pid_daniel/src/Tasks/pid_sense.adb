package body pid_sense is

   task body sense_task is
      myClock : Time;
   begin
      pid_set.set_pins (V => (0, 1, 2));
      pid_set.set_constants (K => (1.0, 1.0, 100.0));
      pid_set.set_Last_Time;
      loop
         myClock := Clock;
         pid_set.set_error;
         delay until myClock + Milliseconds(1000);
      end loop;
   end sense_task;
   
end pid_sense;
