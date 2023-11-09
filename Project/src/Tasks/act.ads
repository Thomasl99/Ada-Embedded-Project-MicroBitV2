with Brain; Use Brain;
with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.MotorDriver; use MicroBit.MotorDriver;
with MicroBit.Console; use MicroBit.Console;
with HAL; use HAL;
use MicroBit;

package Act is
   
   task Drive with priority => 1;
end Act;
