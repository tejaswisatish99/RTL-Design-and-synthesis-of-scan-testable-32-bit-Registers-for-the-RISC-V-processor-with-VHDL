library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity datareg_e is
   port ( TCK_i  : IN STD_LOGIC;
       TDI_i    : IN STD_LOGIC;
       TDO_o    : OUT STD_LOGIC;
       mode_i    : IN STD_LOGIC;
       clock_dr_i  : IN STD_LOGIC;
       shift_dr_i  : IN STD_LOGIC;
       update_dr_i : IN STD_LOGIC;
       drmux_i     : IN STD_LOGIC;
       ScanIn_o     : OUT STD_LOGIC;
       ScanOut_i     : IN STD_LOGIC
      );
end datareg_e;