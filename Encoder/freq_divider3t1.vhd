library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity freq_divider3t1 is
    Port (clk_in : in  STD_LOGIC;
        clk_out : out  STD_LOGIC);
end freq_divider3t1;

architecture Behavioral of freq_divider3t1 is

subtype int3 is integer range 1 to 3;

signal cnt1,cnt2 : int3:=1;
signal temp_clk : std_logic:='0';

begin

process(clk_in)

begin
	if (clk_in'event and clk_in='1') then
		
        if cnt1=1 then
		    temp_clk<='1';
		end if;
		
		if cnt1=3 then
			cnt1<=1;
		else
		cnt1<=cnt1+1;
		end if;
		
	end if;
	
	if(clk_in'event and clk_in='0') then
		
        if cnt2=2 then
			temp_clk<='0';
		end if;
		
		if cnt2=3 then
			cnt2<=1;
		
        else
		cnt2<=cnt2+1;
		end if;
		
	end if;

end process;
	
clk_out<= temp_clk;

end Behavioral;

