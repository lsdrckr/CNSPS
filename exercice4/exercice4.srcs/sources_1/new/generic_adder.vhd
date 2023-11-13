----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.11.2023 16:21:56
-- Design Name: 
-- Module Name: generic_adder - Behavioral
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

entity generic_adder is
    Generic(nbit: integer := 32);
    Port(input1: in STD_LOGIC_VECTOR (nbit-1 downto 0);
        input2: in STD_LOGIC_VECTOR (nbit-1 downto 0);
        clk: in STD_LOGIC;
        output: out STD_LOGIC_VECTOR (nbit-1 downto 0));
end generic_adder;

architecture Behavioral of generic_adder is

signal input1_s, input2_s : unsigned (nbit-1 downto 0);

begin

process(clk)
begin
    if (clk'event and clk = '1') then
        input1_s <= unsigned(input1);
        input2_s <= unsigned(input2);
        output <= std_logic_vector(input1_s + input2_s);
    end if;
end process;
 
end Behavioral;
