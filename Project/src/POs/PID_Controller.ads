
with MicroBit.Console; use MicroBit.Console;
with MicroBit.IOsForTasking; use MicroBit.IOsForTasking;
with Ada.Real_Time; use Ada.Real_Time;
use MicroBit;

package PID_Controller is

   type pid_const is record
      Kp : Float;
      Ki : Float;
      Kd : Float;
   end record;

   type pid_values is record
      P : Float := 0.0;
      I : Float := 0.0;
      D : Float := 0.0;
   end record;

   protected PID is
      function get_error return Float;
      function get_PIDvalue return Float;
      function get_invalid return Boolean;

      procedure set_constants (K   : pid_const);
      procedure set_error (V1 : Boolean; V2 : Boolean; V3 : Boolean);
      procedure  calculate_PIDvalue;
      
   private
      constants     : pid_const;
      invalid : Boolean := false;
      PID_calc      : pid_values;
      error         : float := 0.0;
      previous_error : float := 0.0;
      previous_time     : Time := Clock;
      PIDvalue      : Float;
   end PID;

end PID_Controller;
