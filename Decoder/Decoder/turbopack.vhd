library ieee;
use ieee.std_logic_1164.all;

package turbopack is
    constant RATE           : integer := 12;    
    constant IT             : integer := 5;     
    constant FRSIZE         : integer := 64;    
    constant TREL1_LEN      : integer := 24;    
    constant TREL2_LEN      : integer := 12;    
    constant SIG_WIDTH      : integer := 4;     
    constant Z_WIDTH        : integer := 5;     
    constant ACC_DIST_WIDTH : integer := 9;     
    subtype INT2BIT         is integer range 0 to 3;
    subtype INT3BIT         is integer range 0 to 7;
    subtype SUBINT0         is integer range -(2**(SIG_WIDTH-1)) - (2**Z_WIDTH) to 2**ACC_DIST_WIDTH + 2**(SIG_WIDTH-1) - 1;
    subtype SUBINT1         is integer range 0 to 2**ACC_DIST_WIDTH + 2**(SIG_WIDTH-1) + 2**(SIG_WIDTH-1) + 2**Z_WIDTH - 1;
    type ARRAY32a           is array (0 to 31)  of integer;
    type ARRAY32b           is array (0 to 31)  of std_logic_vector(ACC_DIST_WIDTH downto 0);
    type ARRAY32c           is array (0 to 31)  of std_logic_vector(ACC_DIST_WIDTH - 1 downto 0);
    constant FROM2TO        : ARRAY32a := (0, 25,  6, 31,  8, 17, 14, 23, 20, 13, 18, 11, 28,  5, 26,  3,  4, 29,  2, 27, 12, 21, 10, 19, 16,  9, 22, 15, 24,  1, 30,  7);
    constant DISTINDEX      : ARRAY32a := (0,  7, 11, 12,  0,  7, 11, 12,  2,  5,  9, 14,  2,  5,  9, 14,  3,  4,  8, 15,  3,  4,  8, 15,  1,  6, 10, 13,  1,  6, 10, 13);
    constant TRANS2STATE    : ARRAY32a := (0,  6,  1,  7,  2,  4,  3,  5,  5,  3,  4,  2,  7,  1,  6,  0,  1,  7,  0,  6,  3,  5,  2,  4,  4,  2,  5,  3,  6,  0,  7,  1);
    constant STATE2TRANS    : ARRAY32a := (0,  2,  1,  3,  1,  3,  0,  2,  2,  0,  3,  1,  3,  1,  2,  0,  2,  0,  3,  1,  3,  1,  2,  0,  0,  2,  1,  3,  1,  3,  0,  2);
    type ARRAY2a            is array (0 to 1)   of std_logic_vector(SIG_WIDTH - 1 downto 0);
    type ARRAY3a            is array (0 to 2)   of std_logic_vector(ACC_DIST_WIDTH - 1 downto 0);
    type ARRAY4a            is array (0 to 3)   of std_logic_vector(ACC_DIST_WIDTH - 1 downto 0);
    type ARRAY4b            is array (0 to 3)   of std_logic_vector(ACC_DIST_WIDTH downto 0);
    type ARRAY4c            is array (0 to 3)   of std_logic_vector(Z_WIDTH - 1 downto 0);
    type ARRAY4d            is array (0 to 3)   of std_logic_vector(2 downto 0);
    type ARRAY4e            is array (0 to 3)   of SUBINT1;
    type ARRAY6a            is array (0 to 5)   of std_logic_vector(ACC_DIST_WIDTH - 1 downto 0);
    type ARRAY6b            is array (0 to 5)   of INT2BIT;
    type ARRAY7a            is array (0 to 6)   of SUBINT0;
    type ARRAY8a            is array (0 to 7)   of std_logic_vector(ACC_DIST_WIDTH - 1 downto 0);
    type ARRAY8b            is array (0 to 7)   of std_logic_vector(1 downto 0);
    type ARRAY8d            is array (0 to 7)   of INT3BIT;
    type ARRAY16a           is array (0 to 15)  of std_logic_vector(ACC_DIST_WIDTH - 1 downto 0);
    type ARRAY16b           is array (0 to 15)  of std_logic_vector(SIG_WIDTH + 1 downto 0);
    type ARRAY_TREL1_LENx8  is array (0 to TREL1_LEN * 8 - 1) of INT2BIT;
    type ARRAY_TREL2_LENx8  is array (0 to TREL2_LEN * 8 - 1) of std_logic_vector(1 downto 0);
    type ARRAY_4xTREL2_LEN  is array (0 to 4 * TREL2_LEN - 1) of std_logic_vector(ACC_DIST_WIDTH - 1 downto 0);
    type ARRAY_ITa          is array (0 to IT) of std_logic_vector(SIG_WIDTH - 1 downto 0);
    type ARRAY_ITb          is array (0 to IT) of ARRAY4c;
    
    component delayer
        generic (
                delay   : integer := 1          
                );
        port    (
                clk     : in  std_logic;       
                rst     : in  std_logic;        
                d       : in  std_logic_vector; 
                q       : out std_logic_vector  
                );
    end component;
    
    component subs
        port    (
                op1     : in  std_logic_vector; 
                op2     : in  std_logic_vector; 
                res     : out std_logic_vector  
                );
    end component;
    
    component mux4
        port    (
                in1     : in  std_logic_vector;             
                in2     : in  std_logic_vector;             
                in3     : in  std_logic_vector;             
                in4     : in  std_logic_vector;             
                sel     : in  std_logic_vector(1 downto 0); 
                outSel  : out std_logic_vector              
                );
    end component;
    
    component mux8
        port    (
                in8x4   : in  ARRAY32c; 
                sel     : in  std_logic_vector(2 downto 0); 
                outSel4 : out ARRAY4a   
                );
    end component;
    
    component distances
        port    (
                a           : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
                b           : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
                y           : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
                w           : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
                z           : in  ARRAY4c;                                  
                distance16  : out ARRAY16a                                  
                );
    end component;
    
    component partDistance
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
    end component;

    component opposite
        port    (
                pos : in  std_logic_vector(SIG_WIDTH + 1 downto 0); 
                neg : out std_logic_vector(SIG_WIDTH + 1 downto 0)  
                );
    end component;

    component distance
        port    (
                partDist    : in  std_logic_vector(SIG_WIDTH + 1 downto 0);     
                z           : in  std_logic_vector(Z_WIDTH - 1 downto 0);       
                dist        : out std_logic_vector(ACC_DIST_WIDTH - 1 downto 0) 
                );
    end component;
    
    component reg
        port    (
                clk     : in  std_logic;        
                rst     : in  std_logic;        
                d       : in  std_logic_vector; 
                q       : out std_logic_vector  
                );
    end component;
    
    component adder
        port    (
                op1     : in  std_logic_vector; 
                op2     : in  std_logic_vector; 
                res     : out std_logic_vector  
                );
    end component;
    
    component reduction
        port    (
                org : in  ARRAY8a;  
                chd : out ARRAY8a   
                );
    end component;
    
    component accDist
        port    (
                clk         : in  std_logic;    
                rst         : in  std_logic;    
                accDistReg  : in  ARRAY8a;      
                dist        : in  ARRAY16a;     
                accDistNew  : out ARRAY32c      
                );
    end component;
    
    component cmp2
        port    (
                op1     : in  std_logic_vector; 
                op2     : in  std_logic_vector; 
                res     : out std_logic        
                );
    end component;
    
    component mux2
        port    (
                in1     : in  std_logic_vector; 
                in2     : in  std_logic_vector; 
                sel     : in  std_logic;        
                outSel  : out std_logic_vector  
                );
    end component;
    
    component min4
        port    (
                op1     : in  std_logic_vector; 
                op2     : in  std_logic_vector; 
                op3     : in  std_logic_vector; 
                op4     : in  std_logic_vector; 
                res1    : out std_logic;        
                res2    : out std_logic;        
                res3    : out std_logic         
                );
    end component;
    
    component accDistSel
        port    (
                accDist     : in  ARRAY32c; 
                accDistCod  : out ARRAY8b;  
                accDistOut  : out ARRAY8a   
                );
    end component;
    
    component cod2
        port    (
                in1     : in  std_logic;                    
                in2     : in  std_logic;                    
                in3     : in  std_logic;                  
                outCod  : out std_logic_vector(1 downto 0)
                );
    end component;
    
    component min8
        port    (
                op  : in  ARRAY8a;                      
                res : out std_logic_vector(6 downto 0)  
                );
    end component;
    
    component cod3
        port    (
                inSig   : in  std_logic_vector(6 downto 0);
                outCod  : out std_logic_vector(2 downto 0)  
                );
    end component;
    
    component stateSel
        port    (
                stateDist   : in ARRAY8a;                       
                selState    : out std_logic_vector(2 downto 0)  
                );
    end component;
    
    component acs
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
    end component;
    
    component trellis1
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
    end component;
    
    component trellis2
        port    (
                clk         : in  std_logic;                    
                rst         : in  std_logic;                    
                selState    : in  std_logic_vector(2 downto 0); 
                state       : in  ARRAY4d;                      
                selTrans    : in  ARRAY8b;                      
                weight      : in  ARRAY4a;                      
                llr0        : out std_logic_vector(ACC_DIST_WIDTH - 1 downto 0);   
                llr1        : out std_logic_vector(ACC_DIST_WIDTH - 1 downto 0);   
                llr2        : out std_logic_vector(ACC_DIST_WIDTH - 1 downto 0);    
                llr3        : out std_logic_vector(ACC_DIST_WIDTH - 1 downto 0);    
                a           : out std_logic;                    
                b           : out std_logic                    
                );
    end component;
    
    component extInf
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
    end component;
    
    component sova
        port    (
                clk     : in  std_logic;                                
                rst     : in  std_logic;                                
                aNoisy  : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
                bNoisy  : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
                yNoisy  : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
                wNoisy  : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
                zin     : in  ARRAY4c;                                  
                zout    : out ARRAY4c;                                 
                aClean  : out std_logic;                                
                bClean  : out std_logic                                 
                );
    end component;
    
    component zPermut
        generic (
                flip        : integer := 0      
                );
        port    (
                flipflop    : in  std_logic;   
                z           : in  ARRAY4c;      
                zPerm       : out ARRAY4c       
                );
    end component;
    
    component interleaver
        generic (
                delay       : integer := 0;     
                way         : integer := 0     
                );
        port    (
                clk         : in  std_logic;        
                rst         : in  std_logic;        
                d           : in  std_logic_vector; 
                q           : out std_logic_vector  
                );
    end component;
    
    component abPermut
        generic (
                flip        : integer := 0                                  
                );
        port    (
                flipflop    : in  std_logic;                               
                a           : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
                b           : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
                abPerm      : out ARRAY2a                                   
                );
    end component;
    
    component iteration
        generic (
                delay       : integer := 0                                  
                );
        port    (
                clk         : in  std_logic;                                
                rst         : in  std_logic;                                
                flipflop    : in  std_logic;                               
                a           : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
                b           : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
                y           : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
                w           : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
                yInt        : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
                wInt        : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
                zin         : in  ARRAY4c;                                  
                zout        : out ARRAY4c;                                  
                aDec        : out std_logic;                                
                bDec        : out std_logic;                                
                aDel        : out std_logic_vector(SIG_WIDTH - 1 downto 0); 
                bDel        : out std_logic_vector(SIG_WIDTH - 1 downto 0); 
                yDel        : out std_logic_vector(SIG_WIDTH - 1 downto 0); 
                wDel        : out std_logic_vector(SIG_WIDTH - 1 downto 0); 
                yIntDel     : out std_logic_vector(SIG_WIDTH - 1 downto 0); 
                wIntDel     : out std_logic_vector(SIG_WIDTH - 1 downto 0)  
                );
    end component;
    
    component clkDiv
        port    (
                clk     : in  std_logic;    
                rst     : in  std_logic;    
                clkout  : out std_logic      
                );
    end component;
    
    component limiter
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
    end component;
    
    component punct
        port    (
                clk         : in  std_logic;                                
                rst         : in  std_logic;                                
                y           : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
                w           : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
                yInt        : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
                wInt        : in  std_logic_vector(SIG_WIDTH - 1 downto 0); 
                yPunct      : out std_logic_vector(SIG_WIDTH - 1 downto 0); 
                wPunct      : out std_logic_vector(SIG_WIDTH - 1 downto 0); 
                yIntPunct   : out std_logic_vector(SIG_WIDTH - 1 downto 0); 
                wIntPunct   : out std_logic_vector(SIG_WIDTH - 1 downto 0)  
                );
    end component;
	 end;