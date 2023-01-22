library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity cmp2 is 
    port    (
            op1     : in  std_logic_vector;
            op2     : in  std_logic_vector; 
            res     : out std_logic        
            );
end cmp2;

architecture synth of cmp2 is
begin
    res <=  '0' when conv_integer(unsigned(op1)) > conv_integer(unsigned(op2)) else
            '1';
end;