library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity seven_display_gate is
port(
    a: in std_logic_vector(3 downto 0);
---    dp: out std_logic_vector;
    q: out std_logic_vector(6 downto 0));
end seven_display_gate;

architecture Behavioral of seven_display_gate is
signal na : std_logic_vector(3 downto 0);
begin
---x : mux_gate port map(a=>a,b=>b,c=>c,d=>d,s0=>s0,s1=>s1,o =>a);
na<= not a;
    q(6)<=(na(3) and na(2) and na(1) and a(0)) or (na(3) and a(2) and na(1) and na(0)) or (a(3) and na(2) and a(1) and a(0)) or (a(3) and a(2) and na(1) and a(0));
    q(5)<=(a(2) and a(1) and na(0)) or (a(3) and a(1) and a(0)) or (a(3) and a(2) and na(0)) or (na(3) and a(2) and (na(1) and a(0)));  
    q(4)<=(a(3) and a(2) and na(0)) or (a(3) and a(2) and a(1)) or (na(3) and na(2) and a(1) and na(0)) ;
    q(3)<=( a(2) and a(1) and a(0)) or (na(3) and na(2) and na(1) and a(0)) or (na(3) and a(2) and na(1) and na(0)) or (a(3) and na(2) and a(1) and na(0)) ;
    q(2)<=(na(3) and a(0)) or ( na(2) and na(1) and a(0)) or (na(3) and a(2) and na(1) ) ;
    q(1)<= (na(3) and na(2) and a(0)) or (na(3) and na(2) and a(1) ) or (a(3) and a(2) and na(1) and a(0)) ;
    q(0)<=(na(3) and na(2) and na(1) ) or(na(3) and a(2) and a(1) and a(0)) or(a(3) and a(2) and na(1) and na(0)) ; 
end Behavioral;
