--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:39:05 02/19/2014
-- Design Name:   
-- Module Name:   C:/Users/C14Chinghao.Lim/Desktop/ECE281/CE3_LIM/Moore_TestBench_Lim.vhd
-- Project Name:  CE3_LIM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MooreElevatorController_Shell
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Moore_TestBench_Lim IS
END Moore_TestBench_Lim;
 
ARCHITECTURE behavior OF Moore_TestBench_Lim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MooreElevatorController_Shell
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         stop : IN  std_logic;
         up_down : IN  std_logic;
         floor : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal stop : std_logic := '0';
   signal up_down : std_logic := '0';

 	--Outputs
   signal floor : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MooreElevatorController_Shell PORT MAP (
          clk => clk,
          reset => reset,
          stop => stop,
          up_down => up_down,
          floor => floor
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*2;   ---store time 

      -- insert stimulus here 
		--for 1st storey----
		reset<='1';      --start elevator at level 1
		 wait for clk_period*2; 
		
		--for 2nd storey----
		reset<='0';
		up_down<= '1';    --elevator going up pass 2nd storey
		stop<='0';
		 wait for clk_period*1; 
		reset<='0';        
		up_down<= '1';    --elevator going up to 2nd storey  
		stop<='1';
		 wait for clk_period*1; 
		
		--for 3rd storey----
		reset<='0';
		up_down<= '1';    --elevator going up pass 3rd storey
		stop<='0';
		 wait for clk_period*1; 
		reset<='0';
		up_down<= '1';    --elevator going up to 3rd storey
		stop<='1';
		 wait for clk_period*1;
		
		--for 4th storey----
		reset<='0';
		up_down<= '1';    --elevator going up pass 4th storey
		stop<='0';
		 wait for clk_period*1; 
		reset<='0';
		up_down<= '1';    --elevator going up to 4th storey
		stop<='1';
		---going back down----
		 wait for clk_period*1;
		reset<='0';
		up_down<= '0';    --elevator going up to 4th storey
		stop<='0';
		 wait for clk_period*4;
		 
      wait;
   end process;

END;
