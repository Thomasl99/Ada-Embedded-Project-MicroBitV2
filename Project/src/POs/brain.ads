with MicroBit.Console; use MicroBit.Console;
with Microbit.Ultrasonic;
with Microbit.types; use Microbit.types;
with MicroBit.IOsForTasking; use MicroBit.IOsForTasking;
with nRF.GPIO;
use Microbit;

package Brain is
   type ultrasonic_pin_id is record
      sensor1_trigger : nRF.GPIO.GPIO_Point;
      sensor1_echo : nRF.GPIO.GPIO_Point;
      sensor2_trigger : nRF.GPIO.GPIO_Point;
      sensor2_echo : nRF.GPIO.GPIO_Point;
      sensor3_trigger : nRF.GPIO.GPIO_Point;
      sensor3_echo : nRF.GPIO.GPIO_Point;  
   end record;
   
   type ultrasonic_measurements is record
      sensor1 : Distance_cm;
      sensor2 : Distance_cm;
      sensor3 : Distance_cm;
   end record;
   
   type line_tracker_pin_id is record
      line_tracker1 : Pin_Id;
      line_tracker2 : Pin_Id;
      line_tracker3 : Pin_Id;
   end record;
   type line_tracker_measurements is record
      line_tracker1 : Boolean;
      line_tracker2 : Boolean;
      line_tracker3 : Boolean;
   end record;
   
   
   protected US is
      function get_measurements return ultrasonic_measurements;

      procedure set_measurements;
      procedure set_pins (V : ultrasonic_pin_id);
   private
      pins : ultrasonic_pin_id;
      measurements : ultrasonic_measurements;
      
   end US;

   protected LT is
      function get_measurements return line_tracker_measurements;
      
      procedure set_pins (V : line_tracker_pin_id);
      procedure set_measurements;
      

   private
      pins : line_tracker_pin_id;
      measurements : line_tracker_measurements;
         
   end LT;
   
end Brain;
