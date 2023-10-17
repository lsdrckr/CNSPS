----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.10.2023 17:40:48
-- Design Name: 
-- Module Name: multiplier_async - Behavioral
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

entity multiplier_async is
    Generic(nbit: integer := 15);
    Port(input1: in STD_LOGIC_VECTOR (nbit downto 0);
        input2: in STD_LOGIC_VECTOR (nbit downto 0);
        reset: in STD_LOGIC;
        output: out STD_LOGIC_VECTOR (2*nbit downto 0));
end multiplier_async;

architecture Behavioral of multiplier_async is

signal input1_s, input2_s : signed (nbit downto 0);
signal output_s : signed (2*nbit downto 0);

begin

input1_s <= signed(input1);
input2_s <= signed(input2);
output_s <= input1_s * input2_s;
output <= std_logic_vector(output_s);

end Behavioral;
