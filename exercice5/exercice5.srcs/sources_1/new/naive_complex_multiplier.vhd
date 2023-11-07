----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.11.2023 17:34:43
-- Design Name: 
-- Module Name: naive_complex_multiplier - Behavioral
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

entity naive_complex_multiplier is
    Generic(nbit : integer := 8);
    Port(a_reel : in STD_LOGIC_VECTOR(nbit-1 downto 0);
        a_im : in STD_LOGIC_VECTOR(nbit-1 downto 0);
        b_reel : in STD_LOGIC_VECTOR(nbit-1 downto 0);
        b_im : in STD_LOGIC_VECTOR(nbit-1 downto 0);
        clk : in STD_LOGIC;
        z_reel : out STD_LOGIC_VECTOR(2*nbit-1 downto 0);
        z_im : out STD_LOGIC_VECTOR(2*nbit-1 downto 0));
end naive_complex_multiplier;

architecture Behavioral of naive_complex_multiplier is

signal a_reel_s, a_im_s, b_reel_s, b_im_s : signed (nbit-1 downto 0);

begin

process (clk)
begin
    if (clk'event and clk = '1') then
        a_reel_s <= signed(a_reel);
        b_reel_s <= signed(b_reel);
        a_im_s <= signed(a_im);
        b_im_s <= signed(b_im);
        z_reel <= std_logic_vector((a_reel_s * b_reel_s) - (a_im_s * b_im_s));
        z_im <= std_logic_vector((a_reel_s * b_im_s) + (a_im_s * b_reel_s));
        end if;
    end process;

end Behavioral;
