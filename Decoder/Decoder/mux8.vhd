library ieee;
use ieee.std_logic_1164.all;
use work.turbopack.all;

entity mux8 is 
    port    (
            in8x4   : in  ARRAY32c; 
            sel     : in  std_logic_vector(2 downto 0); 
            outSel4 : out ARRAY4a   
            );
end mux8;

architecture synth of mux8 is
begin
    process (in8x4, sel)
    begin
        if sel = "000" then
            for i in 0 to 3 loop
                outSel4(i) <= in8x4(i);
            end loop;
        elsif sel = "001" then
            for i in 0 to 3 loop
                outSel4(i) <= in8x4(i + 4);
            end loop;
        elsif sel = "010" then
            for i in 0 to 3 loop
                outSel4(i) <= in8x4(i + 8);
            end loop;
        elsif sel = "011" then
            for i in 0 to 3 loop
                outSel4(i) <= in8x4(i + 12);
            end loop;
        elsif sel = "100" then
            for i in 0 to 3 loop
                outSel4(i) <= in8x4(i + 16);
            end loop;
        elsif sel = "101" then
            for i in 0 to 3 loop
                outSel4(i) <= in8x4(i + 20);
            end loop;
        elsif sel = "110" then
            for i in 0 to 3 loop
                outSel4(i) <= in8x4(i + 24);
            end loop;
        else
            for i in 0 to 3 loop
                outSel4(i) <= in8x4(i + 28);
            end loop;
        end if;
    end process;
end;