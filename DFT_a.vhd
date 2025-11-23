architecture DFT_a of DFT_e is

component coreDesign_e
      port ( a_i    : IN STD_LOGIC;   
             b_i    : IN STD_LOGIC;
             c_o    : OUT STD_LOGIC );
end component;

component tapc_e is
      port ( TDI_i    : IN STD_LOGIC;
             TDO_o    : OUT STD_LOGIC;
             TMS_i    : IN STD_LOGIC;   
             TCK_i    : IN STD_LOGIC;
             TRST_i   : IN STD_LOGIC;
             ScanEn_o : OUT STD_LOGIC;
             ScanIn_o : OUT STD_LOGIC;
             ScanOut_i : IN STD_LOGIC;
             clock_dr_o  : OUT STD_LOGIC );
end component;

  signal a_s  : STD_LOGIC;
  signal b_s  : STD_LOGIC;
  signal c_s  : STD_LOGIC;
  signal ScanEn_s  : STD_LOGIC;
  signal ScanIn_s  : STD_LOGIC;
  signal ScanOut_s  : STD_LOGIC;
  signal clock_dr_s  : STD_LOGIC;
  
begin
    core: coreDesign_e PORT MAP(a_i => a_s,
                           b_i => b_s,
                           c_o => c_s );
                   
    tapc: tapc_e PORT MAP(TDI_i => TDI_i,
                   TDO_o => TDO_o,
                   TMS_i => TMS_i, 
                   TCK_i => TCK_i,
                   TRST_i => TRST_i,
                   ScanEn_o => ScanEn_s, 
                   ScanIn_o => ScanIn_s,
                   ScanOut_i => ScanOut_s,
                   clock_dr_o => clock_dr_s );
   
   Scan_a: process(clock_dr_s, ScanEn_s, a_i)
   begin
    if TRST_i = '1' then
        a_s <= '0';
    elsif rising_edge(clock_dr_s) then 
        if ScanEn_s = '1' then -- ScanTest
            a_s <= ScanIn_s;
        else
            a_s <= a_i;
        end if;
    end if; 
   end process;
   
   Scan_b: process(clock_dr_s, ScanEn_s, b_i)
   begin
    if TRST_i = '1' then
        b_s <= '0';
    elsif rising_edge(clock_dr_s) then 
        if ScanEn_s = '1' then -- ScanTest
            b_s <= a_s;
        else
            b_s <= b_i;
        end if;
    end if; 
   end process;
   
   Scan_c: process(clock_dr_s, ScanEn_s, c_s)
   begin
    if TRST_i = '1' then
        ScanOut_s <= '0';
    elsif rising_edge(clock_dr_s) then 
        if ScanEn_s = '1' then -- ScanTest
            ScanOut_s <= b_s;
        else
            ScanOut_s <= c_s;
        end if;
    end if; 
    c_o <= ScanOut_s;
   end process;
  
end DFT_a;
