library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity clock_divider is
port ( clk,reset,enable: in std_logic;
aa,ba,ca,da: inout std_logic_vector(3 downto 0):="0000");
end clock_divider;
  
architecture Behavioral of clock_divider is
  
signal temp,m,t,s1,s2: integer:=0;
signal atemp,btemp,ctemp,dtemp: std_logic_vector(3 downto 0):="0000";
begin
process(clk,reset)
begin
if(reset='1' or enable='0') then
    temp <= 0;
    m <= 0;
    t <= 0;
    s1 <= 0;
    s2 <= 0;
    aa<="0000";
    ba<="0000";
    ca<="0000";
    da<="0000";
    atemp<="0000";
    btemp<="0000";
    ctemp<="0000";
    dtemp<="0000";
END IF;
if(rising_edge(clk) and enable='1') then
    temp <= temp+1;
    if (temp = 5000000) then
    temp <= 0;
    t <= t+1;
    atemp(0) <=not aa(0);
    atemp(1) <=((aa(0) xor aa(1)) and not(aa(3)));
    atemp(2) <=(not aa(2) and aa(1) and aa(0)) or (aa(2) and not
aa(1)) or (aa(2) and aa(1) and not aa(0));
    atemp(3) <=(not aa(3) and aa(2) and aa(1) and aa(0)) or (aa(3) and not aa(2) and not aa(1)
and not aa(0));
    aa<=atemp;
        if t>=9 then
            t <= 0;
            s1 <= s1+1;
            btemp(0) <=not ba(0);
            btemp(1) <=(((ba(0) xor ba(1))) and not(ba(3)));
            btemp(2) <=(not ba(2) and ba(1) and ba(0)) or (ba(2)
and not ba(1)) or (ba(2) and ba(1) and not ba(0));
            btemp(3) <=(not ba(3) and ba(2) and ba(1) and ba(0)) or (ba(3) and not ba(2) and
not ba(1) and not ba(0));
        ba<=btemp;
            if s1>=9 then
                s1 <= 0;
                s2 <= s2+1; 
                ctemp(0) <= not ca(0);
                ctemp(1) <= ((ca(0) xor ca(1))and not(ca(2)));
                ctemp(2) <= (not ca(2) and ca(1) and ca(0)) or (ca(2) and not ca(1) and not
ca(0));
    ca<=ctemp;
                if s2>=5 then
                    s2 <= 0;
                    m<=m+1;
                    dtemp(0) <=not da(0);
                    dtemp(1) <=((da(0) xor da(1))and not(da(3)));
                    dtemp(2) <=(not da(2) and da(1) and da(0)) or (
da(2) and not da(1)) or (da(2) and da(1) and not
da(0));
                    dtemp(3) <=(not da(3) and da(2) and da(1) and da(0)) or (da(3) and not
da(2) and not da(1) and not da(0));
    da<=dtemp;

                end if;
            end if;
        end if;
    end if;
end if;
end process;
  
end Behavioral;
