library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.turbopack.all;

entity partDistance is
    generic (
            ref : integer := 0                    
            );
    port    (
            a   : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            b   : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            y   : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            w   : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            res : out std_logic_vector(SIG_WIDTH + 1 downto 0)  
            );
end partDistance;

architecture synth of partDistance is
    signal bSigned  : std_logic_vector(SIG_WIDTH - 1 downto 0);
    signal ySigned  : std_logic_vector(SIG_WIDTH - 1 downto 0);
    signal wSigned  : std_logic_vector(SIG_WIDTH - 1 downto 0);
	 signal aa : std_logic_vector(2 downto 0);

begin
	 aa <= std_logic_vector(conv_unsigned(ref, 3));
    bPos_g : if aa(2) = '0' generate
        bSigned <= b;
    end generate;
    bNeg_g : if aa(2) = '1' generate
        bSigned <= std_logic_vector(conv_signed(-conv_integer(signed(b)), SIG_WIDTH));
    end generate;
    yPos_g : if aa(1) = '0' generate
        ySigned <= y;
    end generate;
    yNeg_g : if aa(1) = '1' generate
        ySigned <= std_logic_vector(conv_signed(-conv_integer(signed(y)), SIG_WIDTH));
    end generate;
    wPos_g : if aa(0) = '0' generate
        wSigned <= w;
    end generate;
    wNeg_g : if aa(0) = '1' generate
        wSigned <= std_logic_vector(conv_signed(-conv_integer(signed(w)), SIG_WIDTH));
    end generate;
    res <= std_logic_vector(conv_signed(conv_integer(signed(a)) + conv_integer(signed(bSigned)) + conv_integer(signed(ySigned)) + conv_integer(signed(wSigned)), SIG_WIDTH + 2));
end;