-- MOD-6 counter
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mod6_counter is
    Port ( CLK : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           COUNT : out  STD_LOGIC_VECTOR (2 downto 0));
end mod6_counter;

architecture Behavioral of mod6_counter is
    
    SIGNAL cnt : STD_LOGIC_VECTOR(2 downto 0) := "000";

begin

    process(CLK,RST) is
    begin
        -- Reset flip-flop outputs (all cnt bits) to 0 when
        --  RST signal is activated
        if RST = '1' then
            cnt <= "000";
        -- Increment the FF outputs if enabled and rising edge hits.
        elsif CLK'event and CLK = '1' then
            if EN = '1' then
                -- If counter hits 5, reset it back to 0 in the rising edge.
                if cnt = "101" then
                    cnt <= "000";
                -- Increment otherwise
                else
                    cnt <= cnt + '1';
                end if;
            end if;
        end if;
    end process;
    
    -- Assign the output outside of process.
    COUNT <= cnt;
    
end Behavioral;