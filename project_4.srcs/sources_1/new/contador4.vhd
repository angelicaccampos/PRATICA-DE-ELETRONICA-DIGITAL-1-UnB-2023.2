library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity contador4 is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           rst, clk_100mhz : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end contador4;

architecture Behavioral of contador4 is

component ff_d is
    Port ( d : in STD_LOGIC;
           clk : in STD_LOGIC;
           Nrst : in STD_LOGIC;
           q : out STD_LOGIC);
end component;

component digi_clk is
port (clk1 : in std_logic;
       clk : out std_logic
     );
end component;

signal nRst: std_logic;
signal retorno: std_logic_vector (3 downto 0);
signal clk_1hz, reset, locked, clk_in1: std_logic;

begin
clock: digi_clk port map(clk1=>clk_100mhz,clk=>clk_1hz);
flipflop1: ff_d port map(d=>D(0),clk=> clk_1hz, Nrst=>nRst, q=>retorno(0));
flipflop2: ff_d port map(d=>D(1),clk=> clk_1hz, Nrst=>nRst, q=>retorno(1));
flipflop3: ff_d port map(d=>D(2),clk=> clk_1hz, Nrst=>nRst, q=>retorno(2));
flipflop4: ff_d port map(d=>D(3),clk=> clk_1hz, Nrst=>nRst, q=>retorno(3));

process(D, rst, retorno) is
begin
    nRst<=not rst;
    Q(0)<=retorno(0);
    Q(1)<=retorno(1);
    Q(2)<=retorno(2);
    Q(3)<=retorno(3);
end process;
