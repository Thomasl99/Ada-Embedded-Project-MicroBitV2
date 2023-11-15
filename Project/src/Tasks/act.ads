with Brain; use Brain;
with PID_Controller; use PID_Controller;
with Wheel_Controller; use Wheel_Controller;
with MicroBit.MotorDriver; use MicroBit.MotorDriver;
with MicroBit.Console; use MicroBit.Console;
use MicroBit;
with nRF.GPIO; use nRF.GPIO;
with Ada.Real_Time; use Ada.Real_Time;

package Act is
   task act_task with priority => 3;
end Act;
