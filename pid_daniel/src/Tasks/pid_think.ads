with pid_setup; use pid_setup;
with Ada.Real_Time; use Ada.Real_Time;

package pid_think is
   
      task pidCalc_task with Priority => 2;
      
end pid_think;
