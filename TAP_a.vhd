
architecture tapc_a of tapc_e is

component fsm_e
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
             mode_o      : OUT STD_LOGIC  
            );
end component;

component datareg_e
      port ( TCK_i   : IN STD_LOGIC;
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
end component;

component instrreg_e          
      port ( TDI_i    : IN STD_LOGIC;
           TDO_o    : OUT STD_LOGIC;
           clock_ir_i  : IN STD_LOGIC;
           shift_ir_i  : IN STD_LOGIC;
           update_ir_i : IN STD_LOGIC; 
           ScanEn_o    : OUT STD_LOGIC; 
           drmux_o     : OUT STD_LOGIC 
          );
end component;
  
  signal SelectIR_s  : STD_LOGIC;
  signal shift_ir_s  : STD_LOGIC;
  signal shift_dr_s  : STD_LOGIC;
  signal update_ir_s : STD_LOGIC;
  signal update_dr_s : STD_LOGIC;
  signal clock_dr_s  : STD_LOGIC;
  signal clock_ir_s  : STD_LOGIC;
  signal mode_s  : STD_LOGIC;
  signal ScanEn_s  : STD_LOGIC;
  signal ScanIn_s  : STD_LOGIC;
  signal ScanOut_s  : STD_LOGIC;
  signal drmux_s  : STD_LOGIC;
  signal TDO_data_s  : STD_LOGIC;
  signal TDO_instr_s  : STD_LOGIC;
 
begin 

FSM: fsm_e PORT MAP(TMS_i => TMS_i,
                   TRST_i => TRST_i,
                   TCK_i => TCK_i,
                   SelectIR_o => SelectIR_s,
                   clock_ir_o => clock_ir_s,
                   shift_ir_o => shift_ir_s,
                   update_ir_o => update_ir_s,
                   clock_dr_o => clock_dr_s,
                   shift_dr_o => shift_dr_s,
                   update_dr_o => update_dr_s,
                   mode_o => mode_s
                  );
DR: datareg_e PORT MAP(TCK_i => TCK_i,
                       TDI_i => TDI_i,
                       TDO_o => TDO_data_s,
                       clock_dr_i => clock_dr_s,
                       shift_dr_i => shift_dr_s,
                       update_dr_i => update_dr_s,
                       mode_i => mode_s,
                       drmux_i => drmux_s,
                       ScanIn_o => ScanIn_o,
                       ScanOut_i => ScanOut_i
                      );
IR: instrreg_e PORT MAP(TDI_i => TDI_i,
                       TDO_o => TDO_instr_s,
                       clock_ir_i => clock_ir_s,
                       shift_ir_i => shift_ir_s,
                       update_ir_i => update_ir_s,
                       ScanEn_o => ScanEn_o,
                       drmux_o => drmux_s
                       );                                       
   TDO_Update: process(TCK_i, SelectIR_s)
   begin
      if falling_edge(TCK_i) then
        if SelectIR_s = '1' then 
           TDO_o <= TDO_instr_s;
        else
           TDO_o <= TDO_data_s; 
        end if; 
      end if;     
    end process;                                          
end tapc_a;
