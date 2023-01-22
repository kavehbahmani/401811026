LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_encoder IS
END tb_encoder;
 
ARCHITECTURE behavior OF tb_encoder IS 

    COMPONENT encoder
    PORT(
        data_in : IN  std_logic_vector(7 downto 0);
        clk_in : IN  std_logic;
        reset : IN  std_logic;
        data_out : OUT  std_logic);
    END COMPONENT;

    signal data_in : std_logic_vector(7 downto 0) := (others => '0');
    signal clk_in : std_logic := '0';
    signal reset : std_logic := '0';
    signal data_out : std_logic;

    constant clk_in_period : time := 10 ns;

BEGIN

    uut: encoder PORT MAP (
            data_in => data_in,
            clk_in => clk_in,
            reset => reset,
            data_out => data_out);

   clk_in_process :process
    begin
	    clk_in <= '0';
		wait for clk_in_period/2;
		clk_in <= '1';
		wait for clk_in_period/2;
    end process;

    stim_proc: process
    begin		
	    reset<='0';
	    data_in<="10101010";
        wait;
    end process;
    
END;