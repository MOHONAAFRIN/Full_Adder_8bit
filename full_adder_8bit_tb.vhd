--------------------------------------------------------------------------------
-- VHDL Test Bench for 8-bit Full Adder
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_adder_8bit_tb IS
END full_adder_8bit_tb;

ARCHITECTURE behavior OF full_adder_8bit_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT full_adder_8bit
    PORT(
         A    : IN  std_logic_vector(7 downto 0);
         B    : IN  std_logic_vector(7 downto 0);
         Cin  : IN  std_logic;
         Sum  : OUT std_logic_vector(7 downto 0);
         Cout : OUT std_logic
        );
    END COMPONENT;

    -- Inputs
    signal A   : std_logic_vector(7 downto 0) := (others => '0');
    signal B   : std_logic_vector(7 downto 0) := (others => '0');
    signal Cin : std_logic := '0';

    -- Outputs
    signal Sum  : std_logic_vector(7 downto 0);
    signal Cout : std_logic;

BEGIN

    -- Instantiate the Unit Under Test (UUT)

    uut: full_adder_8bit PORT MAP (
        A    => A,
        B    => B,
        Cin  => Cin,
        Sum  => Sum,
        Cout => Cout
    );

    -- Stimulus process
    stim_proc: process
    begin

        -- Test 1
        -- 00000000 + 00000000 + 0
        -- Expected: Sum = 00000000, Cout = 0
        A <= "00000000";
        B <= "00000000";
        Cin <= '0';
        wait for 10 ns;

        -- Test 2
        -- 00000001 + 00000001 + 0
        -- Expected: Sum = 00000010, Cout = 0
        A <= "00000001";
        B <= "00000001";
        Cin <= '0';
        wait for 10 ns;

        -- Test 3
        -- 00001111 + 00000001 + 0
        -- Expected: Sum = 00010000, Cout = 0
        A <= "00001111";
        B <= "00000001";
        Cin <= '0';
        wait for 10 ns;

        -- Test 4
        -- 11111111 + 00000001 + 0
        -- Expected: Sum = 00000000, Cout = 1
        A <= "11111111";
        B <= "00000001";
        Cin <= '0';
        wait for 10 ns;

        -- Test 5
        -- 10101010 + 01010101 + 0
        -- Expected: Sum = 11111111, Cout = 0
        A <= "10101010";
        B <= "01010101";
        Cin <= '0';
        wait for 10 ns;

        -- Test 6
        -- 11111111 + 11111111 + 0
        -- Expected: Sum = 11111110, Cout = 1
        A <= "11111111";
        B <= "11111111";
        Cin <= '0';
        wait for 10 ns;

        -- Test 7
        -- 00000001 + 00000000 + 1
        -- Expected: Sum = 00000010, Cout = 0
        A <= "00000001";
        B <= "00000000";
        Cin <= '1';
        wait for 10 ns;

        -- Test 8
        -- 11111111 + 00000000 + 1
        -- Expected: Sum = 00000000, Cout = 1
        A <= "11111111";
        B <= "00000000";
        Cin <= '1';
        wait for 10 ns;

        -- Stop simulation
        wait;

    end process;

END;