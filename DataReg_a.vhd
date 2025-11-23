
architecture datareg_a of datareg_e is
 signal bypass_reg_s: std_logic;
 
begin
    bypass_reg_s <= TDI_i;
    ScanIn_o <= TDI_i;
   DR_mux: process(TCK_i, drmux_i)
    begin
      if rising_edge(TCK_i) then
        if drmux_i = '1' then -- BYPASS
           TDO_o <= bypass_reg_s;
        else
           TDO_o <= ScanOut_i;
        end if; 
      end if;     
    end process;
end datareg_a;
