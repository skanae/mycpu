library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity count_16 is
    port
	(
		CLK 		  : in std_logic;
		RST 	      : in std_logic;
        COUNT_16      : out std_logic_vector(15 downto 0)
    );
end count_16;

architecture RTL of count_16 is

component count_nbit
        generic(
            N_BIT : integer := 8
        );
        port
        (
            CLK 		  : in std_logic;
            RST 	      : in std_logic;
            COUNT_N       : out std_logic_vector(N_BIT-1 downto 0)
        );
end component;

begin 
    C1 : count_nbit
        generic map(N_BIT => 16)
        port map(
            CLK => CLK,
            RST => RST,
            COUNT_N => COUNT_16
        );
end RTL;

