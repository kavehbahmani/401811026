library ieee;
use ieee.std_logic_1164.all;

entity clkrst is   
    generic (
            period  : time := 5 ns    
            );
    port    (
            clk     : out std_logic;   
            rst     : out std_logic    
            );
end clkrst;

architecture beh of clkrst is
begin
    rst <= '0', '1' after (period / 4);
    
    process
    begin
        clk <= '0';
        wait for (period / 2);
        clk <= '1';
        wait for (period / 2);
    end process;
end;