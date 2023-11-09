package body pid_think is

   task body pidCalc_task is
      myClock : Time;
   begin
      loop
         myClock := Clock;
         pid_set.set_pid;
         delay until myClock + Milliseconds(200);
      end loop;
   end pidCalc_task;
      
end pid_think;
