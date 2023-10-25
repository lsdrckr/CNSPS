----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.10.2023 10:17:35
-- Design Name: 
-- Module Name: ram_inference - Behavioral
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

entity rom_inference is
    Generic(
        aw             :integer := 8; --address width of memory
        dw             :integer := 8  --data width of memory
    );
    Port(
        --arm clock
        aclk   :in    std_logic;

        raddr  :in    std_logic_vector(aw-1 downto 0);
        rdata  :out   std_logic_vector(dw-1 downto 0)        
    );
end rom_inference;

architecture Behavioral of rom_inference is
    constant mem_len :integer := 2**aw;

    type mem_type is array (0 to mem_len-1) of std_logic_vector(dw-1 downto 0);

    signal block_ram : mem_type := (others => (others => '0'));

begin

process(aclk)
begin
    if (rising_edge(aclk)) then

        -- QUESTION: REGISTERING THE READ DATA (ALL OUTPUT REGISTERED)?
        rdata <= block_ram(to_integer(unsigned(raddr)));        

    end if;
end process;
end Behavioral;
