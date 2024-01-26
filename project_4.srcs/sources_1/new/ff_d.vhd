ibrary IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ff_d is
    Port ( d : in STD_LOGIC;
           clk : in STD_LOGIC;
           Nrst : in STD_LOGIC;
           q : out STD_LOGIC);
end ff_d;

architecture Behavioral of ff_d is
begin
    process(clk, Nrst) is
    begin
        
        if rising_edge(clk)then
            if Nrst = '0' then
                q <= '0';
            else
                q <= d;
            end if;
        end if;
    end process;
