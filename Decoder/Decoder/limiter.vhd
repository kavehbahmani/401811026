library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.turbopack.all;

entity limiter is
    port    (
            a       : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            b       : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            y       : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            w       : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            yInt    : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            wInt    : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            aLim    : out std_logic_vector(SIG_WIDTH - 1 downto 0); 
            bLim    : out std_logic_vector(SIG_WIDTH - 1 downto 0); 
            yLim    : out std_logic_vector(SIG_WIDTH - 1 downto 0); 
            wLim    : out std_logic_vector(SIG_WIDTH - 1 downto 0); 
            yIntLim : out std_logic_vector(SIG_WIDTH - 1 downto 0); 
            wIntLim : out std_logic_vector(SIG_WIDTH - 1 downto 0)  
            );
end limiter;

architecture synth of limiter is
begin
    aLim    <=  std_logic_vector(conv_signed(-2**(SIG_WIDTH - 1) + 1, SIG_WIDTH))   when conv_integer(unsigned(a)) <= -2**(SIG_WIDTH - 1)   else
                std_logic_vector(conv_signed(2**(SIG_WIDTH - 1) - 1, SIG_WIDTH))    when conv_integer(unsigned(a)) >= 2**(SIG_WIDTH - 1)    else
                a;
    bLim    <=  std_logic_vector(conv_signed(-2**(SIG_WIDTH - 1) + 1, SIG_WIDTH))   when conv_integer(unsigned(b)) <= -2**(SIG_WIDTH - 1)   else
                std_logic_vector(conv_signed(2**(SIG_WIDTH - 1) - 1, SIG_WIDTH))    when conv_integer(unsigned(b)) >= 2**(SIG_WIDTH - 1)    else
                b;
    yLim    <=  std_logic_vector(conv_signed(-2**(SIG_WIDTH - 1) + 1, SIG_WIDTH))   when conv_integer(unsigned(y)) <= -2**(SIG_WIDTH - 1)   else
                std_logic_vector(conv_signed(2**(SIG_WIDTH - 1) - 1, SIG_WIDTH))    when conv_integer(unsigned(y)) >= 2**(SIG_WIDTH - 1)    else
                y;
    wLim    <=  std_logic_vector(conv_signed(-2**(SIG_WIDTH - 1) + 1, SIG_WIDTH))   when conv_integer(unsigned(w)) <= -2**(SIG_WIDTH - 1)   else
                std_logic_vector(conv_signed(2**(SIG_WIDTH - 1) - 1, SIG_WIDTH))    when conv_integer(unsigned(w)) >= 2**(SIG_WIDTH - 1)    else
                w;
    yIntLim <=  std_logic_vector(conv_signed(-2**(SIG_WIDTH - 1) + 1, SIG_WIDTH))   when conv_integer(unsigned(yInt)) <= -2**(SIG_WIDTH - 1) else
                std_logic_vector(conv_signed(2**(SIG_WIDTH - 1) - 1, SIG_WIDTH))    when conv_integer(unsigned(yInt)) >= 2**(SIG_WIDTH - 1) else
                yInt;
    wIntLim <=  std_logic_vector(conv_signed(-2**(SIG_WIDTH - 1) + 1, SIG_WIDTH))   when conv_integer(unsigned(wInt)) <= -2**(SIG_WIDTH - 1) else
                std_logic_vector(conv_signed(2**(SIG_WIDTH - 1) - 1, SIG_WIDTH))    when conv_integer(unsigned(wInt)) >= 2**(SIG_WIDTH - 1) else
                wInt;
end;