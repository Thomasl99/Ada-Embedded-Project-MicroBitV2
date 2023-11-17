package body Brain is

   protected body US is
      function get_measurements return ultrasonic_measurements is
      begin
         return measurements;
      end get_measurements;
      
      procedure set_measurements is
         package us1 is new Ultrasonic(US.pins.sensor1_trigger,US.pins.sensor1_echo);
         package us2 is new Ultrasonic(US.pins.sensor2_trigger,US.pins.sensor2_echo);
         package us3 is new Ultrasonic(US.pins.sensor3_trigger,US.pins.sensor3_echo);
      begin
         measurements.sensor1 := us1.Read;
         measurements.sensor2 := us2.Read;
         measurements.sensor3 := us3.Read;
      end set_measurements;

      procedure set_pins (V : ultrasonic_pin_id) is
      begin
         pins := V;
         end set_pins;
   end US;
   
   protected body LT is
      
      function get_measurements return line_tracker_measurements is
      begin
         return measurements;
      end get_measurements;
      
      
      procedure set_pins (V : line_tracker_pin_id) is
      begin
         pins := V;
      end set_pins;
      
      procedure set_measurements is
      begin
         measurements.line_tracker1 := Set(pins.line_tracker1); --set function from IOsForTasking to read from the line tracker
         measurements.line_tracker2 := Set(pins.line_tracker2);
         measurements.line_tracker3 := Set(pins.line_tracker3);
      end set_measurements;

      end LT;
      

end Brain;
