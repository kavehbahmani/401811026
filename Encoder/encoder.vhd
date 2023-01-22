library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity encoder is
    Port (data_in : in  STD_LOGIC_VECTOR (7 downto 0);
		    clk_in : in std_logic;
			reset : in std_logic;
            data_out : out  STD_LOGIC);
end encoder;

architecture Behavioral of encoder is

COMPONENT mux8t1
    PORT (data_in : in  STD_LOGIC_VECTOR (7 downto 0);
	    reset : in std_logic;
        clk : in  STD_LOGIC;
        data_out : out  STD_LOGIC);
END COMPONENT;

COMPONENT mux3t1
    PORT (clk : in  STD_LOGIC;
        v0 : in  STD_LOGIC;
        v1 : in  STD_LOGIC;
        v2 : in  STD_LOGIC;
		reset : in std_logic;
        vout : out  STD_LOGIC);
END COMPONENT;

COMPONENT interleaver
    PORT (data_in : in  STD_LOGIC_VECTOR (7 downto 0);
        data_out : out  STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

COMPONENT RSC
    PORT (data_in : in  STD_LOGIC;
        data_out : out  STD_LOGIC;
        clk : in  STD_LOGIC);
END COMPONENT;

COMPONENT freq_divider3t1
    PORT (
		clk_in : in  STD_LOGIC;
        clk_out : out  STD_LOGIC);
END COMPONENT;

signal clk_out : std_logic:='0';
signal w : std_logic_vector(4 downto 1);
signal v : std_logic_vector(7 downto 0);

begin

f1: freq_divider3t1 port map (clk_in,clk_out);
m1: mux8t1 port map (data_in,reset,clk_out,w(1));
m2: mux8t1 port map (v,reset,clk_out,w(3));
i1: interleaver port map (data_in,v);
r1: RSC port map (w(1),w(2),clk_out);
r2: RSC port map (w(3),w(4),clk_out);
m3: mux3t1 port map (clk_in,w(1),w(2),w(4),reset,data_out);

end Behavioral;