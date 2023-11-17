package body Act is
   
   task body act_task is
      myClock : Time;
      direction : Directions := Stop;
      speed : Speeds := (4095,4095,4095,4095);
   begin
      loop
         myClock := Clock;
         direction := WheelController.get_direction;
         speed := WheelController.get_speed;
         MotorDriver.Drive(direction, speed);
         delay until myClock + Milliseconds(50);
      end loop;
   end act_task;
   
end Act;
