-- VHDL Example of shift Register for delay:
signal r_Shift : std_logic_vector(3 downto 0);

process (i_clock)
begin
    if rising_edge (i_clock) then
        r_Shift(3 downto 1) <= r_Shift(2 downto 0); --shifted left
        r_shift(0)          <= i_Data_to_Delay;
    end if;
end process;
