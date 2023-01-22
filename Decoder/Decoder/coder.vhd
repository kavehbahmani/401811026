library ieee;
use ieee.std_logic_1164.all;

entity coder is
    port    (
            clk : in  std_logic;    
            rst : in  std_logic;    
            a   : in  std_logic;    
            b   : in  std_logic;    
            y   : out std_logic;    
            w   : out std_logic     
            );
end coder;

architecture synth of coder is
    signal q1   : std_logic;
    signal q2   : std_logic;
    signal q3   : std_logic;
begin
    process(clk, rst)
    begin
        if rst = '0' then
            q1  <= '0';
            q2  <= '0';
            q3  <= '0';
        elsif clk = '1' and clk'event then
            q1  <= a xor b xor q1 xor q3;
            q2  <= q1 xor b;
            q3  <= q2 xor b;
        end if;
    end process;
    y <= a xor b xor q1 xor q3 xor q2 xor q3;
    w <= a xor b xor q1 xor q3 xor q3;
end;