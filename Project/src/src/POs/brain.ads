with MicroBit.types; use MicroBit.types;
with HAL;     use HAL;
package Brain is
   
   protected Brain is
      function GetUltrasonicDistance (I : UInt2) return Distance_cm; --UInt2 since there are 3 sensors
      function GetLinetracker ( i : UInt2); return Boolean; --UInt2 since there are 3 sensors
      
      procedure SetUltrasonicDistance (distance : distance_cm);
      procedure SetLineTracker (OnLine : boolean);
      
   private
      LeftUltrasonicSensor : Distacne_cm; --Sensor0
      FrontUltrasonicSensor : Distance_cm; --Sensor1
      RightUltrasonicSensor : Distance_cm; --Sensor2
      
      LeftLineTracker : Boolean; --Sensor0
      MiddleLineTracker : boolean; --Sensor2
      RightLineTracker: Boolean; --Sensor3
end Brain;
