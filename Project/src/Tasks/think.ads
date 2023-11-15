with Brain; use Brain;
with PID_Controller; use PID_Controller;
with Wheel_Controller; use Wheel_Controller;
with MicroBit.MotorDriver; use MicroBit.MotorDriver;
with HAl; use HAL;
with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Console; use MicroBit.Console;
with MicroBit.Types; use MicroBit.Types;
use MicroBit;

package Think is
   
   task think_task with Priority => 2;
   procedure avoid_obstacle (Front_Sensor : Distance_cm; Left_Sensor : Distance_cm; Right_Sensor : Distance_cm; Boundary : Distance_cm);
   procedure follow_line(PIDvalue : Float; max_speed : UInt12; error : Float);
   

end Think;
