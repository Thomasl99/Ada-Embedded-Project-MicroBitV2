with MicroBit.Console;
with MicroBit.IOsForTasking; use MicroBit.IOsForTasking;
use MicroBit;

procedure Main is
   LineTrack1 : Boolean;
   LineTrack2 : Boolean;
   LineTrack3 : Boolean;
   error : Integer;

begin
   LineTrack1 := set (2);
   LineTrack2 := set (1);
   LineTrack3 := set (0);
   error := 0;

   Console.Put(LineTrack1'Image);
   Console.Put(LineTrack2'Image);
   Console.Put(LineTrack3'Image);
   --  Insert code here.
   loop
      if set (2) = false and set (1) = false and set (0) = true then
         error := 2;
         Console.Put ("LLH ");
      elsif set (2) = false and set (1) = true and set (0) = true then
         error := 1;
         Console.Put ("LHH ");
      elsif set (2) = false and set (1) = true and set (0) = false then
         error := 0;
         Console.Put ("LHL ");
      elsif set (2) = true and set (1) = true and set (0) = false then
         error := -1;
         Console.Put ("HHL ");
      elsif set (2) = true and set (1) = false and set (0) = false then
         error := -2;
         Console.Put ("HLL ");
      else
         Error := 100;
         Console.Put ("LLL: Lost Track");
      end if;

      delay(0.1);

      end loop;

   null;
end Main;
