library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fsm_e is
      port ( TMS_i    : IN STD_LOGIC;   
             TRST_i   : IN STD_LOGIC;
             TCK_i    : IN STD_LOGIC;
             SelectIR_o  : OUT STD_LOGIC;
             clock_ir_o  : OUT STD_LOGIC;
             shift_ir_o  : OUT STD_LOGIC;
             update_ir_o : OUT STD_LOGIC;
             clock_dr_o  : OUT STD_LOGIC;
             shift_dr_o  : OUT STD_LOGIC;
             update_dr_o : OUT STD_LOGIC; 
             mode_o : OUT STD_LOGIC      
            );
end fsm_e;

