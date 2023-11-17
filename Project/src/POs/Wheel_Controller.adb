package body Wheel_Controller is

   protected body WheelController is
      procedure set_direction (V: Directions) is
      begin
         Direction := V;
      end set_direction;
      procedure set_speed (V: Speeds) is
      begin
         Speed := V;
      end set_speed;
      
      function get_direction return Directions is
      begin
         return Direction;
      end get_direction;
      
      function get_speed return Speeds is
      begin
         return Speed;
      end get_speed;
      
   end WheelController;
   
      
end Wheel_Controller;
