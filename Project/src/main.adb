with Sense;
with Think;
with Act;
-- USN PROJECT TEMPLATE INTELLIGENT REAL-TIME SYSTEMS
-- Project name: Ada Auto Pioneers
-- Project members: Thomas Lunde, Daniel �stmoen


--This is a project template for a Jorvik profile (a less restrictive Ravenscar) for the MicroBit v2 such that we have a language supported real-time OS for embedded targets
--It requires the nRF52833 Jorvik runtime files. They can be found in the folder "runtime profiles" and need to be copied to your earm-eabi compiler toolchain
--In future version of GNATstudio this profile is automatically available and this step can be skipped (for status see: https://github.com/AdaCore/bb-runtimes/pull/67)

--Check out the many examples in the ADL for the MicroBit v2 to see:
--  1) How the various drivers can be used like the accelerometer,speaker  or wireless communication via radio
--  2) How ADA features like the Math library and Bounded_Vectors (Containers) can be used
--  3) How to structure your Ada tasks with a protected object to synchronize data or with entries to synchronize flow
--  4) How to perform a execution time analysis
--  5) How to integrate your Ada project with a Unity project over USB

-- Open a View > Cross Platforms > Serial Ports to see Put_Line output. Set the baud rate to 115.200
procedure Main with Priority => 0 is
begin
   loop
      null;
   end loop;
end Main;
