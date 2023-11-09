
package body Think is

   task body pidCalc_task is
      myClock : Time;
   begin
      loop
         myClock := Clock;
         brain_functions.set_pid;
         delay until myClock + Milliseconds(25);
      end loop;
   end pidCalc_task;

end Think;
