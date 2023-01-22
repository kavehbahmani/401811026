LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_interleaver IS
END tb_interleaver;
 
ARCHITECTURE behavior OF tb_interleaver IS 
 
    COMPONENT interleaver
    PORT(
        data_in : IN  std_logic_vector(7 downto 0);
        data_out : OUT  std_logic_vector(7 downto 0));
    END COMPONENT;
   
    signal data_in : std_logic_vector(7 downto 0) := (others => '0');
    signal data_out : std_logic_vector(7 downto 0);

BEGIN

    uut: interleaver PORT MAP (
        data_in => data_in,
        data_out => data_out);

    stim_proc: process
    begin		
        wait for 100 ns;	
		data_in<="11001110";
        wait;
    end process;

END;
