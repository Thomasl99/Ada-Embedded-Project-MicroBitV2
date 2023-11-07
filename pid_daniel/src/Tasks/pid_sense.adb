package body pid_sense is

   task body sense_task is
      myClock : Time;
   begin
      pid_set.set_pins (0, 1, 2);
      pid_set.set_constants (K => (50, 50, 50));
      loop
         myClock := Clock;
         pid_set.set_error;
         delay until myClock + Milliseconds(200);
      end loop;
   end sense_task;
   
end pid_sense;
