library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_modified is
port(
    clk: IN std_logic;
    ts0,ts1: out STD_LOGIC;
    an: out std_logic_vector(3 downto 0));
end clock_modified;

architecture Behavioral of clock_modified is
    signal t:STD_LOGIC;
begin
    process(clk)
        variable count: integer:=0;
    begin
        if falling_edge(clk) then
            count:=count+1;
       if count=400000 then
            ts0<='0';
            ts1<='0';
            an(0)<='0';
            an(1)<='1';
            an(2)<='1';
            an(3)<='1';            
        elsif count=800000 then
            ---t<=not(t);
            ts0<='1';
            ts1<='0';
            an(0)<='1';
            an(1)<='0';
            an(2)<='1';
            an(3)<='1';
        elsif count=1200000 then
            ts0<='0';
            ts1<='1';
            an(0)<='1';
            an(1)<='1';
            an(2)<='0';
            an(3)<='1';
        elsif count=1600000 then 
            ts0<='1';
            ts1<='1';
            an(0)<='1';
            an(1)<='1';
            an(2)<='1';
            an(3)<='0';
            count:=0;
            end if;
       end if;
end process;
end Behavioral;