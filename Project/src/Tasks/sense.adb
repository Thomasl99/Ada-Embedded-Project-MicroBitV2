package body Sense is

   task body sense_task is
      myClock : Time;
   begin
      US.set_pins((MB_P16,MB_P8,MB_P15,MB_P12,MB_P14,MB_P13));
      LT.set_pins(V=> (0,1,2));
      PID.set_constants(K => (2047.0, 0.0 , 0.0));
      loop
         myClock := Clock;
         LT.set_measurements;
         US.set_measurements;
         delay until myClock + Milliseconds(50);
      end loop;
   end sense_task;
   
end Sense;
