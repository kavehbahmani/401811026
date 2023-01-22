library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.turbopack.all;

entity extInf is   
    port    (
            llr0    : in  std_logic_vector(ACC_DIST_WIDTH - 1 downto 0);    
            llr1    : in  std_logic_vector(ACC_DIST_WIDTH - 1 downto 0);    
            llr2    : in  std_logic_vector(ACC_DIST_WIDTH - 1 downto 0);    
            llr3    : in  std_logic_vector(ACC_DIST_WIDTH - 1 downto 0);    
            zin     : in  ARRAY4c;                                     
            a       : in  std_logic_vector(SIG_WIDTH - 1 downto 0);        
            b       : in  std_logic_vector(SIG_WIDTH - 1 downto 0);         
            zout    : out ARRAY4c                                          
            );
end extInf;

architecture synth of extInf is
begin
    process (llr0, llr1, llr2, llr3, zin, a, b)
        variable a_plus_b   : std_logic_vector(SIG_WIDTH - 1 downto 0);
        variable a_min_b    : std_logic_vector(SIG_WIDTH - 1 downto 0);
        variable tmp        : ARRAY7a;
        variable tmp2       : ARRAY4e;
    begin
        a_plus_b    := std_logic_vector(conv_signed(((conv_integer(signed(a)) + conv_integer(signed(b))) / 2), SIG_WIDTH));
        a_min_b     := std_logic_vector(conv_signed(((conv_integer(signed(a)) - conv_integer(signed(b))) / 2), SIG_WIDTH));
        tmp(0)      := conv_integer(unsigned(llr0)) - conv_integer(signed(a_plus_b)) - conv_integer(unsigned(zin(0)));
        tmp(1)      := conv_integer(unsigned(llr1)) - conv_integer(signed(a_min_b))  - conv_integer(unsigned(zin(1)));
        tmp(2)      := conv_integer(unsigned(llr2)) + conv_integer(signed(a_min_b))  - conv_integer(unsigned(zin(2)));
        tmp(3)      := conv_integer(unsigned(llr3)) + conv_integer(signed(a_plus_b)) - conv_integer(unsigned(zin(3)));
        if tmp(0) < tmp(1) then
            tmp(4) := tmp(0);
        else
            tmp(4) := tmp(1);
        end if;
        if tmp(2) < tmp(3) then
            tmp(5) := tmp(2);
        else
            tmp(5) := tmp(3);
        end if;
        if tmp(4) < tmp(5) then
            tmp(6) := tmp(4);
        else
            tmp(6) := tmp(5);
        end if;
        tmp2(0) := tmp(0) - tmp(6);
        tmp2(1) := tmp(1) - tmp(6);
        tmp2(2) := tmp(2) - tmp(6);
        tmp2(3) := tmp(3) - tmp(6);
        if tmp2(0) >= (2 ** Z_WIDTH) then
            zout(0) <= std_logic_vector(conv_unsigned((2 ** Z_WIDTH) - 1, Z_WIDTH));
        else
            zout(0) <= std_logic_vector(conv_unsigned(tmp2(0), Z_WIDTH));
        end if;
        if tmp2(1) >= (2 ** Z_WIDTH) then
            zout(1) <= std_logic_vector(conv_unsigned((2 ** Z_WIDTH) - 1, Z_WIDTH));
        else
            zout(1) <= std_logic_vector(conv_unsigned(tmp2(1), Z_WIDTH));
        end if;
        if tmp2(2) >= (2 ** Z_WIDTH) then
            zout(2) <= std_logic_vector(conv_unsigned((2 ** Z_WIDTH) - 1, Z_WIDTH));
        else
            zout(2) <= std_logic_vector(conv_unsigned(tmp2(2), Z_WIDTH));
        end if;
        if tmp2(3) >= (2 ** Z_WIDTH) then
            zout(3) <= std_logic_vector(conv_unsigned((2 ** Z_WIDTH) - 1, Z_WIDTH));
        else
            zout(3) <= std_logic_vector(conv_unsigned(tmp2(3), Z_WIDTH));
        end if;
    end process;
end;