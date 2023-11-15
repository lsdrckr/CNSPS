----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.11.2023 17:33:45
-- Design Name: 
-- Module Name: divider - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divider is
    Generic(nbit : integer := 16);
    Port(q : inout STD_LOGIC_VECTOR (nbit-1 downto 0);  --Dividend
        m : in STD_LOGIC_VECTOR(nbit-1 downto 0);       --Divisor
        clk : in STD_LOGIC);
end divider;

architecture Behavioral of divider is

signal a : STD_LOGIC_VECTOR(nbit-1 downto 0) := (others => '0');
signal m_s : unsigned(nbit-1 downto 0);
signal a_s : signed(nbit-1 downto 0);

begin


process(clk)

variable aq, lshift : STD_LOGIC_VECTOR(nbit*2-1 downto 0);

begin
    if (clk'event and clk = '1') then
        --For each bit
        for i in 0 to nbit-1 loop
            --Left shift AQ
            aq := a & q;
            lshift := aq(nbit-2 downto 0) & '0';
            
            --Restore a, m and q values from aq
            a_s <= signed (aq(nbit*2-1 downto nbit-1));
            m_s <= unsigned (m);
            q <= aq(nbit-1 downto 0);
            
            --A = A-M
            a_s <= a_s - signed(m_s);
            a <= std_logic_vector(a_s);
            
            --Change q(0) according to a(nbit-1) value
            if (a(nbit-1) = '0') then
                q(0) <= '1';
            else
                q(0) <= '0';
                end if;
            end loop;
        end if;
    end process;
        

end Behavioral;
