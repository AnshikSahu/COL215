library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_gate is
port(
    a : in std_logic_vector(3 downto 0);
    b : in std_logic_vector(3 downto 0);
    c : in std_logic_vector(3 downto 0);
    d : in std_logic_vector(3 downto 0);
    s0,s1: in STD_LOGIC;
    dp: out std_logic;
    o: out std_logic_vector(3 downto 0));
end mux_gate;

architecture Behavioral of mux_gate is
component clock_modified
port(
    clk: IN std_logic;
    ts0,ts1: out STD_LOGIC);
end component;

begin
    ---x: clock_modified port map(clk=> clk, ts0=>s0, ts1=>s1);
    dp <= (s1 and not(s0)) or (not(s0)) ;
    o(0)<=(not(s0) and not(s1) and a(0)) or (s0 and not(s1) and b(0)) or (not(s0) and s1 and c(0)) or (s0 and s1 and d(0));
    o(1)<=(not(s0) and not(s1) and a(1)) or (s0 and not(s1) and b(1)) or (not(s0) and s1 and c(1)) or (s0 and s1 and d(1));
    o(2)<=(not(s0) and not(s1) and a(2)) or (s0 and not(s1) and b(2)) or (not(s0) and s1 and c(2)) or (s0 and s1 and d(2));
    o(3)<=(not(s0) and not(s1) and a(3)) or (s0 and not(s1) and b(3)) or (not(s0) and s1 and c(3)) or (s0 and s1 and d(3));
end Behavioral;
