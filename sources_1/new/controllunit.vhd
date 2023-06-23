
library IEEE;
use IEEE.std_logic_1164.all;

entity controllunit is
	generic (
	n    :    integer
	);
	port(
	start     :  in   std_logic;
	GT        :  in   std_logic;
	clk       :  in   std_logic;
	load      :  out  std_logic;
	done      :  out  std_logic;
	Dout      :  out  std_logic_vector(n - 1 downto 0) 
	);
end entity controllunit;


architecture action of controllunit is
signal StartChecker : std_logic := '0';
begin
	
	process is
	begin
		wait on start;
		if (start = '1' and StartChecker = '0') then
		
			for i in n - 1 downto 0 loop
				Dout(i) <= '1'; --sinyal ataması yapıyoruz <= ile
				wait on clk;
				if (GT = '1') then
					Dout(i) <= '0';	
				end if;
			end loop;
			
			done <= '1'; --done sinyali 1 e atandı
			load <= '1'; --load sinyali 1 e atandı çünkü yükleme yaptık
			StartChecker <= '1'; --başladığını belirtmek için baslamadurumunu 1 yaptık
			
		elsif (start = '0') then --program baslamadıysa basta default degerler atadık.
			done <= '0';
			load <= '0';
			StartChecker <= '0';
			for i in n - 1 downto 0 loop
				Dout(i) <= '0';
			end loop;
		end if;
		
	end process;
	
	
	
end architecture action;