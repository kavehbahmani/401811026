library ieee;
use ieee.std_logic_1164.all;

entity cod2 is  
    port    (
            in1     : in  std_logic;                  
            in2     : in  std_logic;                    
            in3     : in  std_logic;                   
            outCod  : out std_logic_vector(1 downto 0)  
            );
end cod2;

architecture synth of cod2 is
begin
    process (in1, in2, in3)
        variable tmp : std_logic_vector(2 downto 0);
    begin
        tmp := in1 & in2 & in3;
        case tmp is
            when "101" =>
                outCod <= "00";
            when "111" =>
                outCod <= "00";
            when "001" =>
                outCod <= "01";
            when "011" =>
                outCod <= "01";
            when "010" =>
                outCod <= "10";
            when "110" =>
                outCod <= "10";
            when "000" =>
                outCod <= "11";
            when others =>
                outCod <= "11";
        end case;
    end process;
end;