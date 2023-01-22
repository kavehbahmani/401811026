library ieee;
use ieee.std_logic_1164.all;
use work.turbopack.all;

entity mux4 is  
    port    (
            in1     : in  std_logic_vector; 
            in2     : in  std_logic_vector; 
            in3     : in  std_logic_vector; 
            in4     : in  std_logic_vector; 
            sel     : in  std_logic_vector(1 downto 0); 
            outSel  : out std_logic_vector 
            );
end mux4;

architecture synth of mux4 is
begin
    process (in1, in2, in3, in4, sel)
    begin
        if sel = "00" then
            outSel <= in1;
        elsif sel = "01" then
            outSel <= in2;
        elsif sel = "10" then
            outSel <= in3;
        else
            outSel <= in4;
        end if;
    end process;
end;