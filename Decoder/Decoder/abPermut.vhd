library ieee;
use ieee.std_logic_1164.all;
use work.turbopack.all;

entity abPermut is  
    generic (
            flip        : integer := 0                             
            );
    port    (
            flipflop    : in  std_logic;                                
            a           : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            b           : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            abPerm      : out ARRAY2a                                 
            );
end abPermut;

architecture synth of abPermut is
begin
    flipflop_g0 : if flip = 0 generate
        process (flipflop, a, b)
        begin
            if flipflop = '0' then
                abPerm(1) <= a;
                abPerm(0) <= b;
            else
                abPerm(1) <= b;
                abPerm(0) <= a;
            end if;
        end process;
    end generate;
    flipflop_g1 : if flip = 1 generate
        process (flipflop, a, b)
        begin
            if flipflop = '1' then
                abPerm(1) <= a;
                abPerm(0) <= b;
            else
                abPerm(1) <= b;
                abPerm(0) <= a;
            end if;
        end process;
    end generate;
end;