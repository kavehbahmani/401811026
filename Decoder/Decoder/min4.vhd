library ieee;
use ieee.std_logic_1164.all;
use work.turbopack.all;

entity min4 is  
    port    (
            op1     : in  std_logic_vector; 
            op2     : in  std_logic_vector; 
            op3     : in  std_logic_vector; 
            op4     : in  std_logic_vector; 
            res1    : out std_logic;        
            res2    : out std_logic;        
            res3    : out std_logic         
            );
end min4;

architecture synth of min4 is
    signal res1_s   : std_logic;
    signal res2_s   : std_logic;
    signal op5      : std_logic_vector(ACC_DIST_WIDTH - 1 downto 0);
    signal op6      : std_logic_vector(ACC_DIST_WIDTH - 1 downto 0);
begin
    res1 <= res1_s;
    res2 <= res2_s;
    cmp2_i0 : cmp2  port map    (
                                op1     => op1,
                                op2     => op2,
                                res     => res1_s
                                );
    cmp2_i1 : cmp2  port map    (
                                op1     => op3,
                                op2     => op4,
                                res     => res2_s
                                );
    mux2_i0 : mux2  port map    (
                                in1     => op1,
                                in2     => op2,
                                sel     => res1_s,
                                outSel  => op5
                                );
    mux2_i1 : mux2  port map    (
                                in1     => op3,
                                in2     => op4,
                                sel     => res2_s,
                                outSel  => op6
                                );
    cmp2_i2 : cmp2  port map    (
                                op1     => op5,
                                op2     => op6,
                                res     => res3
                                );
end;