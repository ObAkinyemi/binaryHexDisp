----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2025 02:50:23 PM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
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

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

architecture test_bench of sevenseg_decoder_tb is
   
-- declare the component of hte seven_seg_decoder
    component sevenseg_decoder is
        Port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
               o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
    end component sevenseg_decoder;
    
-- declare the signals
    signal input    :   std_logic_vector (3 downto 0) :=x"0000";
    signal out_segs :   std_logic_vector (6 downto 0) :=x"00000000";

begin

-- PORT maps
    sevenseg_decoder_uut : sevenseg_decoder port map (
        i_Hex   => input(3 downto 0),
        o_seg_n => out_segs(6 downto 0)
    );
    
    
    test_process : process
   
    begin
        input <= x"A"; wait for 10 ns;
            assert(o_seg_n = x"1110111") report "bad with zeros" severity failure;
        input <= x"B"; wait for 10 ns;
            assert(o_seg_n = x"0011111") report "bad with zeros" severity failure;
        input <= x"5"; wait for 10 ns;
            assert(o_seg_n = x"1011011") report "bad with zeros" severity failure;
        input <= x"6"; wait for 10 ns;
            assert(o_seg_n = x"1011111") report "bad with zeros" severity failure;
   
    wait;
    end process;

end test_bench;
