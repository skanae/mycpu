library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity count_nbit is
    generic(
        N_BIT : integer := 8
    );
    port
	(
		CLK 		  : in std_logic;
		RST 	      : in std_logic;
        COUNT_N       : out std_logic_vector(N_BIT-1 downto 0)
    );
end count_nbit;

architecture RTL of count_nbit is

signal COUNT_TMP        : std_logic_vector(N_BIT-1 downto 0);

begin
    
    process(CLK)
    begin
        if (CLK'event and CLK='1') then
            if (RST = '0') then
                COUNT_TMP <= (others => '0');
            else
                COUNT_TMP <= COUNT_TMP + 1;
            end if ;   
        end if;
    end process;
    
    COUNT_N <= COUNT_TMP;

end RTL;

