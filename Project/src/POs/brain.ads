
with MicroBit.Console; use MicroBit.Console;
with MicroBit.IOsForTasking; use MicroBit.IOsForTasking;
with Ada.Real_Time; use Ada.Real_Time;
use MicroBit;

package Brain is

   type error_val is new Integer range -4 .. 4;
   
   type line_pin_id is record
      Line_1 : Pin_Id;
      Line_2 : Pin_Id;
      Line_3 : Pin_Id;
   end record;

   --  type line_pins is record
   --     LineTrack1 : Boolean;
   --     LineTrack2 : Boolean;
   --     LineTrack3 : Boolean;
   --  end record;

   type pid_const is record
      Kp : Float;
      Ki : Float;
      Kd : Float;
   end record;

   type pid_values is record
      P : error_val;
      I : Float;
      D : Float;
   end record;


   protected brain_functions is
      --  function get_pins return line_pins;
      --  function get_constants return pid_const;
      --  function get_pid_calc return pid_values;
      function get_lost_track return Boolean;
      function get_error return error_val;
      function get_PIDvalue return Float;
      function Elapsed_Time return Float;

      --  procedure set_pins (Line1    : Pin_Id; Line2 : Pin_Id; Line3 : Pin_Id);
      procedure set_pins (V : line_pin_id);
      procedure set_constants (K   : pid_const);
      procedure set_error;
      procedure set_Last_Time;
      procedure set_pid;
      
   private
      Pin_Ids : line_pin_id;
      --  Pins                         : line_pins;
      Constants                    : pid_const;
      PID_calc                     : pid_values;
      lost_track                   : Boolean := false;
      error                        : error_val := 0;
      previousError                : error_val := 0;
      Last_Time : Time;
      PIDvalue                     : Float;
   end brain_functions;



   

end Brain;
