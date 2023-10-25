----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.10.2023 10:58:02
-- Design Name: 
-- Module Name: inout_pin - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity inout_pin is
    Port (
        pin: inout STD_LOGIC;
        input, is_in: in STD_LOGIC;
        output: out STD_LOGIC  );
end inout_pin;

architecture Behavioral of inout_pin is

signal output_s: STD_LOGIC;

begin

with is_in select pin <=
    input when '1',
    pin when '0';
    
with is_in select output_s <=
    output_s when '1',
    pin when '0';

output <= output_s;

end Behavioral;
