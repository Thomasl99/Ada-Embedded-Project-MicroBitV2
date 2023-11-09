with pid_setup; use pid_setup;
with Ada.Real_Time; use Ada.Real_Time;

package pid_sense is
   
   task sense_task with Priority => 2;
   
end pid_sense;
