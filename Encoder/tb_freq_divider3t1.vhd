LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_freq_divider3t1 IS
END tb_freq_divider3t1;
 
ARCHITECTURE behavior OF tb_freq_divider3t1 IS 

    COMPONENT freq_divider3t1
    PORT(
        clk_in : IN  std_logic;
        clk_out : OUT  std_logic);
    END COMPONENT;

    signal clk_in : std_logic := '0';
    signal clk_out : std_logic;

    constant clk_in_period : time := 10 ns;
 
BEGIN

    uut: freq_divider3t1 PORT MAP (
        clk_in => clk_in,
        clk_out => clk_out);

    clk_in_process :process
    begin
	    clk_in <= '0';
		wait for clk_in_period/2;
		clk_in <= '1';
		wait for clk_in_period/2;
    end process;

    stim_proc: process
    begin		
        wait for 100 ns;	
        wait for clk_in_period*10;
        wait;
    end process;

END;