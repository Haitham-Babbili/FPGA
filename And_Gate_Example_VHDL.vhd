-- And Gate Example in VHDL

library ieee;
use ieee.std_logic_1164.all;

entity and_gat_example is 
   port(
       in1        : in std_logic;
       in2        : in std_logic;
       and_result : out std_logic;
   );
end and_gat_example;

architecture rtl of and_gat_example is
    signal and_templet :std_logic;
begin 
  and_templet <= in1 and in2;
  and_result <= and_templet;
end rtl;