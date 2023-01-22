library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity interleaver is
    Port (data_in : in  STD_LOGIC_VECTOR (7 downto 0);
        data_out : out  STD_LOGIC_VECTOR (7 downto 0));
end interleaver;

architecture Behavioral of interleaver is

begin

data_out<=data_in(6)&data_in(5)&data_in(3)&data_in(2)&data_in(1)&data_in(4)&data_in(0)&data_in(7);

end Behavioral;