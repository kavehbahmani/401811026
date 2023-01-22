library ieee;
use ieee.std_logic_1164.all;
use work.turbopack.all;

entity accDist is   
    port    (
            clk         : in  std_logic;   
            rst         : in  std_logic;    
            accDistReg  : in  ARRAY8a;      
            dist        : in  ARRAY16a;     
            accDistNew  : out ARRAY32c    
            );
end accDist;

architecture synth of accDist is
    signal accDistOld   : ARRAY8a;
    signal accDistRed   : ARRAY8a;
begin
    adder_g : for i in 0 to 31 generate
        adder_i : adder port map    (
                                    op1     => accDistOld(i / 4),
                                    op2     => dist(DISTINDEX(i)),
                                    res     => accDistNew(i)
                                    );
    end generate;
    reduction_i0 : reduction    port map    (
                                            org => accDistReg,
                                            chd => accDistRed
                                            );
    reg_g : for i in 0 to 7 generate
        reg_i : reg port map    (
                                clk     => clk,
                                rst     => rst,
                                d       => accDistRed(i),
                                q       => accDistOld(i)
                                );
    end generate;
end;