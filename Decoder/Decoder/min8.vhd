library ieee;
use ieee.std_logic_1164.all;
use work.turbopack.all;

entity min8 is  
    port    (
            op  : in  ARRAY8a;                     
            res : out std_logic_vector(6 downto 0) 
            );
end min8;

architecture synth of min8 is
    signal tmp      : ARRAY6a;
    signal res_s    : std_logic_vector(6 downto 0);
begin
    res <= res_s;
    cmp2_i0 : cmp2  port map    (
                                op1     => op(0),
                                op2     => op(1),
                                res     => res_s(0)
                                );
    cmp2_i1 : cmp2  port map    (
                                op1     => op(2),
                                op2     => op(3),
                                res     => res_s(1)
                                );
    cmp2_i2 : cmp2  port map    (
                                op1     => op(4),
                                op2     => op(5),
                                res     => res_s(2)
                                );
    cmp2_i3 : cmp2  port map    (
                                op1     => op(6),
                                op2     => op(7),
                                res     => res_s(3)
                                );
    mux2_i0 : mux2  port map    (
                                in1     => op(0),
                                in2     => op(1),
                                sel     => res_s(0),
                                outSel  => tmp(0)
                                );
    mux2_i1 : mux2  port map    (
                                in1     => op(2),
                                in2     => op(3),
                                sel     => res_s(1),
                                outSel  => tmp(1)
                                );
    mux2_i2 : mux2  port map    (
                                in1     => op(4),
                                in2     => op(5),
                                sel     => res_s(2),
                                outSel  => tmp(2)
                                );
    mux2_i3 : mux2  port map    (
                                in1     => op(6),
                                in2     => op(7),
                                sel     => res_s(3),
                                outSel  => tmp(3)
                                );
    cmp2_i4 : cmp2  port map    (
                                op1     => tmp(0),
                                op2     => tmp(1),
                                res     => res_s(4)
                                );
    cmp2_i5 : cmp2  port map    (
                                op1     => tmp(2),
                                op2     => tmp(3),
                                res     => res_s(5)
                                );
    mux2_i4 : mux2  port map    (
                                in1     => tmp(0),
                                in2     => tmp(1),
                                sel     => res_s(4),
                                outSel  => tmp(4)
                                );
    mux2_i5 : mux2  port map    (
                                in1     => tmp(2),
                                in2     => tmp(3),
                                sel     => res_s(5),
                                outSel  => tmp(5)
                                );
    cmp2_i6 : cmp2  port map    (
                                op1     => tmp(4),
                                op2     => tmp(5),
                                res     => res_s(6)
                                );
end;