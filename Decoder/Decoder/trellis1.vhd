library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.turbopack.all;

entity trellis1 is  
    port    (
            clk         : in  std_logic;                    
            rst         : in  std_logic;                  
            selState    : in  std_logic_vector(2 downto 0); 
            selTrans    : in  ARRAY8b;                     
            selStateL2  : out std_logic_vector(2 downto 0); 
            selStateL1  : out std_logic_vector(2 downto 0); 
            stateL1     : out ARRAY4d;                     
            selTransL2  : out std_logic_vector(1 downto 0)  
            );
end trellis1;

architecture synth of trellis1 is
    signal pathIdReg    : ARRAY8d;
    signal reg          : ARRAY_TREL1_LENx8;
begin
    process (clk, rst)
        variable free       : std_logic_vector(7 downto 0);
        variable freeBeg    : std_logic_vector(7 downto 0);
        variable pastState  : ARRAY8d;
        variable pathId     : ARRAY8d;
        variable current_state  : INT3BIT;
        variable freePathId : INT3BIT;
        variable state_l3   : INT2BIT;
        variable state_l2   : INT2BIT;
        variable state_l1   : INT2BIT;
        variable outState_l2    : std_logic_vector(2 downto 0);
        variable outState_l1    : std_logic_vector(2 downto 0);
		  variable zz, yy, xx, dd : std_logic_vector(1 downto 0);
    begin
        if rst = '0' then
            for i in 0 to 3 loop
                stateL1(i) <= (others => '0');
            end loop;
            selStateL1 <= (others => '0');
            selStateL2 <= (others => '0');
            selTransL2 <= (others => '0');
            for i in 0 to 7 loop
                pathIdReg(i) <= 0;
                for j in 0 to TREL1_LEN - 1 loop
                    reg(j * 8 + i) <= 0;
                end loop;
            end loop;
        elsif clk = '1' and clk'event then
            free := "11111111";
            for i in 0 to 7 loop
                pastState(i) := TRANS2STATE(i * 4 + conv_integer(unsigned(selTrans(i))));
                pathId(i) := pathIdReg(pastState(i));
                free(pathId(i)) := '0';
            end loop;
            freeBeg := "11111111";
            for i in 0 to 7 loop
                current_state   := i;
                if freeBeg(pathId(current_state)) = '1' then
							zz := std_logic_vector(conv_unsigned(current_state, 3));
                    reg(pathId(current_state)) <= conv_integer(unsigned(zz(1 downto 0)));
                    freeBeg(pathId(i)) := '0';
                    pathIdReg(current_state) <= pathId(current_state);
                    for j in 0 to TREL1_LEN - 2 loop
                        reg((j + 1) * 8 + pathId(current_state)) <= reg(j * 8 + pathId(current_state));
                    end loop;
                else
                    if free(0) = '1' then
                        freePathId := 0;
                    end if;
                    if free(1 downto 0) = "10" then
                        freePathId := 1;
                    end if;
                    if free(2 downto 0) = "100" then
                        freePathId := 2;
                    end if;
                    if free(3 downto 0) = "1000" then
                        freePathId := 3;
                    end if;
                    if free(4 downto 0) = "10000" then
                        freePathId := 4;
                    end if;
                    if free(5 downto 0) = "100000" then
                        freePathId := 5;
                    end if;
                    if free(6 downto 0) = "1000000" then
                        freePathId := 6;
                    end if;
                    if free(7 downto 0) = "10000000" then
                        freePathId := 7;
                    end if;
                    reg(freePathId) <= conv_integer(unsigned(zz(1 downto 0)));
                    free(freePathId) := '0';
                    pathIdReg(current_state) <= freePathId;
                    for j in 0 to TREL1_LEN - 2 loop
                        reg((j + 1) * 8 + freePathId) <= reg(j * 8 + pathId(current_state));
                    end loop;
                end if;
            end loop;
            state_l3 := reg((TREL1_LEN - 3) * 8 + pathId(conv_integer(unsigned(selState))));
            state_l2 := reg((TREL1_LEN - 2) * 8 + pathId(conv_integer(unsigned(selState))));
            state_l1 := reg((TREL1_LEN - 1) * 8 + pathId(conv_integer(unsigned(selState))));
				yy := std_logic_vector(conv_unsigned(state_l3, 2));
				xx := std_logic_vector(conv_unsigned(state_l2, 2));
				dd := std_logic_vector(conv_unsigned(state_l1, 2));
            outState_l2(2) := yy(1) xor (yy(0) xor xx(1));
            outState_l2(1 downto 0) := xx;
            outState_l1(2) := xx(1) xor (xx(0) xor dd(1));
            outState_l1(1 downto 0) := dd;
            selStateL1 <= outState_l1;
            selStateL2 <= outState_l2;
            selTransL2 <= std_logic_vector(conv_unsigned(STATE2TRANS(conv_integer(unsigned(outState_l2)) * 4 + state_l1), 2));
            for i in 0 to 3 loop
                stateL1(i) <= std_logic_vector(conv_unsigned(TRANS2STATE(conv_integer(unsigned(outState_l2)) * 4 + i), 3));
            end loop;
        end if;
    end process;
end;