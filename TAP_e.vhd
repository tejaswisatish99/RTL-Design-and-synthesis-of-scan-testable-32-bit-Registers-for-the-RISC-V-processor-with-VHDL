library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tapc_e is
      port ( TDI_i    : IN STD_LOGIC;
             TDO_o    : OUT STD_LOGIC;
             TMS_i    : IN STD_LOGIC;   
             TRST_i   : IN STD_LOGIC;
             TCK_i    : IN STD_LOGIC;
             ScanEn_o  : OUT STD_LOGIC;
             ScanIn_o  : OUT STD_LOGIC;
             ScanOut_i  : IN STD_LOGIC
            );
end tapc_e;

