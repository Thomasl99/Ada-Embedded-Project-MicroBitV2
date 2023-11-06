with MicroBit.Console; use MicroBit.Console;
with MicroBit.IOsForTasking; use MicroBit.IOsForTasking;
use MicroBit;

package pid_controller is
   type error_val is range -2 .. 2;

   type line_pins is record
      LineTrack1 : Boolean;
      LineTrack2 : Boolean;
      LineTrack3 : Boolean;
   end record;

   type pid_const is record
      Kp : integer;
      Ki : integer;
      Kd : integer;
   end record;

   type pid_values is record
      P : error_val;
      I : integer;
      D : integer;
      previousError : error_val;
   end record;




   --  procedure set_pins;
   protected pid_call is
      function get_constants return pid_const;
      function get_error return error_val;
      function get_PIDvalue return integer;

      procedure set_pins (V : line_pins);
      procedure set_constants (K : pid_const);
      procedure set_pid (K : pid_const, error : error);
      procedure get_error;
      --  procedure set_pid (error : error_val);
   private
      Pins : line_pins;
      Constants : pid_const;
      PID_calc : pid_values;
      lost_track : Bolean := false;
      error : error_val := 0;
      PIDvalue : integer := 0;
   end pid_calc;


end pid_controller;
