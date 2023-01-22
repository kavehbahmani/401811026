LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_RSC IS
END tb_RSC;
 
ARCHITECTURE behavior OF tb_RSC IS 

    COMPONENT RSC
    PORT(data_in : IN  std_logic;
        data_out : OUT  std_logic;
        clk : IN  std_logic);
    END COMPONENT;

    signal data_in : std_logic := '0';
    signal clk : std_logic := '0';
    signal data_out : std_logic;

    constant clk_period : time := 10 ns;
 
BEGIN

    uut: RSC PORT MAP (
        data_in => data_in,
        data_out => data_out,
        clk => clk);

   clk_process : process
    begin
	    clk <= '0';
	    wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
    end process;

   stim_proc: process
   begin		
        wait for 100 ns;	
        wait for clk_period*10;
		data_in<='0';
		wait for clk_period*1;
		data_in<='1';
		wait for clk_period*1;
		data_in<='0';
		wait for clk_period*1;
		data_in<='1';
		wait for clk_period*1;
		data_in<='0';
		wait for clk_period*1;
		data_in<='1';
        wait;

    end process;

END;