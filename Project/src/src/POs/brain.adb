package body Brain is

   protected body Brain is
      
      function GetUltrasonicDistance (I : UInt2) return Distance_cm is
      begin
         case I is
            when 0 =>
               return LeftUltrasonicSensor;
            when 1 =>
               return FrontUltrasonicSensor;
            when 2 =>
               return RightUltrasonicSensor;
         end case;
      end GetUltrasonicDistance;
         
      function GetLinetracker (I : UInt2) return Boolean is
      begin
         case I is
            when 0 =>
               return LeftLineTracker;
            when 1 =>
               return MiddleLineTracker;
            when 2 =>
               return RightLineTracker;
         end case;
      end GetLinetracker;
      
      procedure SetUltrasonicDistance (distance : distance_cm) is
      begin
      end	SetUltrasonicDistance;
            
      procedure SetLineTracker (OnLine : boolean) is
      begin
      end SetLineTracker;
         

end Brain;
