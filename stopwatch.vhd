library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity clock_divider is
port ( clk,reset,enable: IN std_logic;
a,b,c,d: INout std_logic_vector(0 to 3):="0000");
end clock_divider;
  
architecture Behavioral of clock_divider is
signal atemp,btemp,ctemp,dtemp: std_logic_vector(0 to 3);  
signal temp,m,t,s1,s2: integer:=0;
begin
process(clk,reset)
begin
if(reset='1') then
    temp <= 0;
    m <= 0;
    t <= 0;
    s1 <= 0;
    s2 <= 0;
    a<="0000";
    b<="0000";
    c<="0000";
    d<="0000";
    atemp<="0000";
    btemp<="0000";
    ctemp<="0000";
    dtemp<="0000";
end if;
if(rising_edge(clk) and enable='1') then
    temp <= temp+1;
    if (temp = 10000000) then
    temp <= 0;
    t <= t+1;
    atemp(0) <=(not a(0));
    atemp(1) <=(a(0) xor a(1));
    atemp(2) <=(not a(2) and a(1) and a(0)) or ( a(2) and not
a(1)) or (a(2) and a(1) and not a(0));
    atemp(3) <=(not a(3) and a(2) and a(1) and a(0)) or (a(3) and not a(2) and not a(1)
and not a(0));
   a<=atemp;
        if t>9 then
            t <= t-10;
            s1 <= s1+1;
            btemp(0) <=not b(0);
            btemp(1) <=(b(0) xor b(1));
            btemp(2) <=(not b(2) and b(1) and b(0)) or (b(2)
and not b(1)) or (b(2) and b(1) and not b(0));
            btemp(3) <=(not b(3) and b(2) and b(1) and b(0)) or (b(3) and not b(2) and
not b(1) and not b(0));
b<=btemp;
            if s1>9 then
                s1 <= s1-10;
                s2 <= s2+1; 
                ctemp(0) <= not c(0);
                ctemp(1) <= (c(0) xor c(1));
                ctemp(2) <= (not c(2) and c(1) and c(0)) or (c(2) and not c(1) and not
c(0));
c<=ctemp;
                if s2>5 then
                    s2 <= s2-6;
                    m<=m+1;
                    dtemp(0) <=not d(0);
                    dtemp(1) <=(d(0) xor d(1));
                    dtemp(2) <=(not d(2) and d(1) and d(0)) or (d(2) and not d(1)) or (d(2) and d(1) and not
d(0));
                    dtemp(3) <=(not d(3) and d(2) and d(1) and d(0)) or (d(3) and not
d(2) and not d(1) and not d(0));
d<=dtemp;
                end if;
            end if;
        end if;
    end if;
end if;
end process;
  
end Behavioral;
