  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;
  use work.turbopack.all;
  
  ENTITY tb_sova IS
  END tb_sova;

  ARCHITECTURE behavior OF tb_sova IS 

  -- Component Declaration
          COMPONENT sova
			 port    (
            clk     : in  std_logic;                           
            rst     : in  std_logic;                              
            aNoisy  : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            bNoisy  : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            yNoisy  : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            wNoisy  : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            zin     : in  ARRAY4c;                                  
            zout    : out ARRAY4c;                               
            aClean  : out std_logic;                                
            bClean  : out std_logic                                 
            );
          END COMPONENT;
				
				signal clk         : std_logic;                                
            signal rst         : std_logic;                                
            signal aNoisy      : std_logic_vector(SIG_WIDTH - 1 downto 0); 
            signal bNoisy      : std_logic_vector(SIG_WIDTH - 1 downto 0); 
            signal yNoisy      : std_logic_vector(SIG_WIDTH - 1 downto 0); 
			   signal wNoisy      : std_logic_vector(SIG_WIDTH - 1 downto 0); 
            signal zin         : ARRAY4c;
            signal zout        : ARRAY4c;
            signal aClean      : std_logic;   
            signal bClean      : std_logic;

          constant clk_in_period : time := 10 ns;

  BEGIN

  uut: sova PORT MAP(
            clk        => clk,                               
            rst        => rst,                        
            aNoisy     => aNoisy,
            bNoisy     => bNoisy,
            yNoisy     => yNoisy,
            wNoisy     => wNoisy,
            zin        => zin,
            zout       => zout,
            aClean     => aClean,  
            bClean     => bClean
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
		wait for 100 ns;
		rst<='0';
		wait for 20 ns;
		rst<='1';
		wait for 20 ns;
	   aNoisy <="1111";
		bNoisy <="1011";
		yNoisy <="1111";
		wNoisy <="1101";
      wait;
    end process;

  END;
