library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity delayer is  
    generic (
            delay   : integer := 1         
            );
    port    (
            clk     : in  std_logic;        
            rst     : in  std_logic;        
            d       : in  std_logic_vector; 
            q       : out std_logic_vector  
            );
end delayer;

architecture synth of delayer is
    type ARRAYdelay is array (0 to delay - 1) of std_logic_vector(d'length - 1 downto 0);
    signal r    : ARRAYdelay;
begin
    process (clk, rst)
    begin
        if rst = '0' then
            q <= std_logic_vector(conv_unsigned(0, d'length));
            for i in 0 to delay - 1 loop
                r(i) <= (others => '0');
            end loop;
        elsif clk = '1' and clk'event then
            r(0)    <= d;
            q       <= r(delay - 1);
            for i in 0 to delay - 2 loop
                r(i + 1) <= r(i);
            end loop;
        end if;
    end process;
end;