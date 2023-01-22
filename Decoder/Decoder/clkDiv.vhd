library ieee;
use ieee.std_logic_1164.all;
use work.turbopack.all;

entity clkDiv is
    port    (
            clk     : in  std_logic;    
            rst     : in  std_logic;    
            clkout  : out std_logic     
            );
end clkDiv;

architecture synth of clkDiv is
    signal clkout_s : std_logic;
begin
    clkout <= clkout_s;
    process(clk, rst)
    begin
        if rst = '0' then
            clkout_s <= '0';
        elsif clk = '1' and clk'event then
            clkout_s <= not clkout_s;
        end if;
    end process;
end;