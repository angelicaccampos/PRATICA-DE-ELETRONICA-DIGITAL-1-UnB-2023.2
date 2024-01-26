LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


entity digi_clk is
port (clk1 : in std_logic;
       clk : out std_logic
     );
end digi_clk;

architecture Behavioral of digi_clk is

signal count : integer :=0;
signal b : std_logic :='0';
begin

 --clk generation.For 100 MHz clock this generates 1 Hz clock.
process(clk1) 
begin
if(rising_edge(clk1)) then
count <=count+1;
if(count = 50000000-1) then
b <= not b;
count <=0;

end if;
end if;
clk<=b;
end process;
end Behavioral;
