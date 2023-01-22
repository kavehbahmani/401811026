library ieee;
use ieee.std_logic_1164.all;
use work.turbopack.all;

entity reduction is 
    port    (
            org : in  ARRAY8a;  
            chd : out ARRAY8a   
            );
end reduction;

architecture synth of reduction is
begin
    process (org)
        variable msb : std_logic;
    begin
        msb := '1';
        for i in 0 to 7 loop
            msb := msb and org(i)(ACC_DIST_WIDTH - 1);
        end loop;
        for i in 0 to 7 loop
            chd(i)(ACC_DIST_WIDTH - 2 downto 0) <= org(i)(ACC_DIST_WIDTH - 2 downto 0);
            chd(i)(ACC_DIST_WIDTH - 1)          <= (not msb) and org(i)(ACC_DIST_WIDTH - 1);
        end loop;
    end process;
end;