
package body Think is

   task body think_task is
      myClock : Time;
      LT_measurements : line_tracker_measurements;
      US_measurements : ultrasonic_measurements;
      boundary : Distance_cm := 15;
      PIDvalue : Float;
      current_error : Float := 0.0;

   begin
      loop
         myClock := Clock;
         LT_measurements := LT.get_measurements;
         US_measurements := US.get_measurements;
         PID.set_error(LT_measurements.line_tracker1,LT_measurements.line_tracker2, LT_measurements.line_tracker3);
         PID.calculate_PIDvalue;
         PIDvalue := PID.get_PIDvalue;
         current_error := PID.get_error;

         follow_line(PIDvalue,4095,current_error);
         avoid_obstacle(US_measurements.sensor1, US_measurements.sensor2,US_measurements.sensor3, boundary);
         delay until myClock + Milliseconds(50);
      end loop;
   end think_task;

   procedure avoid_obstacle (Front_Sensor : Distance_cm; Left_Sensor : Distance_cm; Right_Sensor : Distance_cm; Boundary : Distance_cm) is
      direction : Directions;
      speed : Speeds;
   begin
         if Front_Sensor > boundary and Left_Sensor > boundary and Right_Sensor > boundary then
            return;
         elsif Front_Sensor > boundary and Left_Sensor > boundary and Right_Sensor <= boundary then
            direction := Left;
            speed := ((4095,4095,4095,4095));
         elsif Front_Sensor > boundary and Left_Sensor <= boundary and Right_Sensor > boundary then
           direction := Right;
            speed := ((4095,4095,4095,4095));
         elsif Front_Sensor > boundary and Left_Sensor <= boundary and Right_Sensor <= boundary then
            direction := Forward;
            speed := ((4095,4095,4095,4095));
         elsif Front_Sensor <= boundary and Left_Sensor > boundary and Right_Sensor > boundary then
            direction := Backward;
            speed := ((4095,4095,4095,4095));
         elsif Front_Sensor <= boundary and Left_Sensor > boundary and Right_Sensor <= boundary then
           direction := Backward_Right;
           speed := ((4095,4095,4095,4095));
         elsif Front_Sensor <= boundary and Left_Sensor <= boundary and Right_Sensor > boundary then
            direction := Backward_Left;
            speed := ((4095,4095,4095,4095));
         elsif Front_Sensor <= boundary and Left_Sensor <= boundary and Right_Sensor <= boundary then
            direction := Stop;
            speed := ((0,0,0,0));
         else
            direction := Stop;
            speed := ((0,0,0,0));
      end if;
      WheelController.set_direction(direction);
      WheelController.set_speed(speed);
      end avoid_obstacle;

   procedure  follow_line (PIDvalue : Float; max_speed : UInt12; error : Float) is
      value : UInt12;
      speed : speeds;
      direction : directions;
   begin
--since MotorDriver take speed in as a UInt12, and the PID value can be negative we cannot cast the PIDvalue directly to UInt12, hence we need to create a local variable that is always positive, notideal but a workaround
      if PIDvalue >= 0.0 and PIDvalue < Float(max_speed) then
         value := UInt12(PIDvalue);
      elsif PIDvalue < 0.0 and PIDvalue > Float(-max_speed) then
         value := UInt12((-1.0)*PIDvalue);
      else
         value := UInt12(max_speed);
      end if;

      if PID.get_invalid = true then
         if PIDvalue >= 0.0 then
            --Put_Line("Rotating right");
            direction := Rotating_Right;
            speed := ((max_speed,max_speed,max_speed,max_speed));
         elsif PIDvalue < 0.0 then
            --Put_Line("Rotating left");
            direction := Rotating_Left;
            speed := ((max_speed,max_speed,max_speed,max_speed));
         end if;

      elsif error = -2.0 then
         if value < max_speed then
            direction := Rotating_Right;
            speed := ((value,value,max_speed,max_speed));
         elsif value >= max_speed then
            direction := Rotating_Right;
            speed := (max_speed,max_speed,max_speed,max_speed);
         end if;

      elsif error = -1.0  then
         if (max_speed - value) > 0 then
            direction := Turning_Right;
            speed := ((max_speed - value, max_speed - value,max_speed,max_speed));
         elsif (max_speed - value) <= 0 and value < max_speed then
            direction := Rotating_Right;
            speed := ((value,value,max_speed,max_speed));
         elsif (max_speed- value) <= 0 and value >= max_speed then
            direction := Rotating_Right;
            speed := ((max_speed,max_speed, max_speed,max_speed));
         end if;

      elsif error = 0.0 then
         direction := Forward;
         speed :=((max_speed,max_speed,max_speed,max_speed));

      elsif error = 1.0  then
         if (max_speed - value) > 0 then
             direction := Turning_Left;
             speed:=((max_speed,max_speed,max_speed-value,max_speed-value));
         elsif (max_speed - value) <= 0 and value < max_speed  then
            direction := Rotating_Left;
            speed:=((max_speed,max_speed,value,value));
         elsif  (max_speed - value) <= 0 and value >= max_speed then
            direction := Rotating_Left;
            speed:=((max_speed,max_speed,max_speed,max_speed));
         end if;

      elsif error = 2.0 and value < max_speed then
         if value < max_speed then
            direction := Rotating_Left;
            speed:=((max_speed,max_speed,value,value));
         elsif value >= max_speed then
            direction := Rotating_Left;
            speed:=((max_speed,max_speed,max_speed,max_speed));
         end if;

      else
         direction := Stop;
         speed := ((0,0,0,0));
      end if;

      WheelController.set_direction(direction);
      WheelController.set_speed(speed);

   end follow_line;


end Think;
