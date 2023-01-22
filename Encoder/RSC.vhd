library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RSC is
    Generic (NofRSC: integer:=2);
    
    Port (data_in : in  STD_LOGIC;
        data_out : out  STD_LOGIC;
        clk : in  STD_LOGIC);
end RSC;

architecture Behavioral of RSC is

signal ro : std_logic_vector(NofRSC downto 0):= (others=>'0');
signal uw : std_logic_vector(NofRSC downto 1):=(others=>'0');

COMPONENT shift_reg
    PORT (data_in : in  STD_LOGIC;
        clk : in  STD_LOGIC;
        data_out : out  STD_LOGIC);
END COMPONENT;

begin

gen_mem:
for i in 1 to NofRSC generate
    mem: shift_reg port map 
	(ro(i-1),clk,ro(i));
end generate gen_mem;

gen_uw:
for i in 1 to NofRSC-1 generate
	uw(i)<= ro(i) xor uw(i+1);
end generate gen_uw;

uw(NofRSC)<= ro(NofRSC);
ro(0)<= data_in xor uw(1);
data_out<=ro(0) xor ro(NofRSC);

end Behavioral;