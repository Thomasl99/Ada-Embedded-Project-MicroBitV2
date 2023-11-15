with Brain; use Brain;
with PID_Controller; use PID_Controller;
with MicroBit.Console; use MicroBit.Console;
with Ada.Real_Time; use Ada.Real_Time;
use MicroBit;


package Sense is
   
   task sense_task with Priority => 1;
   
end Sense;
