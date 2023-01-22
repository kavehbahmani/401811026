library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.turbopack.all;

entity distance is  
    port    (
            partDist    : in  std_logic_vector(SIG_WIDTH + 1 downto 0);    
            z           : in  std_logic_vector(Z_WIDTH - 1 downto 0);    
            dist        : out std_logic_vector(ACC_DIST_WIDTH - 1 downto 0) 
            );
end distance;

architecture synth of distance is
begin
    dist <= std_logic_vector(conv_unsigned((4 * (2 ** (SIG_WIDTH - 1) - 1) + conv_integer(signed(partDist))) / 2 + conv_integer(unsigned(z)), ACC_DIST_WIDTH));
end;