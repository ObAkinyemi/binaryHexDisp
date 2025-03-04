----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2025 09:27:39 AM
-- Design Name: 
-- Module Name: sevenseg_decoder - Behavioral
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

entity sevenseg_decoder is
    Port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
           o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
end sevenseg_decoder;

architecture Behavioral of sevenseg_decoder is
    signal w_seg : std_logic_vector (6 downto 0);
begin
    -- controls segs
    with i_Hex select
        w_seg <= "1111110" when X"0",
                   "0110000" when X"1",
                   "1101101" when X"2",
                   "1111001" when X"3",
                   "0110011" when X"4",
                   "1011011" when X"5",
                   "1011111" when X"6",
                   "1110000" when X"7",
                   "1111111" when X"8",
                   "1110011" when X"9",
                   "1110111" when X"A",
                   "0011111" when X"B",
                   "1001110" when X"C",
                   "0111101" when X"D",
                   "1001111" when X"E",
                   "1000111" when X"F",
                   "1111111" when others; -- All segments off

    -- Invert the final output to match lab
    o_seg_n(0) <= NOT w_seg(6);
    o_seg_n(1) <= NOT w_seg(5);
    o_seg_n(2) <= NOT w_seg(4);
    o_seg_n(3) <= NOT w_seg(3);
    o_seg_n(4) <= NOT w_seg(2);
    o_seg_n(5) <= NOT w_seg(1);
    o_seg_n(6) <= NOT w_seg(0);
end Behavioral;
