library ieee;
use ieee.std_logic_1164.all;
use work.turbopack.all;

entity punct is
    port    (
            clk         : in  std_logic;                               
            rst         : in  std_logic;                               
            y           : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            w           : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            yInt        : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            wInt        : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            yPunct      : out std_logic_vector(SIG_WIDTH - 1 downto 0); 
            wPunct      : out std_logic_vector(SIG_WIDTH - 1 downto 0); 
            yIntPunct   : out std_logic_vector(SIG_WIDTH - 1 downto 0); 
            wIntPunct   : out std_logic_vector(SIG_WIDTH - 1 downto 0)  
            );
end punct;

architecture synth of punct is
    subtype cnt_t is integer range 0 to 6;
    signal pattern  : std_logic_vector(0 to 11);
    signal cntMax   : cnt_t;
    signal cnt      : cnt_t;
    signal ySel     : std_logic;
    signal wSel     : std_logic;
begin
    pattern_g13 : if RATE = 13 generate
        pattern <= "110000000000";
        cntMax  <= 1;
    end generate;
    pattern_g25 : if RATE = 25 generate
        pattern <= "111000000000";
        cntMax  <= 2;
    end generate;
    pattern_g12 : if RATE = 12 generate
        pattern <= "100000000000";
        cntMax  <= 1;
    end generate;
    pattern_g23 : if RATE = 23 generate
        pattern <= "100000000000";
        cntMax  <= 2;
    end generate;
    pattern_g34 : if RATE = 34 generate
        pattern <= "100000000000";
        cntMax  <= 3;
    end generate;
    pattern_g45 : if RATE = 45 generate
        pattern <= "100000000000";
        cntMax  <= 4;
    end generate;
    pattern_g67 : if RATE = 67 generate
        pattern <= "100000000000";
        cntMax  <= 6;
    end generate;

    process(clk, rst)
    begin
        if rst = '0' then
            ySel    <= '0';
            wSel    <= '0';
            cnt     <= 0;
        elsif clk = '1' and clk'event then
            if cnt < cntMax - 1 then
                cnt <= cnt + 1;
            else
                cnt <= 0;
            end if;
            ySel <= pattern(cnt);
            wSel <= pattern(cntMax + cnt);
        end if;
    end process;
    
    yPunct      <=  y       when ySel = '1'     else
                    (others => '0');
    wPunct      <=  w       when wSel = '1'     else
                    (others => '0');
    yIntPunct   <=  yInt    when ySel = '1'     else
                    (others => '0');
    wIntPunct   <=  wInt    when wSel = '1'     else
                    (others => '0');
end;