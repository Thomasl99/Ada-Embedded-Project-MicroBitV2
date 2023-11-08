with MicroBit.Console; use MicroBit.Console;
with MicroBit.IOsForTasking; use MicroBit.IOsForTasking;
use MicroBit;

package pid_setup is

   type error_val is new Integer range -2 .. 2;
   
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
      Kp : Integer;
      Ki : Integer;
      Kd : Integer;
   end record;

   type pid_values is record
      P : error_val;
      I : Integer;
      D : Integer;
   end record;


   protected pid_set is
      --  function get_pins return line_pins;
      --  function get_constants return pid_const;
      --  function get_pid_calc return pid_values;
      function get_lost_track return Boolean;
      function get_error return error_val;
      function get_PIDvalue return Integer;

      --  procedure set_pins (Line1    : Pin_Id; Line2 : Pin_Id; Line3 : Pin_Id);
      procedure set_pins (V : line_pin_id);
      procedure set_constants (K   : pid_const);
      procedure set_error;
      procedure set_pid;
      
   private
      Pin_Ids : line_pin_id;
      --  Pins                         : line_pins;
      Constants                    : pid_const;
      PID_calc                     : pid_values;
      lost_track                   : Boolean := false;
      error                        : error_val := 0;
      previousError                : error_val := 0;
      PIDvalue                     : Integer := 0;
   end pid_set;

end pid_setup;
