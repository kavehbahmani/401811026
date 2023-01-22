LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_mux3t1 IS
END tb_mux3t1;
 
ARCHITECTURE behavior OF tb_mux3t1 IS 
 
    COMPONENT mux3t1
    PORT(
        clk : IN  std_logic;
        v0 : IN  std_logic;
        v1 : IN  std_logic;
        v2 : IN  std_logic;
        reset : IN  std_logic;
        vout : OUT  std_logic);
    END COMPONENT;

    signal clk : std_logic := '0';
    signal v0 : std_logic := '0';
    signal v1 : std_logic := '0';
    signal v2 : std_logic := '0';
    signal reset : std_logic := '0';

    signal vout : std_logic;

    constant clk_period : time := 10 ns;
 
BEGIN

    uut: mux3t1 PORT MAP (
            clk => clk,
            v0 => v0,
            v1 => v1,
            v2 => v2,
            reset => reset,
            vout => vout);

    clk_process :process
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
		reset<='1';
		wait for clk_period*2;
		reset<='0';
		v0<='Z';
		v1<='1';
		v2<='0';
        wait;
   end process;

END;