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
    signal i_Hex    :   std_logic_vector (3 downto 0) := x"0";
    signal o_seg_n :   std_logic_vector (6 downto 0);
    
    
begin

-- PORT maps
    top_basys3_uut : sevenseg_decoder port map (
        i_Hex   => i_Hex,
        o_seg_n => o_seg_n
    );
    
    
    test_process : process
   
    begin
        i_Hex <= x"A"; wait for 10 ns;
            wait for 5 ns;
            assert(o_seg_n = "0001000") report "bad with zeros" severity failure;
        i_Hex <= x"0"; wait for 10 ns;
            wait for 5 ns;
            assert(o_seg_n = "1000000") report "bad with zeros for 0" severity failure;
        i_Hex <= x"5"; wait for 10 ns;
            wait for 5 ns;
            assert(o_seg_n = "0010010") report "bad with zeros" severity failure;
        i_Hex <= x"6"; wait for 10 ns;
            wait for 5 ns;
            assert(o_seg_n = "0000010") report "bad with zeros" severity failure;
   
    wait;
    end process;

end test_bench;
