library ieee;
use ieee.std_logic_1164.all;
use work.turbopack.all;

entity accDistSel is    
    port    (
            accDist     : in  ARRAY32c; 
            accDistCod  : out ARRAY8b;  
            accDistOut  : out ARRAY8a  
            );
end accDistSel;

architecture synth of accDistSel is
    signal comp         : std_logic_vector(23 downto 0);
    signal accDistCod_s : ARRAY8b;
begin
    accDistCod <= accDistCod_s;
    min4_g : for i in 0 to 7 generate
        min4_i : min4   port map    (
                                    op1     => accDist(FROM2TO(4 * i)),
                                    op2     => accDist(FROM2TO(4 * i + 1)),
                                    op3     => accDist(FROM2TO(4 * i + 2)),
                                    op4     => accDist(FROM2TO(4 * i + 3)),
                                    res1    => comp(3 * i),
                                    res2    => comp(3 * i + 1),
                                    res3    => comp(3 * i + 2)
                                    );
    end generate;
    cod2_g : for i in 0 to 7 generate
        cod2_i : cod2   port map    (
                                    in1     => comp(3 * i),
                                    in2     => comp(3 * i + 1),
                                    in3     => comp(3 * i + 2),
                                    outCod  => accDistCod_s(i)
                                    );
    end generate;
    mux4_g : for i in 0 to 7 generate
        mux4_i : mux4   port map    (
                                    in1     => accDist(FROM2TO(4 * i)),
                                    in2     => accDist(FROM2TO(4 * i + 1)),
                                    in3     => accDist(FROM2TO(4 * i + 2)),
                                    in4     => accDist(FROM2TO(4 * i + 3)),
                                    sel     => accDistCod_s(i),
                                    outSel  => accDistOut(i)
                                    );
    end generate;
end;