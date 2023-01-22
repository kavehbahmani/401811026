library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.turbopack.all;

entity opposite is  
    port    (
            pos : in  std_logic_vector(SIG_WIDTH + 1 downto 0); 
            neg : out std_logic_vector(SIG_WIDTH + 1 downto 0) 
            );
end opposite;

architecture synth of opposite is
begin
    neg <= std_logic_vector(conv_signed(-conv_integer(signed(pos)), SIG_WIDTH + 2));
end;