library ieee;
use ieee.std_logic_1164.all;
use work.turbopack.all;

entity zPermut is   
    generic (
            flip        : integer := 0      
            );
    port    (
            flipflop    : in  std_logic;    
            z           : in  ARRAY4c;      
            zPerm       : out ARRAY4c      
            );
end zPermut;

architecture synth of zPermut is
begin
    flipflop_g0 : if flip = 0 generate
        process (flipflop, z)
        begin
            if flipflop = '0' then
                zPerm(0) <= z(0);
                zPerm(1) <= z(1);
                zPerm(2) <= z(2);
                zPerm(3) <= z(3);
            else
                zPerm(0) <= z(0);
                zPerm(1) <= z(2);
                zPerm(2) <= z(1);
                zPerm(3) <= z(3);
            end if;
        end process;
    end generate;
    flipflop_g1 : if flip = 1 generate
        process (flipflop, z)
        begin
            if flipflop = '1' then
                zPerm(0) <= z(0);
                zPerm(1) <= z(1);
                zPerm(2) <= z(2);
                zPerm(3) <= z(3);
            else
                zPerm(0) <= z(0);
                zPerm(1) <= z(2);
                zPerm(2) <= z(1);
                zPerm(3) <= z(3);
            end if;
        end process;
    end generate;
end;