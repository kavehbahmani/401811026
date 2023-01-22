library ieee;
use ieee.std_logic_1164.all;
use work.turbopack.all;

entity turboDec is
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
end turboDec;

architecture synth of turboDec is
    signal flipflop : std_logic;
    signal aLim     : ARRAY_ITa;
    signal bLim     : ARRAY_ITa;
    signal yLim     : ARRAY_ITa;
    signal wLim     : ARRAY_ITa;
    signal yIntLim  : ARRAY_ITa;
    signal wIntLim  : ARRAY_ITa;
    signal z        : ARRAY_ITb;
    signal yFull    : std_logic_vector(SIG_WIDTH - 1 downto 0);
    signal wFull    : std_logic_vector(SIG_WIDTH - 1 downto 0);
    signal yIntFull : std_logic_vector(SIG_WIDTH - 1 downto 0);
    signal wIntFull : std_logic_vector(SIG_WIDTH - 1 downto 0);
begin
    limiter_i0 : limiter    port map    (
                                        a       => aNoisy,
                                        b       => bNoisy,
                                        y       => yNoisy,
                                        w       => wNoisy,
                                        yInt    => yIntNoisy,
                                        wInt    => wIntNoisy,
                                        aLim    => aLim(0),
                                        bLim    => bLim(0),
                                        yLim    => yFull,
                                        wLim    => wFull,
                                        yIntLim => yIntFull,
                                        wIntLim => wIntFull
                                        );
    
    punct_i0 : punct    port map    (
                                    clk         => clk,
                                    rst         => rst,
                                    y           => yFull,
                                    w           => wFull,
                                    yInt        => yIntFull,
                                    wInt        => wIntFull,
                                    yPunct      => yLim(0),
                                    wPunct      => wLim(0),
                                    yIntPunct   => yIntLim(0),
                                    wIntPunct   => wIntLim(0)
                                    );
    clkDiv_i0 : clkDiv  port map    (
                                    clk     => clk,
                                    rst     => rst,
                                    clkout  => flipflop
                                    );
    
    z(0) <= ((others => '0'), (others => '0'), (others => '0'), (others => '0'));
    
    iteration_g : for i in 0 to (IT - 1) generate
        iteration_i : iteration generic map (
                                            delay       => 2 * i * (TREL1_LEN + TREL2_LEN + 2) + 2 * i * FRSIZE + 2
                                            )
                                port map    (
                                            clk         => clk,
                                            rst         => rst,
                                            flipflop    => flipflop,
                                            a           => aLim(i),
                                            b           => bLim(i),
                                            y           => yLim(i),
                                            w           => wLim(i),
                                            yInt        => yIntLim(i),
                                            wInt        => wIntLim(i),
                                            zin         => z(i),
                                            zout        => z(i + 1),
                                            aDec        => aDec(i),
                                            bDec        => bDec(i),
                                            aDel        => aLim(i + 1),
                                            bDel        => bLim(i + 1),
                                            yDel        => yLim(i + 1),
                                            wDel        => wLim(i + 1),
                                            yIntDel     => yIntLim(i + 1),
                                            wIntDel     => wIntLim(i + 1)
            );
    end generate;
end;