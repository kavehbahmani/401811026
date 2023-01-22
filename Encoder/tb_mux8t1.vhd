LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_mux8t1 IS
END tb_mux8t1;
 
ARCHITECTURE behavior OF tb_mux8t1 IS 
    COMPONENT mux8t1
    PORT(
        data_in : IN  std_logic_vector(7 downto 0);
        clk : IN  std_logic;
        reset : IN  std_logic;
        data_out : OUT  std_logic);
    END COMPONENT;

    signal data_in : std_logic_vector(7 downto 0) := (others => '0');
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    
    signal data_out : std_logic;

    constant clk_period : time := 10 ns;
 
BEGIN

   uut: mux8t1 PORT MAP (
            data_in => data_in,
            clk => clk,
            reset => reset,
            data_out => data_out);

    clk_process :process
    begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
    end process;
   
    stim_proc: process
    begin		
		reset<='0';
		data_in<="Z10Z10Z1";
        wait;
    end process;
    
END;
