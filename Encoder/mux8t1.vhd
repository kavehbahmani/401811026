library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8t1 is
    Port (data_in : in  STD_LOGIC_VECTOR (7 downto 0);
        clk : in  STD_LOGIC;
		reset : in std_logic;
        data_out : out  STD_LOGIC);
end mux8t1;

architecture Behavioral of mux8t1 is

signal cnt : integer range 1 to 9:=9;

begin

process(clk,reset)

begin

	if reset='1' then
	    cnt<=8;
	else
		if rising_edge(clk) then
		
			if cnt=1 then
				cnt<= 8;
			
            else
				cnt<= cnt-1;
			
            end if;
		end if;
	
    end if;
	
end process;

with cnt select data_out <=
    data_in(0) when 1,
    data_in(1) when 2,
    data_in(2) when 3,
    data_in(3) when 4,
	data_in(4) when 5,
	data_in(5) when 6,
	data_in(6) when 7,
	data_in(7) when 8,
	'0' when 9;

end Behavioral;