library IEEE;
use IEEE.std_logic_1164.all;


entity theCompration is 
  port(
  pos,neg  :  in   real;
  GT          :  out  std_logic
  );
       
end entity theCompration;
 
architecture action of theCompration is 
begin
 GT <= '1' when pos > neg else '0';
end architecture action;