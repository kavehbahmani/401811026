library ieee;
use ieee.std_logic_1164.all;

entity mux2 is  
    port    (
            in1     : in  std_logic_vector; 
            in2     : in  std_logic_vector; 
            sel     : in  std_logic;       
            outSel  : out std_logic_vector 
            );
end mux2;

architecture synth of mux2 is
begin
    outSel <=   in2 when sel = '0' else
                in1;
end;