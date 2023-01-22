library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity reg is   
    port    (
            clk     : in  std_logic;     
            rst     : in  std_logic;        
            d       : in  std_logic_vector; 
            q       : out std_logic_vector  
            );
end reg;

architecture synth of reg is
begin
    process (clk, rst)
    begin
        if rst = '0' then
            q <= std_logic_vector(conv_unsigned(0, d'length));
        elsif clk = '1' and clk'event then
            q <= d;
        end if;
    end process;
end;