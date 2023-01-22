library ieee;
use ieee.std_logic_1164.all;
use work.turbopack.all;

entity acs is   
    port    (
            clk         : in  std_logic;                       
            rst         : in  std_logic;                         
            a           : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            b           : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            y           : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            w           : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            z           : in  ARRAY4c;                            
            selStateL   : in  std_logic_vector(2 downto 0);        
            selTransL   : in  std_logic_vector(1 downto 0);        
            selState    : out std_logic_vector(2 downto 0);       
            stateDist   : out ARRAY8b;                            
            weight      : out ARRAY4a                           
            );
end acs;

architecture synth of acs is
    signal distance16   : ARRAY16a;
    signal accDist8     : ARRAY8a;
    signal accDist32    : ARRAY32c;
    signal accDistDel32 : ARRAY32c;
    signal accDistDel4  : ARRAY4a;
    signal selAccDistL  : std_logic_vector(ACC_DIST_WIDTH - 1 downto 0);
begin
    distances_i0 : distances port map   (
                                        a           => a,
                                        b           => b,
                                        y           => y,
                                        w           => w,
                                        z           => z,
                                        distance16  => distance16
                                        );
    accDist_i0 : accDist port map   (
                                    clk         => clk,
                                    rst         => rst,
                                    accDistReg  => accDist8,
                                    dist        => distance16,
                                    accDistNew  => accDist32
                                    );
    delayer_g0 : for i in 0 to 31 generate
        delayer_i : delayer generic map (
                                        delay   => TREL1_LEN - 1
                                        )
                            port map    (
                                        clk     => clk,
                                        rst     => rst,
                                        d       => accDist32(FROM2TO(i)),
                                        q       => accDistDel32(i)
                                        );
    end generate;
    mux8_i0 : mux8 port map (
                            in8x4   => accDistDel32,
                            sel     => selStateL,
                            outSel4 => accDistDel4
                            );
    mux4_i0 : mux4  port map    (
                                in1     => accDistDel4(0),
                                in2     => accDistDel4(1),
                                in3     => accDistDel4(2),
                                in4     => accDistDel4(3),
                                sel     => selTransL,
                                outSel  => selAccDistL
                                );
    subs_g : for i in 0 to 3 generate
        subs_i : subs   port map    (
                                    op1     => accDistDel4(i),
                                    op2     => selAccDistL,
                                    res     => weight(i)
                                    );
    end generate;
    accDistSel_i0 : accDistSel port map (
                                        accDist     => accDist32,
                                        accDistCod  => stateDist,
                                        accDistOut  => accDist8
                                        );
    stateSel_i0 : stateSel port map (
                                    stateDist   => accDist8,
                                    selState    => selState
                                    );
end;