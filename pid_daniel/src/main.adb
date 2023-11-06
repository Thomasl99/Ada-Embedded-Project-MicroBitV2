with pid_controller; use pid_controller;

procedure Main is

begin
   pid_call.set_pins (0, 1, 2);
   pid_call.set_constants (50, 50, 50, 0);

   loop
      pid_calc.get_error;
      delay 0.5;
   end loop;
end Main;
