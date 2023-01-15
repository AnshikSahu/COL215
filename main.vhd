library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity main is
  Port (clk : in std_logic ;
  q: out std_logic_vector(6 downto 0);
  dp: out std_logic;
  a: IN std_logic_vector(2 downto 0);
  reset: IN std_logic;
  an : out std_logic_vector(3 downto 0));
end main;

architecture Behavioral of main is
component mux_gate is
port(

    a : in std_logic_vector(3 downto 0);
    b : in std_logic_vector(3 downto 0);
    c : in std_logic_vector(3 downto 0);
    d : in std_logic_vector(3 downto 0);
    s0,s1: in STD_LOGIC;
      dp: out std_logic;
    o: out std_logic_vector(3 downto 0));
end component;
component seven_display_gate is
port(
    a: in std_logic_vector(3 downto 0);
    q: out std_logic_vector(6 downto 0));
end component;
component clock_modified is
port(
    clk: IN std_logic;
    ts0,ts1: out STD_LOGIC;
    an: out std_logic_vector(3 downto 0));
end component;
component clock_divider is
port(
    clk,reset,enable: IN std_logic;
aa,ba,ca,da: INout std_logic_vector(3 downto 0):="0000");
end component;
signal ts0,ts1:  STD_LOGIC;
signal x:  std_logic_vector(3 downto 0);
signal y,z,w,r:std_logic_vector(3 downto 0);
signal i,j,k: std_logic:='0';
signal m:std_logic:='0';
signal enable_watch: std_logic:='0';      
begin
process(a(0))
begin
---if a(0) <='0' then
---i<='0';
---end if;
    if rising_edge(a(0)) then
    i<='1';
    end if;
end process;
process(a(1))
begin    
---if a(1) <='0' then
---j<='0';
---end if;
    if rising_edge(a(1)) then
    j<='1';
    end if;
end process;
process(a(2))
begin
    if rising_edge(a(2)) then
    k<='1';

end if ;
end process;

enable_watch<= ((i and j and k) or (i and not(j) and not(k)));

UUT1 : clock_modified port map(clk=> clk, ts0=>ts0,ts1=>ts1,an=>an);
UUT4 : clock_divider port map(clk=> clk,reset=>reset,enable=>enable_watch,aa=>y,ba=>z,ca=>w,da=>r);
UUT2 : mux_gate port map(a=>y,b=>z,c=>w,d=>r,s0=>ts0,s1=>ts1,dp=>dp,o=>x);
UUT3 : seven_display_gate port map(a=>x,q=>q);
end Behavioral;
