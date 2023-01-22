library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_reg is
    Port (data_in : in  STD_LOGIC;
        clk : in  STD_LOGIC;
        data_out : out  STD_LOGIC);
end shift_reg;

architecture Behavioral of shift_reg is

signal temp_data_out : std_logic:='0';

begin

process(clk)

begin

	if(clk'event and clk='1') then
	    temp_data_out<=data_in;
	end if;

end process;

data_out<=temp_data_out;

end Behavioral;