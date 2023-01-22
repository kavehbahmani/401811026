library ieee;
use ieee.std_logic_1164.all;
use work.turbopack.all;

entity distances is 
    port    (
            a           : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            b           : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            y           : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            w           : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
            z           : in  ARRAY4c;                                  
            distance16  : out ARRAY16a                                 
            );
end distances;

architecture synth of distances is
    signal partDist : ARRAY16b;
begin
    partDistance_g : for i in 0 to 7 generate
        partDistance_i : partDistance generic map   (
                                                    ref => i
                                                    )
                                        port map    (
                                                    a   => a,
                                                    b   => b,
                                                    y   => y,
                                                    w   => w,
                                                    res => partDist(i)
                                                    );
    end generate;
    opposite_g : for i in 0 to 7 generate
        opposite_i : opposite port map  (
                                        pos => partDist(i),
                                        neg => partDist(15 - i)
                                        );
    end generate;
    distance_g : for i in 0 to 15 generate
        distance_i : distance port map  (
                                        partDist    => partDist(i),
                                        z           => z(i / 4),
                                        dist        => distance16(i)
                                        );
    end generate;
end;