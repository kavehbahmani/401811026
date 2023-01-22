library ieee;
use ieee.std_logic_1164.all;
use work.turbopack.all;

entity stateSel is  
    port    (
            stateDist   : in ARRAY8a;                       
            selState    : out std_logic_vector(2 downto 0)  
            );
end stateSel;

architecture synth of stateSel is
    signal tmp : std_logic_vector(6 downto 0);
begin
    min8_i : min8   port map    (
                                op      => stateDist,
                                res     => tmp
                                );
    cod3_i : cod3   port map    (
                                inSig   => tmp,
                                outCod  => selState
                                );
end;