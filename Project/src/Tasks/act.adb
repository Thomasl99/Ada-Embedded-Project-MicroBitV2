package body Act is
   
   task body Drive is
      myClock : Time;
      Current_PID_Value : Float;
      maxSpeed : UInt12 := 4095;
      Current : Float;
   begin
      
      loop
         myClock := Clock;
         Current_PID_Value := brain_functions.get_PIDvalue;
         Current := Current_PID_Value * (-1.0); 
         if brain.brain_functions.get_lost_track = true then
            MotorDriver.Drive(Stop);
         elsif Current_PID_Value = 0.0 then
            MotorDriver.Drive(Forward,(maxSpeed,maxSpeed,maxSpeed,maxSpeed));
         elsif Current_PID_Value > 0.0 and Current_PID_Value < Float(maxSpeed) then
            MotorDriver.Drive(Forward,(maxSpeed,maxSpeed,maxSpeed-UInt12(Current_PID_Value),maxSpeed-UInt12(Current_PID_Value)));
         elsif Current_PID_Value < 0.0 and Current < Float(maxSpeed) then
            
            MotorDriver.Drive(Forward,(maxSpeed - UInt12(Current) ,maxSpeed - UInt12(Current),maxSpeed,maxSpeed));
         end if;
         delay until myClock + Milliseconds(25);
         end loop;
   end drive;
end Act;
