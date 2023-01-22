library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity adder is 
    port    (
            op1     : in  std_logic_vector; 
            op2     : in  std_logic_vector; 
            res     : out std_logic_vector
            );
end adder;

architecture synth of adder is
begin
    process (op1, op2)
    begin
        res <= std_logic_vector(conv_unsigned(conv_integer(unsigned(op1)) + conv_integer(unsigned(op2)), res'length));
    end process;
end;