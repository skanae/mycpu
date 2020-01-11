library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity count10_2 is
	port
	(
		CLK 		: in std_logic;
		RST 	    : in std_logic;
        COUNT       : out std_logic_vector(3 downto 0)
    );
end count10_2;

architecture RTL of count10_2 is

signal COUNT_TMP        : std_logic_vector(3 downto 0);
signal COUNT_TMP_NEXT   : std_logic_vector(3 downto 0);

begin

    process(COUNT_TMP_NEXT)
    begin
        if(COUNT_TMP="1001") then
            COUNT_TMP_NEXT <= "0000";
        else
            COUNT_TMP_NEXT <= COUNT_TMP + 1;
        end if;
    end process;

    process(CLK)
    begin
        if (CLK'event and CLK='1') then
            COUNT_TMP <= COUNT_TMP_NEXT;    
        end if;
    end process;
    
    COUNT <= COUNT_TMP;

end RTL;

