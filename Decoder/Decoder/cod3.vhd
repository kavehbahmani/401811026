library ieee;
use ieee.std_logic_1164.all;

entity cod3 is  
    port    (
            inSig   : in  std_logic_vector(6 downto 0); 
            outCod  : out std_logic_vector(2 downto 0)  
            );
end cod3;

architecture synth of cod3 is
begin
    process (inSig)
        variable tmp : std_logic_vector(2 downto 0);
    begin
        tmp(0) := ((not inSig(6)) and (not inSig(5)) and (not inSig(3))) or ((not inSig(6)) and inSig(5) and (not inSig(2))) or (inSig(6) and (not inSig(4)) and (not inSig(1))) or ((inSig(6)) and (inSig(4)) and (not inSig(0)));
        tmp(1) := ((not inSig(6)) and (not inSig(5))) or (inSig(6) and (not inSig(4)));
        tmp(2) := not inSig(6);
        outCod <= tmp;
    end process;
end;