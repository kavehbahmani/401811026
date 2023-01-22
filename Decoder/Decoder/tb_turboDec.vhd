LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use work.turbopack.all;
	
ENTITY tb_turboDec IS
END tb_turboDec;

ARCHITECTURE behavior OF tb_turboDec IS 

          COMPONENT turboDec
              port    (
            clk         : in  std_logic;                                
            rst         : in  std_logic;                                
            aNoisy      : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            bNoisy      : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            yNoisy      : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            wNoisy      : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            yIntNoisy   : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            wIntNoisy   : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            aDec        : out std_logic_vector(IT - 1 downto 0);        
            bDec        : out std_logic_vector(IT - 1 downto 0)         
            );
          END COMPONENT;

            signal clk         : std_logic;                                
            signal rst         : std_logic;                                
            signal aNoisy      : std_logic_vector(SIG_WIDTH - 1 downto 0); 
            signal bNoisy      : std_logic_vector(SIG_WIDTH - 1 downto 0); 
            signal yNoisy      : std_logic_vector(SIG_WIDTH - 1 downto 0); 
			   signal wNoisy      : std_logic_vector(SIG_WIDTH - 1 downto 0); 
            signal yIntNoisy   : std_logic_vector(SIG_WIDTH - 1 downto 0); 
            signal wIntNoisy   : std_logic_vector(SIG_WIDTH - 1 downto 0); 
            signal aDec        : std_logic_vector(IT - 1 downto 0);        
            signal bDec        : std_logic_vector(IT - 1 downto 0);

			constant clk_in_period : time := 10 ns;
				
  BEGIN

        uut: turboDec PORT MAP(
            clk        => clk,                               
            rst        => rst,                        
            aNoisy     => aNoisy,
            bNoisy     => bNoisy,
            yNoisy     => yNoisy,
            wNoisy     => wNoisy,
            yIntNoisy  => yIntNoisy,
            wIntNoisy  => wIntNoisy,
            aDec       => aDec ,  
            bDec       => bDec
          );

	clk_in_process :process
    begin
	    clk <= '0';
		wait for clk_in_period/2;
		clk <= '1';
		wait for clk_in_period/2;
    end process;
	 
stim_proc: process
    begin
		rst<='1';
		wait for 20 ns;
	   rst<='0';
		wait for 20 ns;
		rst<='1';
		wait for 20 ns;
	   aNoisy <="1111";
		bNoisy <="1110";
		yNoisy <="0111";
		wNoisy <="1101";
		yIntNoisy <="1101";
		wIntNoisy <="1011";
		rst<='0';
		wait for 20 ns;
		rst<='1';
		wait for 20 ns;
	   aNoisy <="1111";
		bNoisy <="1011";
		yNoisy <="1111";
		wNoisy <="1101";
		yIntNoisy <="1101";
		wIntNoisy <="1111";
      wait;
    end process;

  END;
