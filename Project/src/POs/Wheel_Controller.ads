with MicroBit.MotorDriver; use MicroBit.MotorDriver;
with Ada.Real_Time; use Ada.Real_Time;
use MicroBit;
package Wheel_Controller is
   protected WheelController is
      procedure set_direction ( V : Directions);
      procedure set_speed (V : Speeds);
      
      function get_direction return Directions;
      function get_speed return Speeds;
private
   Direction : Directions := Stop;
   Speed : Speeds := (4095,4095,4095,4095); --Max speed
   end WheelController;
   

end Wheel_Controller;
