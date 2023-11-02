------------------------------------------------------------------------------
--                                                                          --
--                       Copyright (C) 2018, AdaCore                        --
--                                                                          --
--  Redistribution and use in source and binary forms, with or without      --
--  modification, are permitted provided that the following conditions are  --
--  met:                                                                    --
--     1. Redistributions of source code must retain the above copyright    --
--        notice, this list of conditions and the following disclaimer.     --
--     2. Redistributions in binary form must reproduce the above copyright --
--        notice, this list of conditions and the following disclaimer in   --
--        the documentation and/or other materials provided with the        --
--        distribution.                                                     --
--     3. Neither the name of the copyright holder nor the names of its     --
--        contributors may be used to endorse or promote products derived   --
--        from this software without specific prior written permission.     --
--                                                                          --
--   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS    --
--   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT      --
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR  --
--   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT   --
--   HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, --
--   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT       --
--   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,  --
--   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY  --
--   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT    --
--   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE  --
--   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.   --
--                                                                          --
------------------------------------------------------------------------------

with MicroBit.Console; use MicroBit.Console;
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
         --  Console.Put ("LLL: Lost Track");
      end if;


      delay(0.1);

   end loop;
end Main;
