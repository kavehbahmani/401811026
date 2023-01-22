library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux3t1 is
    Port (clk : in  STD_LOGIC;
        v0 : in  STD_LOGIC;
        v1 : in  STD_LOGIC;
        v2 : in  STD_LOGIC;
		reset : in std_logic;
        vout : out  STD_LOGIC);
end mux3t1;

architecture Behavioral of mux3t1 is

signal cnt : integer range 0 to 3:=0;

begin

process(clk,reset)

begin
	
	if reset='1' then
		cnt<=1;
	
    else
		
        if rising_edge(clk) then

		    if cnt=3 then
				cnt<= 1;
			
            else
				cnt<= cnt+1;
			end if;
		
        end if;
	
    end if;
end process;

with cnt select vout <=
    '0' when 0,
	v0 when 1,
    v1 when 2,
    v2 when 3;

end Behavioral;