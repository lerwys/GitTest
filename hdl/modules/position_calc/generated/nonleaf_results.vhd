library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/BPF/Cast"

entity cast_entity_b1c4950708 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(33 downto 0); 
    en: in std_logic; 
    out_x0: out std_logic_vector(23 downto 0)
  );
end cast_entity_b1c4950708;

architecture structural of cast_entity_b1c4950708 is
  signal bpf_fpga_m_axis_data_tdata_path3_net_x0: std_logic_vector(33 downto 0);
  signal bpf_fpga_m_axis_data_tvalid_net_x0: std_logic;
  signal ce_1_sg_x0: std_logic;
  signal clk_1_sg_x0: std_logic;
  signal convert_dout_net: std_logic_vector(23 downto 0);
  signal register_q_net_x0: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x0 <= ce_1;
  clk_1_sg_x0 <= clk_1;
  bpf_fpga_m_axis_data_tdata_path3_net_x0 <= data_in;
  bpf_fpga_m_axis_data_tvalid_net_x0 <= en;
  out_x0 <= register_q_net_x0;

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 32,
      din_width => 34,
      dout_arith => 2,
      dout_bin_pt => 22,
      dout_width => 24,
      latency => 0,
      overflow => xlWrap,
      quantization => xlRound
    )
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      din => bpf_fpga_m_axis_data_tdata_path3_net_x0,
      en => "1",
      dout => convert_dout_net
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      d => convert_dout_net,
      en(0) => bpf_fpga_m_axis_data_tvalid_net_x0,
      rst => "0",
      q => register_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/BPF"

entity bpf_entity_d31c4af409 is
  port (
    adc_ch0_in: in std_logic_vector(15 downto 0); 
    adc_ch1_in: in std_logic_vector(15 downto 0); 
    adc_ch2_in: in std_logic_vector(15 downto 0); 
    adc_ch3_in: in std_logic_vector(15 downto 0); 
    ce_1: in std_logic; 
    ce_logic_1: in std_logic; 
    clk_1: in std_logic; 
    bpf_ch0_out: out std_logic_vector(23 downto 0); 
    bpf_ch1_out: out std_logic_vector(23 downto 0); 
    bpf_ch2_out: out std_logic_vector(23 downto 0); 
    bpf_ch3_out: out std_logic_vector(23 downto 0)
  );
end bpf_entity_d31c4af409;

architecture structural of bpf_entity_d31c4af409 is
  signal adc_ch0_i_net_x0: std_logic_vector(15 downto 0);
  signal adc_ch1_i_net_x0: std_logic_vector(15 downto 0);
  signal adc_ch2_i_net_x0: std_logic_vector(15 downto 0);
  signal adc_ch3_i_net_x0: std_logic_vector(15 downto 0);
  signal bpf_fpga_m_axis_data_tdata_path0_net_x0: std_logic_vector(33 downto 0);
  signal bpf_fpga_m_axis_data_tdata_path1_net_x0: std_logic_vector(33 downto 0);
  signal bpf_fpga_m_axis_data_tdata_path2_net_x0: std_logic_vector(33 downto 0);
  signal bpf_fpga_m_axis_data_tdata_path3_net_x0: std_logic_vector(33 downto 0);
  signal bpf_fpga_m_axis_data_tvalid_net_x3: std_logic;
  signal ce_1_sg_x4: std_logic;
  signal ce_logic_1_sg_x0: std_logic;
  signal clk_1_sg_x4: std_logic;
  signal register_q_net_x4: std_logic_vector(23 downto 0);
  signal register_q_net_x5: std_logic_vector(23 downto 0);
  signal register_q_net_x6: std_logic_vector(23 downto 0);
  signal register_q_net_x7: std_logic_vector(23 downto 0);

begin
  adc_ch0_i_net_x0 <= adc_ch0_in;
  adc_ch1_i_net_x0 <= adc_ch1_in;
  adc_ch2_i_net_x0 <= adc_ch2_in;
  adc_ch3_i_net_x0 <= adc_ch3_in;
  ce_1_sg_x4 <= ce_1;
  ce_logic_1_sg_x0 <= ce_logic_1;
  clk_1_sg_x4 <= clk_1;
  bpf_ch0_out <= register_q_net_x4;
  bpf_ch1_out <= register_q_net_x5;
  bpf_ch2_out <= register_q_net_x6;
  bpf_ch3_out <= register_q_net_x7;

  bpf_fpga: entity work.xlfir_compiler_1a3b4116c25eb51405f5c9ac7054eb67
    port map (
      ce => ce_1_sg_x4,
      ce_logic_1 => ce_logic_1_sg_x0,
      clk => clk_1_sg_x4,
      clk_logic_1 => clk_1_sg_x4,
      s_axis_data_tdata_path0 => adc_ch3_i_net_x0,
      s_axis_data_tdata_path1 => adc_ch2_i_net_x0,
      s_axis_data_tdata_path2 => adc_ch1_i_net_x0,
      s_axis_data_tdata_path3 => adc_ch0_i_net_x0,
      src_ce => ce_1_sg_x4,
      src_clk => clk_1_sg_x4,
      m_axis_data_tdata_path0 => bpf_fpga_m_axis_data_tdata_path0_net_x0,
      m_axis_data_tdata_path1 => bpf_fpga_m_axis_data_tdata_path1_net_x0,
      m_axis_data_tdata_path2 => bpf_fpga_m_axis_data_tdata_path2_net_x0,
      m_axis_data_tdata_path3 => bpf_fpga_m_axis_data_tdata_path3_net_x0,
      m_axis_data_tvalid => bpf_fpga_m_axis_data_tvalid_net_x3
    );

  cast1_3671dd9abb: entity work.cast_entity_b1c4950708
    port map (
      ce_1 => ce_1_sg_x4,
      clk_1 => clk_1_sg_x4,
      data_in => bpf_fpga_m_axis_data_tdata_path2_net_x0,
      en => bpf_fpga_m_axis_data_tvalid_net_x3,
      out_x0 => register_q_net_x5
    );

  cast2_5e2ee5643d: entity work.cast_entity_b1c4950708
    port map (
      ce_1 => ce_1_sg_x4,
      clk_1 => clk_1_sg_x4,
      data_in => bpf_fpga_m_axis_data_tdata_path1_net_x0,
      en => bpf_fpga_m_axis_data_tvalid_net_x3,
      out_x0 => register_q_net_x6
    );

  cast3_b7731903ed: entity work.cast_entity_b1c4950708
    port map (
      ce_1 => ce_1_sg_x4,
      clk_1 => clk_1_sg_x4,
      data_in => bpf_fpga_m_axis_data_tdata_path0_net_x0,
      en => bpf_fpga_m_axis_data_tvalid_net_x3,
      out_x0 => register_q_net_x7
    );

  cast_b1c4950708: entity work.cast_entity_b1c4950708
    port map (
      ce_1 => ce_1_sg_x4,
      clk_1 => clk_1_sg_x4,
      data_in => bpf_fpga_m_axis_data_tdata_path3_net_x0,
      en => bpf_fpga_m_axis_data_tvalid_net_x3,
      out_x0 => register_q_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Channel0_fofb/cic_fofb"

entity cic_fofb_entity_c0b771be35 is
  port (
    ce_1: in std_logic; 
    ce_1113: in std_logic; 
    ce_logic_1: in std_logic; 
    clk_1: in std_logic; 
    clk_1113: in std_logic; 
    i_in: in std_logic_vector(23 downto 0); 
    q_in: in std_logic_vector(23 downto 0); 
    i_out: out std_logic_vector(24 downto 0); 
    i_valid: out std_logic; 
    q_out: out std_logic_vector(24 downto 0)
  );
end cic_fofb_entity_c0b771be35;

architecture structural of cic_fofb_entity_c0b771be35 is
  signal ce_1113_sg_x0: std_logic;
  signal ce_1_sg_x5: std_logic;
  signal ce_logic_1_sg_x1: std_logic;
  signal cic_fofb_i_m_axis_data_tdata_data_net: std_logic_vector(24 downto 0);
  signal cic_fofb_i_m_axis_data_tvalid_net_x0: std_logic;
  signal cic_fofb_q_m_axis_data_tdata_data_net: std_logic_vector(24 downto 0);
  signal clk_1113_sg_x0: std_logic;
  signal clk_1_sg_x5: std_logic;
  signal delay6_q_net_x0: std_logic_vector(23 downto 0);
  signal delay7_q_net_x0: std_logic_vector(23 downto 0);
  signal reinterpret1_output_port_net_x0: std_logic_vector(24 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(24 downto 0);

begin
  ce_1_sg_x5 <= ce_1;
  ce_1113_sg_x0 <= ce_1113;
  ce_logic_1_sg_x1 <= ce_logic_1;
  clk_1_sg_x5 <= clk_1;
  clk_1113_sg_x0 <= clk_1113;
  delay7_q_net_x0 <= i_in;
  delay6_q_net_x0 <= q_in;
  i_out <= reinterpret1_output_port_net_x0;
  i_valid <= cic_fofb_i_m_axis_data_tvalid_net_x0;
  q_out <= reinterpret_output_port_net_x0;

  cic_fofb_i: entity work.xlcic_compiler_bb7d6f586f04abec4d028ced88abc8ae
    port map (
      ce => ce_1_sg_x5,
      ce_1113 => ce_1113_sg_x0,
      ce_logic_1 => ce_logic_1_sg_x1,
      clk => clk_1_sg_x5,
      clk_1113 => clk_1113_sg_x0,
      clk_logic_1 => clk_1_sg_x5,
      s_axis_data_tdata_data => delay7_q_net_x0,
      m_axis_data_tdata_data => cic_fofb_i_m_axis_data_tdata_data_net,
      m_axis_data_tvalid => cic_fofb_i_m_axis_data_tvalid_net_x0
    );

  cic_fofb_q: entity work.xlcic_compiler_bb7d6f586f04abec4d028ced88abc8ae
    port map (
      ce => ce_1_sg_x5,
      ce_1113 => ce_1113_sg_x0,
      ce_logic_1 => ce_logic_1_sg_x1,
      clk => clk_1_sg_x5,
      clk_1113 => clk_1113_sg_x0,
      clk_logic_1 => clk_1_sg_x5,
      s_axis_data_tdata_data => delay6_q_net_x0,
      m_axis_data_tdata_data => cic_fofb_q_m_axis_data_tdata_data_net
    );

  reinterpret: entity work.reinterpret_31a4235b32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => cic_fofb_q_m_axis_data_tdata_data_net,
      output_port => reinterpret_output_port_net_x0
    );

  reinterpret1: entity work.reinterpret_31a4235b32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => cic_fofb_i_m_axis_data_tdata_data_net,
      output_port => reinterpret1_output_port_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Channel0_fofb"

entity channel0_fofb_entity_3577a252e5 is
  port (
    ce_1: in std_logic; 
    ce_1113: in std_logic; 
    ce_logic_1: in std_logic; 
    clk_1: in std_logic; 
    clk_1113: in std_logic; 
    mix_i_in: in std_logic_vector(23 downto 0); 
    mix_q_in: in std_logic_vector(23 downto 0); 
    amp_f: out std_logic_vector(24 downto 0); 
    cic_fofb_i_fpga_out: out std_logic_vector(24 downto 0); 
    cic_fofb_q_fpga_out: out std_logic_vector(24 downto 0); 
    valid_f: out std_logic
  );
end channel0_fofb_entity_3577a252e5;

architecture structural of channel0_fofb_entity_3577a252e5 is
  signal ce_1113_sg_x1: std_logic;
  signal ce_1_sg_x6: std_logic;
  signal ce_logic_1_sg_x2: std_logic;
  signal cic_fofb_i_m_axis_data_tvalid_net_x0: std_logic;
  signal clk_1113_sg_x1: std_logic;
  signal clk_1_sg_x6: std_logic;
  signal delay6_q_net_x1: std_logic_vector(23 downto 0);
  signal delay7_q_net_x1: std_logic_vector(23 downto 0);
  signal rect2pol_m_axis_dout_tdata_real_net: std_logic_vector(24 downto 0);
  signal rect2pol_m_axis_dout_tvalid_net: std_logic;
  signal register5_q_net_x0: std_logic_vector(24 downto 0);
  signal register6_q_net_x0: std_logic;
  signal reinterpret1_output_port_net_x1: std_logic_vector(24 downto 0);
  signal reinterpret3_output_port_net: std_logic_vector(24 downto 0);
  signal reinterpret_output_port_net_x1: std_logic_vector(24 downto 0);

begin
  ce_1_sg_x6 <= ce_1;
  ce_1113_sg_x1 <= ce_1113;
  ce_logic_1_sg_x2 <= ce_logic_1;
  clk_1_sg_x6 <= clk_1;
  clk_1113_sg_x1 <= clk_1113;
  delay7_q_net_x1 <= mix_i_in;
  delay6_q_net_x1 <= mix_q_in;
  amp_f <= register5_q_net_x0;
  cic_fofb_i_fpga_out <= reinterpret1_output_port_net_x1;
  cic_fofb_q_fpga_out <= reinterpret_output_port_net_x1;
  valid_f <= register6_q_net_x0;

  cic_fofb_c0b771be35: entity work.cic_fofb_entity_c0b771be35
    port map (
      ce_1 => ce_1_sg_x6,
      ce_1113 => ce_1113_sg_x1,
      ce_logic_1 => ce_logic_1_sg_x2,
      clk_1 => clk_1_sg_x6,
      clk_1113 => clk_1113_sg_x1,
      i_in => delay7_q_net_x1,
      q_in => delay6_q_net_x1,
      i_out => reinterpret1_output_port_net_x1,
      i_valid => cic_fofb_i_m_axis_data_tvalid_net_x0,
      q_out => reinterpret_output_port_net_x1
    );

  rect2pol: entity work.xlcordic_c062cc3a2d77ede2032de397150e15cd
    port map (
      ce => ce_1113_sg_x1,
      clk => clk_1113_sg_x1,
      s_axis_cartesian_tdata_imag => reinterpret_output_port_net_x1,
      s_axis_cartesian_tdata_real => reinterpret1_output_port_net_x1,
      s_axis_cartesian_tvalid => cic_fofb_i_m_axis_data_tvalid_net_x0,
      m_axis_dout_tdata_real => rect2pol_m_axis_dout_tdata_real_net,
      m_axis_dout_tvalid => rect2pol_m_axis_dout_tvalid_net
    );

  register5: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_1113_sg_x1,
      clk => clk_1113_sg_x1,
      d => reinterpret3_output_port_net,
      en(0) => rect2pol_m_axis_dout_tvalid_net,
      rst => "0",
      q => register5_q_net_x0
    );

  register6: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1113_sg_x1,
      clk => clk_1113_sg_x1,
      d(0) => rect2pol_m_axis_dout_tvalid_net,
      en => "1",
      rst => "0",
      q(0) => register6_q_net_x0
    );

  reinterpret3: entity work.reinterpret_31a4235b32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rect2pol_m_axis_dout_tdata_real_net,
      output_port => reinterpret3_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Channel0_tbt/DDC/Mixer/DataReg_En"

entity datareg_en_entity_c073dad362 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(23 downto 0); 
    en: in std_logic; 
    dout: out std_logic_vector(23 downto 0); 
    valid: out std_logic
  );
end datareg_en_entity_c073dad362;

architecture structural of datareg_en_entity_c073dad362 is
  signal ce_1_sg_x7: std_logic;
  signal clk_1_sg_x7: std_logic;
  signal constant1_op_net_x0: std_logic;
  signal constant2_op_net_x0: std_logic_vector(23 downto 0);
  signal register1_q_net_x0: std_logic;
  signal register_q_net_x0: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x7 <= ce_1;
  clk_1_sg_x7 <= clk_1;
  constant2_op_net_x0 <= din;
  constant1_op_net_x0 <= en;
  dout <= register_q_net_x0;
  valid <= register1_q_net_x0;

  register1: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x7,
      clk => clk_1_sg_x7,
      d(0) => constant1_op_net_x0,
      en => "1",
      rst => "0",
      q(0) => register1_q_net_x0
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x7,
      clk => clk_1_sg_x7,
      d => constant2_op_net_x0,
      en(0) => constant1_op_net_x0,
      rst => "0",
      q => register_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Channel0_tbt/DDC/Mixer/DataReg_En1"

entity datareg_en1_entity_02ef0305a4 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(23 downto 0); 
    en: in std_logic; 
    dout: out std_logic_vector(23 downto 0)
  );
end datareg_en1_entity_02ef0305a4;

architecture structural of datareg_en1_entity_02ef0305a4 is
  signal ce_1_sg_x8: std_logic;
  signal clk_1_sg_x8: std_logic;
  signal constant1_op_net_x1: std_logic;
  signal register_q_net_x0: std_logic_vector(23 downto 0);
  signal register_q_net_x5: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x8 <= ce_1;
  clk_1_sg_x8 <= clk_1;
  register_q_net_x5 <= din;
  constant1_op_net_x1 <= en;
  dout <= register_q_net_x0;

  register_x0: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x8,
      clk => clk_1_sg_x8,
      d => register_q_net_x5,
      en(0) => constant1_op_net_x1,
      rst => "0",
      q => register_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Channel0_tbt/DDC/Mixer"

entity mixer_entity_9216a510d2 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    dds_cosine: in std_logic_vector(23 downto 0); 
    dds_msine: in std_logic_vector(23 downto 0); 
    dds_valid: in std_logic; 
    din_i: in std_logic_vector(23 downto 0); 
    din_q: in std_logic_vector(23 downto 0); 
    en: in std_logic; 
    i: out std_logic_vector(23 downto 0); 
    q: out std_logic_vector(23 downto 0)
  );
end mixer_entity_9216a510d2;

architecture structural of mixer_entity_9216a510d2 is
  signal a_i: std_logic_vector(23 downto 0);
  signal a_r: std_logic_vector(23 downto 0);
  signal b_i: std_logic_vector(23 downto 0);
  signal b_r: std_logic_vector(23 downto 0);
  signal ce_1_sg_x9: std_logic;
  signal clk_1_sg_x9: std_logic;
  signal complexmult_m_axis_dout_tdata_imag_net: std_logic_vector(23 downto 0);
  signal complexmult_m_axis_dout_tdata_real_net: std_logic_vector(23 downto 0);
  signal complexmult_m_axis_dout_tvalid_net: std_logic;
  signal constant1_op_net_x2: std_logic;
  signal constant2_op_net_x1: std_logic_vector(23 downto 0);
  signal convert1_dout_net: std_logic_vector(23 downto 0);
  signal convert2_dout_net: std_logic_vector(23 downto 0);
  signal dds_m_axis_data_tdata_cosine_net_x0: std_logic_vector(23 downto 0);
  signal dds_m_axis_data_tdata_sine_net_x0: std_logic_vector(23 downto 0);
  signal dds_m_axis_data_tvalid_net_x0: std_logic;
  signal delay6_q_net_x2: std_logic_vector(23 downto 0);
  signal delay7_q_net_x2: std_logic_vector(23 downto 0);
  signal register1_q_net_x0: std_logic;
  signal register_q_net_x0: std_logic_vector(23 downto 0);
  signal register_q_net_x1: std_logic_vector(23 downto 0);
  signal register_q_net_x6: std_logic_vector(23 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x9 <= ce_1;
  clk_1_sg_x9 <= clk_1;
  dds_m_axis_data_tdata_cosine_net_x0 <= dds_cosine;
  dds_m_axis_data_tdata_sine_net_x0 <= dds_msine;
  dds_m_axis_data_tvalid_net_x0 <= dds_valid;
  register_q_net_x6 <= din_i;
  constant2_op_net_x1 <= din_q;
  constant1_op_net_x2 <= en;
  i <= delay7_q_net_x2;
  q <= delay6_q_net_x2;

  complexmult: entity work.xlcomplex_multiplier_a3a52a268f0fdc1111e428e7f4c7c82c
    port map (
      ce => ce_1_sg_x9,
      clk => clk_1_sg_x9,
      s_axis_a_tdata_imag => a_i,
      s_axis_a_tdata_real => a_r,
      s_axis_a_tvalid => dds_m_axis_data_tvalid_net_x0,
      s_axis_b_tdata_imag => b_i,
      s_axis_b_tdata_real => b_r,
      s_axis_b_tvalid => register1_q_net_x0,
      m_axis_dout_tdata_imag => complexmult_m_axis_dout_tdata_imag_net,
      m_axis_dout_tdata_real => complexmult_m_axis_dout_tdata_real_net,
      m_axis_dout_tvalid => complexmult_m_axis_dout_tvalid_net
    );

  convert1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 19,
      din_width => 24,
      dout_arith => 2,
      dout_bin_pt => 22,
      dout_width => 24,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x9,
      clk => clk_1_sg_x9,
      clr => '0',
      din => reinterpret1_output_port_net,
      en => "1",
      dout => convert1_dout_net
    );

  convert2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 19,
      din_width => 24,
      dout_arith => 2,
      dout_bin_pt => 22,
      dout_width => 24,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x9,
      clk => clk_1_sg_x9,
      clr => '0',
      din => reinterpret_output_port_net,
      en => "1",
      dout => convert2_dout_net
    );

  datareg_en1_02ef0305a4: entity work.datareg_en1_entity_02ef0305a4
    port map (
      ce_1 => ce_1_sg_x9,
      clk_1 => clk_1_sg_x9,
      din => register_q_net_x6,
      en => constant1_op_net_x2,
      dout => register_q_net_x1
    );

  datareg_en_c073dad362: entity work.datareg_en_entity_c073dad362
    port map (
      ce_1 => ce_1_sg_x9,
      clk_1 => clk_1_sg_x9,
      din => constant2_op_net_x1,
      en => constant1_op_net_x2,
      dout => register_q_net_x0,
      valid => register1_q_net_x0
    );

  delay: entity work.delay_961b43f67a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => register_q_net_x0,
      q => b_i
    );

  delay1: entity work.delay_961b43f67a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => register_q_net_x1,
      q => b_r
    );

  delay2: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      reset => 0,
      width => 24
    )
    port map (
      ce => ce_1_sg_x9,
      clk => clk_1_sg_x9,
      d => dds_m_axis_data_tdata_sine_net_x0,
      en => dds_m_axis_data_tvalid_net_x0,
      rst => '1',
      q => a_i
    );

  delay3: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      reset => 0,
      width => 24
    )
    port map (
      ce => ce_1_sg_x9,
      clk => clk_1_sg_x9,
      d => dds_m_axis_data_tdata_cosine_net_x0,
      en => dds_m_axis_data_tvalid_net_x0,
      rst => '1',
      q => a_r
    );

  delay6: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      reset => 0,
      width => 24
    )
    port map (
      ce => ce_1_sg_x9,
      clk => clk_1_sg_x9,
      d => convert2_dout_net,
      en => complexmult_m_axis_dout_tvalid_net,
      rst => '1',
      q => delay6_q_net_x2
    );

  delay7: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      reset => 0,
      width => 24
    )
    port map (
      ce => ce_1_sg_x9,
      clk => clk_1_sg_x9,
      d => convert1_dout_net,
      en => complexmult_m_axis_dout_tvalid_net,
      rst => '1',
      q => delay7_q_net_x2
    );

  reinterpret: entity work.reinterpret_b62f4240f0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => complexmult_m_axis_dout_tdata_imag_net,
      output_port => reinterpret_output_port_net
    );

  reinterpret1: entity work.reinterpret_b62f4240f0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => complexmult_m_axis_dout_tdata_real_net,
      output_port => reinterpret1_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Channel0_tbt/DDC"

entity ddc_entity_fbec30928b is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_in: in std_logic_vector(23 downto 0); 
    dds_cosine_in: in std_logic_vector(23 downto 0); 
    dds_msine_in: in std_logic_vector(23 downto 0); 
    dds_valid_in: in std_logic; 
    mix_i_out: out std_logic_vector(23 downto 0); 
    mix_q_out: out std_logic_vector(23 downto 0)
  );
end ddc_entity_fbec30928b;

architecture structural of ddc_entity_fbec30928b is
  signal ce_1_sg_x10: std_logic;
  signal clk_1_sg_x10: std_logic;
  signal constant1_op_net_x2: std_logic;
  signal constant2_op_net_x1: std_logic_vector(23 downto 0);
  signal dds_m_axis_data_tdata_cosine_net_x1: std_logic_vector(23 downto 0);
  signal dds_m_axis_data_tdata_sine_net_x1: std_logic_vector(23 downto 0);
  signal dds_m_axis_data_tvalid_net_x1: std_logic;
  signal delay6_q_net_x3: std_logic_vector(23 downto 0);
  signal delay7_q_net_x3: std_logic_vector(23 downto 0);
  signal register_q_net_x7: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x10 <= ce_1;
  clk_1_sg_x10 <= clk_1;
  register_q_net_x7 <= data_in;
  dds_m_axis_data_tdata_cosine_net_x1 <= dds_cosine_in;
  dds_m_axis_data_tdata_sine_net_x1 <= dds_msine_in;
  dds_m_axis_data_tvalid_net_x1 <= dds_valid_in;
  mix_i_out <= delay7_q_net_x3;
  mix_q_out <= delay6_q_net_x3;

  constant1: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant1_op_net_x2
    );

  constant2: entity work.constant_f394f3309c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net_x1
    );

  mixer_9216a510d2: entity work.mixer_entity_9216a510d2
    port map (
      ce_1 => ce_1_sg_x10,
      clk_1 => clk_1_sg_x10,
      dds_cosine => dds_m_axis_data_tdata_cosine_net_x1,
      dds_msine => dds_m_axis_data_tdata_sine_net_x1,
      dds_valid => dds_m_axis_data_tvalid_net_x1,
      din_i => register_q_net_x7,
      din_q => constant2_op_net_x1,
      en => constant1_op_net_x2,
      i => delay7_q_net_x3,
      q => delay6_q_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Channel0_tbt/decim35"

entity decim35_entity_3519cdb9ab is
  port (
    ce_1: in std_logic; 
    ce_35: in std_logic; 
    ce_logic_1: in std_logic; 
    clk_1: in std_logic; 
    clk_35: in std_logic; 
    i_in: in std_logic_vector(23 downto 0); 
    q_in: in std_logic_vector(23 downto 0); 
    i_out: out std_logic_vector(24 downto 0); 
    q_out: out std_logic_vector(24 downto 0); 
    valid_out: out std_logic
  );
end decim35_entity_3519cdb9ab;

architecture structural of decim35_entity_3519cdb9ab is
  signal ce_1_sg_x11: std_logic;
  signal ce_35_sg_x0: std_logic;
  signal ce_logic_1_sg_x3: std_logic;
  signal clk_1_sg_x11: std_logic;
  signal clk_35_sg_x0: std_logic;
  signal convert1_dout_net_x0: std_logic_vector(24 downto 0);
  signal convert2_dout_net_x0: std_logic_vector(24 downto 0);
  signal delay6_q_net_x4: std_logic_vector(23 downto 0);
  signal delay7_q_net_x4: std_logic_vector(23 downto 0);
  signal fir_compiler_6_2_m_axis_data_tdata_path0_net: std_logic_vector(44 downto 0);
  signal fir_compiler_6_2_m_axis_data_tdata_path1_net: std_logic_vector(44 downto 0);
  signal fir_compiler_6_2_m_axis_data_tvalid_net_x0: std_logic;
  signal reinterpret1_output_port_net: std_logic_vector(44 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(44 downto 0);

begin
  ce_1_sg_x11 <= ce_1;
  ce_35_sg_x0 <= ce_35;
  ce_logic_1_sg_x3 <= ce_logic_1;
  clk_1_sg_x11 <= clk_1;
  clk_35_sg_x0 <= clk_35;
  delay7_q_net_x4 <= i_in;
  delay6_q_net_x4 <= q_in;
  i_out <= convert2_dout_net_x0;
  q_out <= convert1_dout_net_x0;
  valid_out <= fir_compiler_6_2_m_axis_data_tvalid_net_x0;

  convert1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 42,
      din_width => 45,
      dout_arith => 2,
      dout_bin_pt => 23,
      dout_width => 25,
      latency => 0,
      overflow => xlWrap,
      quantization => xlRound
    )
    port map (
      ce => ce_35_sg_x0,
      clk => clk_35_sg_x0,
      clr => '0',
      din => reinterpret_output_port_net,
      en => "1",
      dout => convert1_dout_net_x0
    );

  convert2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 42,
      din_width => 45,
      dout_arith => 2,
      dout_bin_pt => 23,
      dout_width => 25,
      latency => 0,
      overflow => xlWrap,
      quantization => xlRound
    )
    port map (
      ce => ce_35_sg_x0,
      clk => clk_35_sg_x0,
      clr => '0',
      din => reinterpret1_output_port_net,
      en => "1",
      dout => convert2_dout_net_x0
    );

  fir_compiler_6_2: entity work.xlfir_compiler_24f176e0342d4988e8dbf5de97e4068c
    port map (
      ce => ce_1_sg_x11,
      ce_35 => ce_35_sg_x0,
      ce_logic_1 => ce_logic_1_sg_x3,
      clk => clk_1_sg_x11,
      clk_35 => clk_35_sg_x0,
      clk_logic_1 => clk_1_sg_x11,
      s_axis_data_tdata_path0 => delay7_q_net_x4,
      s_axis_data_tdata_path1 => delay6_q_net_x4,
      src_ce => ce_1_sg_x11,
      src_clk => clk_1_sg_x11,
      m_axis_data_tdata_path0 => fir_compiler_6_2_m_axis_data_tdata_path0_net,
      m_axis_data_tdata_path1 => fir_compiler_6_2_m_axis_data_tdata_path1_net,
      m_axis_data_tvalid => fir_compiler_6_2_m_axis_data_tvalid_net_x0
    );

  reinterpret: entity work.reinterpret_82c3c799ff
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => fir_compiler_6_2_m_axis_data_tdata_path1_net,
      output_port => reinterpret_output_port_net
    );

  reinterpret1: entity work.reinterpret_82c3c799ff
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => fir_compiler_6_2_m_axis_data_tdata_path0_net,
      output_port => reinterpret1_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Channel0_tbt"

entity channel0_tbt_entity_b3ebb9eccb is
  port (
    ce_1: in std_logic; 
    ce_35: in std_logic; 
    ce_logic_1: in std_logic; 
    clk_1: in std_logic; 
    clk_35: in std_logic; 
    data_in: in std_logic_vector(23 downto 0); 
    dds_cosine_in: in std_logic_vector(23 downto 0); 
    dds_msine_in: in std_logic_vector(23 downto 0); 
    dds_valid_in: in std_logic; 
    amp_f: out std_logic_vector(24 downto 0); 
    decim_35_i_fpga_out: out std_logic_vector(24 downto 0); 
    decim_35_q_fpga_out: out std_logic_vector(24 downto 0); 
    mix_i: out std_logic_vector(23 downto 0); 
    mix_q: out std_logic_vector(23 downto 0); 
    valid_f: out std_logic
  );
end channel0_tbt_entity_b3ebb9eccb;

architecture structural of channel0_tbt_entity_b3ebb9eccb is
  signal ce_1_sg_x12: std_logic;
  signal ce_35_sg_x1: std_logic;
  signal ce_logic_1_sg_x4: std_logic;
  signal clk_1_sg_x12: std_logic;
  signal clk_35_sg_x1: std_logic;
  signal convert1_dout_net_x1: std_logic_vector(24 downto 0);
  signal convert2_dout_net_x1: std_logic_vector(24 downto 0);
  signal dds_m_axis_data_tdata_cosine_net_x2: std_logic_vector(23 downto 0);
  signal dds_m_axis_data_tdata_sine_net_x2: std_logic_vector(23 downto 0);
  signal dds_m_axis_data_tvalid_net_x2: std_logic;
  signal delay6_q_net_x5: std_logic_vector(23 downto 0);
  signal delay7_q_net_x5: std_logic_vector(23 downto 0);
  signal fir_compiler_6_2_m_axis_data_tvalid_net_x0: std_logic;
  signal rect2pol_m_axis_dout_tdata_real_net: std_logic_vector(24 downto 0);
  signal rect2pol_m_axis_dout_tvalid_net: std_logic;
  signal register5_q_net_x0: std_logic_vector(24 downto 0);
  signal register6_q_net_x0: std_logic;
  signal register_q_net_x8: std_logic_vector(23 downto 0);
  signal reinterpret3_output_port_net: std_logic_vector(24 downto 0);

begin
  ce_1_sg_x12 <= ce_1;
  ce_35_sg_x1 <= ce_35;
  ce_logic_1_sg_x4 <= ce_logic_1;
  clk_1_sg_x12 <= clk_1;
  clk_35_sg_x1 <= clk_35;
  register_q_net_x8 <= data_in;
  dds_m_axis_data_tdata_cosine_net_x2 <= dds_cosine_in;
  dds_m_axis_data_tdata_sine_net_x2 <= dds_msine_in;
  dds_m_axis_data_tvalid_net_x2 <= dds_valid_in;
  amp_f <= register5_q_net_x0;
  decim_35_i_fpga_out <= convert2_dout_net_x1;
  decim_35_q_fpga_out <= convert1_dout_net_x1;
  mix_i <= delay7_q_net_x5;
  mix_q <= delay6_q_net_x5;
  valid_f <= register6_q_net_x0;

  ddc_fbec30928b: entity work.ddc_entity_fbec30928b
    port map (
      ce_1 => ce_1_sg_x12,
      clk_1 => clk_1_sg_x12,
      data_in => register_q_net_x8,
      dds_cosine_in => dds_m_axis_data_tdata_cosine_net_x2,
      dds_msine_in => dds_m_axis_data_tdata_sine_net_x2,
      dds_valid_in => dds_m_axis_data_tvalid_net_x2,
      mix_i_out => delay7_q_net_x5,
      mix_q_out => delay6_q_net_x5
    );

  decim35_3519cdb9ab: entity work.decim35_entity_3519cdb9ab
    port map (
      ce_1 => ce_1_sg_x12,
      ce_35 => ce_35_sg_x1,
      ce_logic_1 => ce_logic_1_sg_x4,
      clk_1 => clk_1_sg_x12,
      clk_35 => clk_35_sg_x1,
      i_in => delay7_q_net_x5,
      q_in => delay6_q_net_x5,
      i_out => convert2_dout_net_x1,
      q_out => convert1_dout_net_x1,
      valid_out => fir_compiler_6_2_m_axis_data_tvalid_net_x0
    );

  rect2pol: entity work.xlcordic_c062cc3a2d77ede2032de397150e15cd
    port map (
      ce => ce_35_sg_x1,
      clk => clk_35_sg_x1,
      s_axis_cartesian_tdata_imag => convert1_dout_net_x1,
      s_axis_cartesian_tdata_real => convert2_dout_net_x1,
      s_axis_cartesian_tvalid => fir_compiler_6_2_m_axis_data_tvalid_net_x0,
      m_axis_dout_tdata_real => rect2pol_m_axis_dout_tdata_real_net,
      m_axis_dout_tvalid => rect2pol_m_axis_dout_tvalid_net
    );

  register5: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_35_sg_x1,
      clk => clk_35_sg_x1,
      d => reinterpret3_output_port_net,
      en(0) => rect2pol_m_axis_dout_tvalid_net,
      rst => "0",
      q => register5_q_net_x0
    );

  register6: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_35_sg_x1,
      clk => clk_35_sg_x1,
      d(0) => rect2pol_m_axis_dout_tvalid_net,
      en => "1",
      rst => "0",
      q(0) => register6_q_net_x0
    );

  reinterpret3: entity work.reinterpret_31a4235b32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rect2pol_m_axis_dout_tdata_real_net,
      output_port => reinterpret3_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Decim_monit/Gain"

entity gain_entity_c82a35e1b7 is
  port (
    ce_11130000: in std_logic; 
    clk_11130000: in std_logic; 
    data_in: in std_logic_vector(41 downto 0); 
    en: in std_logic; 
    data_out: out std_logic_vector(23 downto 0)
  );
end gain_entity_c82a35e1b7;

architecture structural of gain_entity_c82a35e1b7 is
  signal ce_11130000_sg_x0: std_logic;
  signal clk_11130000_sg_x0: std_logic;
  signal pfir_monit_m_axis_data_tdata_path3_net_x0: std_logic_vector(41 downto 0);
  signal pfir_monit_m_axis_data_tvalid_net_x0: std_logic;
  signal register_q_net_x0: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(23 downto 0);
  signal slice_y_net: std_logic_vector(23 downto 0);

begin
  ce_11130000_sg_x0 <= ce_11130000;
  clk_11130000_sg_x0 <= clk_11130000;
  pfir_monit_m_axis_data_tdata_path3_net_x0 <= data_in;
  pfir_monit_m_axis_data_tvalid_net_x0 <= en;
  data_out <= register_q_net_x0;

  register_x0: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_11130000_sg_x0,
      clk => clk_11130000_sg_x0,
      d => reinterpret_output_port_net,
      en(0) => pfir_monit_m_axis_data_tvalid_net_x0,
      rst => "0",
      q => register_q_net_x0
    );

  reinterpret: entity work.reinterpret_4bf1ad328a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_y_net,
      output_port => reinterpret_output_port_net
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 18,
      new_msb => 41,
      x_width => 42,
      y_width => 24
    )
    port map (
      x => pfir_monit_m_axis_data_tdata_path3_net_x0,
      y => slice_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Decim_monit/Gain3"

entity gain3_entity_07864b9c07 is
  port (
    ce_11130000: in std_logic; 
    clk_11130000: in std_logic; 
    data_in: in std_logic_vector(41 downto 0); 
    en: in std_logic; 
    data_out: out std_logic_vector(23 downto 0)
  );
end gain3_entity_07864b9c07;

architecture structural of gain3_entity_07864b9c07 is
  signal ce_11130000_sg_x3: std_logic;
  signal clk_11130000_sg_x3: std_logic;
  signal pfir_monit_m_axis_data_tdata_path0_net_x0: std_logic_vector(41 downto 0);
  signal pfir_monit_m_axis_data_tvalid_net_x3: std_logic;
  signal register_q_net_x0: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(23 downto 0);
  signal slice_y_net: std_logic_vector(23 downto 0);

begin
  ce_11130000_sg_x3 <= ce_11130000;
  clk_11130000_sg_x3 <= clk_11130000;
  pfir_monit_m_axis_data_tdata_path0_net_x0 <= data_in;
  pfir_monit_m_axis_data_tvalid_net_x3 <= en;
  data_out <= register_q_net_x0;

  register_x0: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_11130000_sg_x3,
      clk => clk_11130000_sg_x3,
      d => reinterpret_output_port_net,
      en(0) => pfir_monit_m_axis_data_tvalid_net_x3,
      rst => "0",
      q => register_q_net_x0
    );

  reinterpret: entity work.reinterpret_4bf1ad328a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_y_net,
      output_port => reinterpret_output_port_net
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 18,
      new_msb => 41,
      x_width => 42,
      y_width => 24
    )
    port map (
      x => pfir_monit_m_axis_data_tdata_path0_net_x0,
      y => slice_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Decim_monit/Round"

entity round_entity_6e68a17197 is
  port (
    ce_2782500: in std_logic; 
    clk_2782500: in std_logic; 
    data_in: in std_logic_vector(23 downto 0); 
    en: in std_logic; 
    out_x0: out std_logic_vector(23 downto 0)
  );
end round_entity_6e68a17197;

architecture structural of round_entity_6e68a17197 is
  signal ce_2782500_sg_x0: std_logic;
  signal cic_monit_x_m_axis_data_tdata_data_net_x0: std_logic_vector(23 downto 0);
  signal cic_monit_x_m_axis_data_tvalid_net_x0: std_logic;
  signal clk_2782500_sg_x0: std_logic;
  signal convert_dout_net: std_logic_vector(23 downto 0);
  signal register_q_net_x0: std_logic_vector(23 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(23 downto 0);

begin
  ce_2782500_sg_x0 <= ce_2782500;
  clk_2782500_sg_x0 <= clk_2782500;
  cic_monit_x_m_axis_data_tdata_data_net_x0 <= data_in;
  cic_monit_x_m_axis_data_tvalid_net_x0 <= en;
  out_x0 <= register_q_net_x0;

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 24,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 24,
      latency => 0,
      overflow => xlWrap,
      quantization => xlRound
    )
    port map (
      ce => ce_2782500_sg_x0,
      clk => clk_2782500_sg_x0,
      clr => '0',
      din => reinterpret1_output_port_net,
      en => "1",
      dout => convert_dout_net
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_2782500_sg_x0,
      clk => clk_2782500_sg_x0,
      d => convert_dout_net,
      en(0) => cic_monit_x_m_axis_data_tvalid_net_x0,
      rst => "0",
      q => register_q_net_x0
    );

  reinterpret1: entity work.reinterpret_b62f4240f0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => cic_monit_x_m_axis_data_tdata_data_net_x0,
      output_port => reinterpret1_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Decim_monit/Round1"

entity round1_entity_7dcba70ce3 is
  port (
    ce_5565000: in std_logic; 
    clk_5565000: in std_logic; 
    data_in: in std_logic_vector(41 downto 0); 
    en: in std_logic; 
    out_x0: out std_logic_vector(23 downto 0)
  );
end round1_entity_7dcba70ce3;

architecture structural of round1_entity_7dcba70ce3 is
  signal ce_5565000_sg_x0: std_logic;
  signal cfir_monit_m_axis_data_tdata_path3_net_x0: std_logic_vector(41 downto 0);
  signal cfir_monit_m_axis_data_tvalid_net_x0: std_logic;
  signal clk_5565000_sg_x0: std_logic;
  signal convert_dout_net: std_logic_vector(23 downto 0);
  signal register_q_net_x0: std_logic_vector(23 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(41 downto 0);

begin
  ce_5565000_sg_x0 <= ce_5565000;
  clk_5565000_sg_x0 <= clk_5565000;
  cfir_monit_m_axis_data_tdata_path3_net_x0 <= data_in;
  cfir_monit_m_axis_data_tvalid_net_x0 <= en;
  out_x0 <= register_q_net_x0;

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 18,
      din_width => 42,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 24,
      latency => 0,
      overflow => xlWrap,
      quantization => xlRound
    )
    port map (
      ce => ce_5565000_sg_x0,
      clk => clk_5565000_sg_x0,
      clr => '0',
      din => reinterpret1_output_port_net,
      en => "1",
      dout => convert_dout_net
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_5565000_sg_x0,
      clk => clk_5565000_sg_x0,
      d => convert_dout_net,
      en(0) => cfir_monit_m_axis_data_tvalid_net_x0,
      rst => "0",
      q => register_q_net_x0
    );

  reinterpret1: entity work.reinterpret_c1a6347d0b
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => cfir_monit_m_axis_data_tdata_path3_net_x0,
      output_port => reinterpret1_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Decim_monit"

entity decim_monit_entity_56a50fad1d is
  port (
    ce_1: in std_logic; 
    ce_1113: in std_logic; 
    ce_11130000: in std_logic; 
    ce_2782500: in std_logic; 
    ce_5565000: in std_logic; 
    ce_logic_1113: in std_logic; 
    ce_logic_2782500: in std_logic; 
    ce_logic_5565000: in std_logic; 
    clk_1: in std_logic; 
    clk_1113: in std_logic; 
    clk_11130000: in std_logic; 
    clk_2782500: in std_logic; 
    clk_5565000: in std_logic; 
    data_in_q: in std_logic_vector(23 downto 0); 
    data_in_sum: in std_logic_vector(23 downto 0); 
    data_in_x: in std_logic_vector(23 downto 0); 
    data_in_y: in std_logic_vector(23 downto 0); 
    monit_q_out: out std_logic_vector(23 downto 0); 
    monit_sum_out: out std_logic_vector(23 downto 0); 
    monit_x_out: out std_logic_vector(23 downto 0); 
    monit_y_out: out std_logic_vector(23 downto 0)
  );
end decim_monit_entity_56a50fad1d;

architecture structural of decim_monit_entity_56a50fad1d is
  signal ce_11130000_sg_x4: std_logic;
  signal ce_1113_sg_x8: std_logic;
  signal ce_1_sg_x37: std_logic;
  signal ce_2782500_sg_x4: std_logic;
  signal ce_5565000_sg_x4: std_logic;
  signal ce_logic_1113_sg_x0: std_logic;
  signal ce_logic_2782500_sg_x0: std_logic;
  signal ce_logic_5565000_sg_x0: std_logic;
  signal cfir_monit_m_axis_data_tdata_path0_net_x0: std_logic_vector(41 downto 0);
  signal cfir_monit_m_axis_data_tdata_path1_net_x0: std_logic_vector(41 downto 0);
  signal cfir_monit_m_axis_data_tdata_path2_net_x0: std_logic_vector(41 downto 0);
  signal cfir_monit_m_axis_data_tdata_path3_net_x0: std_logic_vector(41 downto 0);
  signal cfir_monit_m_axis_data_tvalid_net_x3: std_logic;
  signal cic_monit_q_m_axis_data_tdata_data_net_x0: std_logic_vector(23 downto 0);
  signal cic_monit_q_m_axis_data_tvalid_net_x0: std_logic;
  signal cic_monit_sum_m_axis_data_tdata_data_net_x0: std_logic_vector(23 downto 0);
  signal cic_monit_sum_m_axis_data_tvalid_net_x0: std_logic;
  signal cic_monit_x_m_axis_data_tdata_data_net_x0: std_logic_vector(23 downto 0);
  signal cic_monit_x_m_axis_data_tvalid_net_x0: std_logic;
  signal cic_monit_y_m_axis_data_tdata_data_net_x0: std_logic_vector(23 downto 0);
  signal cic_monit_y_m_axis_data_tvalid_net_x0: std_logic;
  signal clk_11130000_sg_x4: std_logic;
  signal clk_1113_sg_x8: std_logic;
  signal clk_1_sg_x37: std_logic;
  signal clk_2782500_sg_x4: std_logic;
  signal clk_5565000_sg_x4: std_logic;
  signal down_sample1_q_net_x0: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x0: std_logic_vector(23 downto 0);
  signal down_sample3_q_net_x0: std_logic_vector(23 downto 0);
  signal down_sample_q_net_x0: std_logic_vector(23 downto 0);
  signal pfir_monit_m_axis_data_tdata_path0_net_x0: std_logic_vector(41 downto 0);
  signal pfir_monit_m_axis_data_tdata_path1_net_x0: std_logic_vector(41 downto 0);
  signal pfir_monit_m_axis_data_tdata_path2_net_x0: std_logic_vector(41 downto 0);
  signal pfir_monit_m_axis_data_tdata_path3_net_x0: std_logic_vector(41 downto 0);
  signal pfir_monit_m_axis_data_tvalid_net_x3: std_logic;
  signal register_q_net_x10: std_logic_vector(23 downto 0);
  signal register_q_net_x11: std_logic_vector(23 downto 0);
  signal register_q_net_x12: std_logic_vector(23 downto 0);
  signal register_q_net_x13: std_logic_vector(23 downto 0);
  signal register_q_net_x14: std_logic_vector(23 downto 0);
  signal register_q_net_x15: std_logic_vector(23 downto 0);
  signal register_q_net_x4: std_logic_vector(23 downto 0);
  signal register_q_net_x5: std_logic_vector(23 downto 0);
  signal register_q_net_x6: std_logic_vector(23 downto 0);
  signal register_q_net_x7: std_logic_vector(23 downto 0);
  signal register_q_net_x8: std_logic_vector(23 downto 0);
  signal register_q_net_x9: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x37 <= ce_1;
  ce_1113_sg_x8 <= ce_1113;
  ce_11130000_sg_x4 <= ce_11130000;
  ce_2782500_sg_x4 <= ce_2782500;
  ce_5565000_sg_x4 <= ce_5565000;
  ce_logic_1113_sg_x0 <= ce_logic_1113;
  ce_logic_2782500_sg_x0 <= ce_logic_2782500;
  ce_logic_5565000_sg_x0 <= ce_logic_5565000;
  clk_1_sg_x37 <= clk_1;
  clk_1113_sg_x8 <= clk_1113;
  clk_11130000_sg_x4 <= clk_11130000;
  clk_2782500_sg_x4 <= clk_2782500;
  clk_5565000_sg_x4 <= clk_5565000;
  down_sample2_q_net_x0 <= data_in_q;
  down_sample3_q_net_x0 <= data_in_sum;
  down_sample_q_net_x0 <= data_in_x;
  down_sample1_q_net_x0 <= data_in_y;
  monit_q_out <= register_q_net_x14;
  monit_sum_out <= register_q_net_x15;
  monit_x_out <= register_q_net_x12;
  monit_y_out <= register_q_net_x13;

  cfir_monit: entity work.xlfir_compiler_de2b66bb8c2a41b6db4d8e9527cbaa93
    port map (
      ce => ce_1_sg_x37,
      ce_2782500 => ce_2782500_sg_x4,
      ce_5565000 => ce_5565000_sg_x4,
      ce_logic_2782500 => ce_logic_2782500_sg_x0,
      clk => clk_1_sg_x37,
      clk_2782500 => clk_2782500_sg_x4,
      clk_5565000 => clk_5565000_sg_x4,
      clk_logic_2782500 => clk_2782500_sg_x4,
      s_axis_data_tdata_path0 => register_q_net_x10,
      s_axis_data_tdata_path1 => register_q_net_x7,
      s_axis_data_tdata_path2 => register_q_net_x6,
      s_axis_data_tdata_path3 => register_q_net_x4,
      src_ce => ce_2782500_sg_x4,
      src_clk => clk_2782500_sg_x4,
      m_axis_data_tdata_path0 => cfir_monit_m_axis_data_tdata_path0_net_x0,
      m_axis_data_tdata_path1 => cfir_monit_m_axis_data_tdata_path1_net_x0,
      m_axis_data_tdata_path2 => cfir_monit_m_axis_data_tdata_path2_net_x0,
      m_axis_data_tdata_path3 => cfir_monit_m_axis_data_tdata_path3_net_x0,
      m_axis_data_tvalid => cfir_monit_m_axis_data_tvalid_net_x3
    );

  cic_monit_q: entity work.xlcic_compiler_95547d442151284e81277c01e1dd33ef
    port map (
      ce => ce_1_sg_x37,
      ce_1113 => ce_1113_sg_x8,
      ce_2782500 => ce_2782500_sg_x4,
      ce_logic_1113 => ce_logic_1113_sg_x0,
      clk => clk_1_sg_x37,
      clk_1113 => clk_1113_sg_x8,
      clk_2782500 => clk_2782500_sg_x4,
      clk_logic_1113 => clk_1113_sg_x8,
      s_axis_data_tdata_data => down_sample2_q_net_x0,
      m_axis_data_tdata_data => cic_monit_q_m_axis_data_tdata_data_net_x0,
      m_axis_data_tvalid => cic_monit_q_m_axis_data_tvalid_net_x0
    );

  cic_monit_sum: entity work.xlcic_compiler_95547d442151284e81277c01e1dd33ef
    port map (
      ce => ce_1_sg_x37,
      ce_1113 => ce_1113_sg_x8,
      ce_2782500 => ce_2782500_sg_x4,
      ce_logic_1113 => ce_logic_1113_sg_x0,
      clk => clk_1_sg_x37,
      clk_1113 => clk_1113_sg_x8,
      clk_2782500 => clk_2782500_sg_x4,
      clk_logic_1113 => clk_1113_sg_x8,
      s_axis_data_tdata_data => down_sample3_q_net_x0,
      m_axis_data_tdata_data => cic_monit_sum_m_axis_data_tdata_data_net_x0,
      m_axis_data_tvalid => cic_monit_sum_m_axis_data_tvalid_net_x0
    );

  cic_monit_x: entity work.xlcic_compiler_95547d442151284e81277c01e1dd33ef
    port map (
      ce => ce_1_sg_x37,
      ce_1113 => ce_1113_sg_x8,
      ce_2782500 => ce_2782500_sg_x4,
      ce_logic_1113 => ce_logic_1113_sg_x0,
      clk => clk_1_sg_x37,
      clk_1113 => clk_1113_sg_x8,
      clk_2782500 => clk_2782500_sg_x4,
      clk_logic_1113 => clk_1113_sg_x8,
      s_axis_data_tdata_data => down_sample_q_net_x0,
      m_axis_data_tdata_data => cic_monit_x_m_axis_data_tdata_data_net_x0,
      m_axis_data_tvalid => cic_monit_x_m_axis_data_tvalid_net_x0
    );

  cic_monit_y: entity work.xlcic_compiler_95547d442151284e81277c01e1dd33ef
    port map (
      ce => ce_1_sg_x37,
      ce_1113 => ce_1113_sg_x8,
      ce_2782500 => ce_2782500_sg_x4,
      ce_logic_1113 => ce_logic_1113_sg_x0,
      clk => clk_1_sg_x37,
      clk_1113 => clk_1113_sg_x8,
      clk_2782500 => clk_2782500_sg_x4,
      clk_logic_1113 => clk_1113_sg_x8,
      s_axis_data_tdata_data => down_sample1_q_net_x0,
      m_axis_data_tdata_data => cic_monit_y_m_axis_data_tdata_data_net_x0,
      m_axis_data_tvalid => cic_monit_y_m_axis_data_tvalid_net_x0
    );

  gain1_74aba2b35f: entity work.gain_entity_c82a35e1b7
    port map (
      ce_11130000 => ce_11130000_sg_x4,
      clk_11130000 => clk_11130000_sg_x4,
      data_in => pfir_monit_m_axis_data_tdata_path2_net_x0,
      en => pfir_monit_m_axis_data_tvalid_net_x3,
      data_out => register_q_net_x13
    );

  gain2_600df01b36: entity work.gain_entity_c82a35e1b7
    port map (
      ce_11130000 => ce_11130000_sg_x4,
      clk_11130000 => clk_11130000_sg_x4,
      data_in => pfir_monit_m_axis_data_tdata_path1_net_x0,
      en => pfir_monit_m_axis_data_tvalid_net_x3,
      data_out => register_q_net_x14
    );

  gain3_07864b9c07: entity work.gain3_entity_07864b9c07
    port map (
      ce_11130000 => ce_11130000_sg_x4,
      clk_11130000 => clk_11130000_sg_x4,
      data_in => pfir_monit_m_axis_data_tdata_path0_net_x0,
      en => pfir_monit_m_axis_data_tvalid_net_x3,
      data_out => register_q_net_x15
    );

  gain_c82a35e1b7: entity work.gain_entity_c82a35e1b7
    port map (
      ce_11130000 => ce_11130000_sg_x4,
      clk_11130000 => clk_11130000_sg_x4,
      data_in => pfir_monit_m_axis_data_tdata_path3_net_x0,
      en => pfir_monit_m_axis_data_tvalid_net_x3,
      data_out => register_q_net_x12
    );

  pfir_monit: entity work.xlfir_compiler_2640fa61db1e65b90e6e492f7e8bf9cd
    port map (
      ce => ce_1_sg_x37,
      ce_11130000 => ce_11130000_sg_x4,
      ce_5565000 => ce_5565000_sg_x4,
      ce_logic_5565000 => ce_logic_5565000_sg_x0,
      clk => clk_1_sg_x37,
      clk_11130000 => clk_11130000_sg_x4,
      clk_5565000 => clk_5565000_sg_x4,
      clk_logic_5565000 => clk_5565000_sg_x4,
      s_axis_data_tdata_path0 => register_q_net_x11,
      s_axis_data_tdata_path1 => register_q_net_x9,
      s_axis_data_tdata_path2 => register_q_net_x8,
      s_axis_data_tdata_path3 => register_q_net_x5,
      src_ce => ce_5565000_sg_x4,
      src_clk => clk_5565000_sg_x4,
      m_axis_data_tdata_path0 => pfir_monit_m_axis_data_tdata_path0_net_x0,
      m_axis_data_tdata_path1 => pfir_monit_m_axis_data_tdata_path1_net_x0,
      m_axis_data_tdata_path2 => pfir_monit_m_axis_data_tdata_path2_net_x0,
      m_axis_data_tdata_path3 => pfir_monit_m_axis_data_tdata_path3_net_x0,
      m_axis_data_tvalid => pfir_monit_m_axis_data_tvalid_net_x3
    );

  round1_7dcba70ce3: entity work.round1_entity_7dcba70ce3
    port map (
      ce_5565000 => ce_5565000_sg_x4,
      clk_5565000 => clk_5565000_sg_x4,
      data_in => cfir_monit_m_axis_data_tdata_path3_net_x0,
      en => cfir_monit_m_axis_data_tvalid_net_x3,
      out_x0 => register_q_net_x5
    );

  round2_685d4a8843: entity work.round_entity_6e68a17197
    port map (
      ce_2782500 => ce_2782500_sg_x4,
      clk_2782500 => clk_2782500_sg_x4,
      data_in => cic_monit_y_m_axis_data_tdata_data_net_x0,
      en => cic_monit_y_m_axis_data_tvalid_net_x0,
      out_x0 => register_q_net_x6
    );

  round3_d2af32cfdc: entity work.round_entity_6e68a17197
    port map (
      ce_2782500 => ce_2782500_sg_x4,
      clk_2782500 => clk_2782500_sg_x4,
      data_in => cic_monit_q_m_axis_data_tdata_data_net_x0,
      en => cic_monit_q_m_axis_data_tvalid_net_x0,
      out_x0 => register_q_net_x7
    );

  round4_c456a5c8e2: entity work.round1_entity_7dcba70ce3
    port map (
      ce_5565000 => ce_5565000_sg_x4,
      clk_5565000 => clk_5565000_sg_x4,
      data_in => cfir_monit_m_axis_data_tdata_path2_net_x0,
      en => cfir_monit_m_axis_data_tvalid_net_x3,
      out_x0 => register_q_net_x8
    );

  round5_fedc172384: entity work.round1_entity_7dcba70ce3
    port map (
      ce_5565000 => ce_5565000_sg_x4,
      clk_5565000 => clk_5565000_sg_x4,
      data_in => cfir_monit_m_axis_data_tdata_path1_net_x0,
      en => cfir_monit_m_axis_data_tvalid_net_x3,
      out_x0 => register_q_net_x9
    );

  round6_05681c9d60: entity work.round_entity_6e68a17197
    port map (
      ce_2782500 => ce_2782500_sg_x4,
      clk_2782500 => clk_2782500_sg_x4,
      data_in => cic_monit_sum_m_axis_data_tdata_data_net_x0,
      en => cic_monit_sum_m_axis_data_tvalid_net_x0,
      out_x0 => register_q_net_x10
    );

  round7_dd6adb35a8: entity work.round1_entity_7dcba70ce3
    port map (
      ce_5565000 => ce_5565000_sg_x4,
      clk_5565000 => clk_5565000_sg_x4,
      data_in => cfir_monit_m_axis_data_tdata_path0_net_x0,
      en => cfir_monit_m_axis_data_tvalid_net_x3,
      out_x0 => register_q_net_x11
    );

  round_6e68a17197: entity work.round_entity_6e68a17197
    port map (
      ce_2782500 => ce_2782500_sg_x4,
      clk_2782500 => clk_2782500_sg_x4,
      data_in => cic_monit_x_m_axis_data_tdata_data_net_x0,
      en => cic_monit_x_m_axis_data_tvalid_net_x0,
      out_x0 => register_q_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/delta-sigma_fofb/DataReg_En"

entity datareg_en_entity_79473f9ed1 is
  port (
    ce_1113: in std_logic; 
    clk_1113: in std_logic; 
    din: in std_logic_vector(26 downto 0); 
    en: in std_logic; 
    dout: out std_logic_vector(26 downto 0)
  );
end datareg_en_entity_79473f9ed1;

architecture structural of datareg_en_entity_79473f9ed1 is
  signal ce_1113_sg_x9: std_logic;
  signal clk_1113_sg_x9: std_logic;
  signal delta_x_s_net_x0: std_logic_vector(26 downto 0);
  signal register17_q_net_x0: std_logic;
  signal register_q_net_x0: std_logic_vector(26 downto 0);

begin
  ce_1113_sg_x9 <= ce_1113;
  clk_1113_sg_x9 <= clk_1113;
  delta_x_s_net_x0 <= din;
  register17_q_net_x0 <= en;
  dout <= register_q_net_x0;

  register_x0: entity work.xlregister
    generic map (
      d_width => 27,
      init_value => b"000000000000000000000000000"
    )
    port map (
      ce => ce_1113_sg_x9,
      clk => clk_1113_sg_x9,
      d => delta_x_s_net_x0,
      en(0) => register17_q_net_x0,
      rst => "0",
      q => register_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/delta-sigma_fofb/unsigned2signed1"

entity unsigned2signed1_entity_4871dec4a6 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    s_data: in std_logic_vector(26 downto 0); 
    u_data: in std_logic_vector(22 downto 0); 
    data_out: out std_logic_vector(23 downto 0)
  );
end unsigned2signed1_entity_4871dec4a6;

architecture structural of unsigned2signed1_entity_4871dec4a6 is
  signal ce_1_sg_x38: std_logic;
  signal clk_1_sg_x38: std_logic;
  signal concat_y_net: std_logic_vector(49 downto 0);
  signal convert_dout_net_x0: std_logic_vector(23 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(22 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(26 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(49 downto 0);
  signal y_divider_m_axis_dout_tdata_fractional_net_x0: std_logic_vector(22 downto 0);
  signal y_divider_m_axis_dout_tdata_quotient_net_x0: std_logic_vector(26 downto 0);

begin
  ce_1_sg_x38 <= ce_1;
  clk_1_sg_x38 <= clk_1;
  y_divider_m_axis_dout_tdata_quotient_net_x0 <= s_data;
  y_divider_m_axis_dout_tdata_fractional_net_x0 <= u_data;
  data_out <= convert_dout_net_x0;

  concat: entity work.concat_0d0fc5690d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => reinterpret2_output_port_net,
      in1 => reinterpret1_output_port_net,
      y => concat_y_net
    );

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 23,
      din_width => 50,
      dout_arith => 2,
      dout_bin_pt => 23,
      dout_width => 24,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x38,
      clk => clk_1_sg_x38,
      clr => '0',
      din => reinterpret_output_port_net,
      en => "1",
      dout => convert_dout_net_x0
    );

  reinterpret: entity work.reinterpret_1d284b35d5
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => concat_y_net,
      output_port => reinterpret_output_port_net
    );

  reinterpret1: entity work.reinterpret_48a79104f5
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => y_divider_m_axis_dout_tdata_fractional_net_x0,
      output_port => reinterpret1_output_port_net
    );

  reinterpret2: entity work.reinterpret_bf9824e821
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => y_divider_m_axis_dout_tdata_quotient_net_x0,
      output_port => reinterpret2_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/delta-sigma_fofb"

entity delta_sigma_fofb_entity_ee61e649ea is
  port (
    a: in std_logic_vector(24 downto 0); 
    avalid: in std_logic; 
    b: in std_logic_vector(24 downto 0); 
    bvalid: in std_logic; 
    c: in std_logic_vector(24 downto 0); 
    ce_1: in std_logic; 
    ce_1113: in std_logic; 
    clk_1: in std_logic; 
    clk_1113: in std_logic; 
    cvalid: in std_logic; 
    d: in std_logic_vector(24 downto 0); 
    delta_sigma_thres: in std_logic_vector(26 downto 0); 
    dvalid: in std_logic; 
    q: out std_logic_vector(23 downto 0); 
    sum_x0: out std_logic_vector(23 downto 0); 
    x: out std_logic_vector(23 downto 0); 
    y: out std_logic_vector(23 downto 0)
  );
end delta_sigma_fofb_entity_ee61e649ea;

architecture structural of delta_sigma_fofb_entity_ee61e649ea is
  signal a_plus_b_s_net: std_logic_vector(25 downto 0);
  signal a_plus_c_s_net: std_logic_vector(25 downto 0);
  signal a_plus_d_s_net: std_logic_vector(25 downto 0);
  signal b_plus_c_s_net: std_logic_vector(25 downto 0);
  signal b_plus_d_s_net: std_logic_vector(25 downto 0);
  signal c_plus_d_s_net: std_logic_vector(25 downto 0);
  signal ce_1113_sg_x13: std_logic;
  signal ce_1_sg_x41: std_logic;
  signal clk_1113_sg_x13: std_logic;
  signal clk_1_sg_x41: std_logic;
  signal convert_dout_net: std_logic_vector(23 downto 0);
  signal convert_dout_net_x0: std_logic_vector(23 downto 0);
  signal convert_dout_net_x1: std_logic_vector(23 downto 0);
  signal convert_dout_net_x2: std_logic_vector(23 downto 0);
  signal del_sig_div_fofb_thres_i_net_x0: std_logic_vector(26 downto 0);
  signal delay_q_net: std_logic_vector(26 downto 0);
  signal delta_q_s_net_x0: std_logic_vector(26 downto 0);
  signal delta_x_s_net_x0: std_logic_vector(26 downto 0);
  signal delta_y_s_net_x0: std_logic_vector(26 downto 0);
  signal expression1_dout_net: std_logic;
  signal expression_dout_net: std_logic;
  signal fifo_q_dout_net: std_logic_vector(26 downto 0);
  signal fifo_q_empty_net: std_logic;
  signal fifo_sum_dout_net: std_logic_vector(26 downto 0);
  signal fifo_sum_empty_net: std_logic;
  signal fifo_x_dout_net: std_logic_vector(26 downto 0);
  signal fifo_x_empty_net: std_logic;
  signal fifo_y_dout_net: std_logic_vector(26 downto 0);
  signal fifo_y_empty_net: std_logic;
  signal inverter1_op_net: std_logic;
  signal inverter2_op_net: std_logic;
  signal inverter3_op_net: std_logic;
  signal inverter_op_net: std_logic;
  signal q_divider_m_axis_dout_tdata_fractional_net_x0: std_logic_vector(22 downto 0);
  signal q_divider_m_axis_dout_tdata_quotient_net_x0: std_logic_vector(26 downto 0);
  signal q_divider_m_axis_dout_tvalid_net: std_logic;
  signal q_divider_s_axis_dividend_tready_net: std_logic;
  signal q_divider_s_axis_divisor_tready_net: std_logic;
  signal register11_q_net_x0: std_logic_vector(23 downto 0);
  signal register12_q_net_x0: std_logic_vector(23 downto 0);
  signal register13_q_net_x0: std_logic_vector(23 downto 0);
  signal register17_q_net_x3: std_logic;
  signal register19_q_net_x0: std_logic_vector(23 downto 0);
  signal register1_q_net: std_logic_vector(25 downto 0);
  signal register2_q_net: std_logic_vector(25 downto 0);
  signal register3_q_net: std_logic_vector(25 downto 0);
  signal register4_q_net: std_logic_vector(25 downto 0);
  signal register5_q_net: std_logic_vector(25 downto 0);
  signal register5_q_net_x4: std_logic_vector(24 downto 0);
  signal register5_q_net_x5: std_logic_vector(24 downto 0);
  signal register5_q_net_x6: std_logic_vector(24 downto 0);
  signal register5_q_net_x7: std_logic_vector(24 downto 0);
  signal register6_q_net: std_logic_vector(25 downto 0);
  signal register6_q_net_x4: std_logic;
  signal register6_q_net_x5: std_logic;
  signal register6_q_net_x6: std_logic;
  signal register6_q_net_x7: std_logic;
  signal register_q_net_x0: std_logic_vector(26 downto 0);
  signal register_q_net_x1: std_logic_vector(26 downto 0);
  signal register_q_net_x2: std_logic_vector(26 downto 0);
  signal register_q_net_x3: std_logic_vector(26 downto 0);
  signal relational_op_net: std_logic;
  signal sum_s_net_x0: std_logic_vector(26 downto 0);
  signal x_divider_m_axis_dout_tdata_fractional_net_x0: std_logic_vector(22 downto 0);
  signal x_divider_m_axis_dout_tdata_quotient_net_x0: std_logic_vector(26 downto 0);
  signal x_divider_m_axis_dout_tvalid_net: std_logic;
  signal x_divider_s_axis_dividend_tready_net: std_logic;
  signal x_divider_s_axis_divisor_tready_net: std_logic;
  signal y_divider_m_axis_dout_tdata_fractional_net_x0: std_logic_vector(22 downto 0);
  signal y_divider_m_axis_dout_tdata_quotient_net_x0: std_logic_vector(26 downto 0);
  signal y_divider_m_axis_dout_tvalid_net: std_logic;
  signal y_divider_s_axis_dividend_tready_net: std_logic;
  signal y_divider_s_axis_divisor_tready_net: std_logic;

begin
  register5_q_net_x4 <= a;
  register6_q_net_x4 <= avalid;
  register5_q_net_x5 <= b;
  register6_q_net_x5 <= bvalid;
  register5_q_net_x6 <= c;
  ce_1_sg_x41 <= ce_1;
  ce_1113_sg_x13 <= ce_1113;
  clk_1_sg_x41 <= clk_1;
  clk_1113_sg_x13 <= clk_1113;
  register6_q_net_x6 <= cvalid;
  register5_q_net_x7 <= d;
  del_sig_div_fofb_thres_i_net_x0 <= delta_sigma_thres;
  register6_q_net_x7 <= dvalid;
  q <= register12_q_net_x0;
  sum_x0 <= register19_q_net_x0;
  x <= register11_q_net_x0;
  y <= register13_q_net_x0;

  a_plus_b: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 23,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 23,
      b_width => 25,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 26,
      core_name0 => "addsb_11_0_239e4f614ba09ab1",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 26,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 23,
      s_width => 26
    )
    port map (
      a => register5_q_net_x4,
      b => register5_q_net_x5,
      ce => ce_1113_sg_x13,
      clk => clk_1113_sg_x13,
      clr => '0',
      en => "1",
      s => a_plus_b_s_net
    );

  a_plus_c: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 23,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 23,
      b_width => 25,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 26,
      core_name0 => "addsb_11_0_239e4f614ba09ab1",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 26,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 23,
      s_width => 26
    )
    port map (
      a => register5_q_net_x4,
      b => register5_q_net_x6,
      ce => ce_1113_sg_x13,
      clk => clk_1113_sg_x13,
      clr => '0',
      en => "1",
      s => a_plus_c_s_net
    );

  a_plus_d: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 23,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 23,
      b_width => 25,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 26,
      core_name0 => "addsb_11_0_239e4f614ba09ab1",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 26,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 23,
      s_width => 26
    )
    port map (
      a => register5_q_net_x4,
      b => register5_q_net_x7,
      ce => ce_1113_sg_x13,
      clk => clk_1113_sg_x13,
      clr => '0',
      en => "1",
      s => a_plus_d_s_net
    );

  b_plus_c: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 23,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 23,
      b_width => 25,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 26,
      core_name0 => "addsb_11_0_239e4f614ba09ab1",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 26,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 23,
      s_width => 26
    )
    port map (
      a => register5_q_net_x5,
      b => register5_q_net_x6,
      ce => ce_1113_sg_x13,
      clk => clk_1113_sg_x13,
      clr => '0',
      en => "1",
      s => b_plus_c_s_net
    );

  b_plus_d: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 23,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 23,
      b_width => 25,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 26,
      core_name0 => "addsb_11_0_239e4f614ba09ab1",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 26,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 23,
      s_width => 26
    )
    port map (
      a => register5_q_net_x5,
      b => register5_q_net_x7,
      ce => ce_1113_sg_x13,
      clk => clk_1113_sg_x13,
      clr => '0',
      en => "1",
      s => b_plus_d_s_net
    );

  c_plus_d: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 23,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 23,
      b_width => 25,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 26,
      core_name0 => "addsb_11_0_239e4f614ba09ab1",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 26,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 23,
      s_width => 26
    )
    port map (
      a => register5_q_net_x6,
      b => register5_q_net_x7,
      ce => ce_1113_sg_x13,
      clk => clk_1113_sg_x13,
      clr => '0',
      en => "1",
      s => c_plus_d_s_net
    );

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 23,
      din_width => 27,
      dout_arith => 2,
      dout_bin_pt => 20,
      dout_width => 24,
      latency => 0,
      overflow => xlWrap,
      quantization => xlRound
    )
    port map (
      ce => ce_1_sg_x41,
      clk => clk_1_sg_x41,
      clr => '0',
      din => delay_q_net,
      en => "1",
      dout => convert_dout_net
    );

  datareg_en1_3225c09afc: entity work.datareg_en_entity_79473f9ed1
    port map (
      ce_1113 => ce_1113_sg_x13,
      clk_1113 => clk_1113_sg_x13,
      din => sum_s_net_x0,
      en => register17_q_net_x3,
      dout => register_q_net_x1
    );

  datareg_en2_5b5f4b61b7: entity work.datareg_en_entity_79473f9ed1
    port map (
      ce_1113 => ce_1113_sg_x13,
      clk_1113 => clk_1113_sg_x13,
      din => delta_y_s_net_x0,
      en => register17_q_net_x3,
      dout => register_q_net_x2
    );

  datareg_en3_6643090018: entity work.datareg_en_entity_79473f9ed1
    port map (
      ce_1113 => ce_1113_sg_x13,
      clk_1113 => clk_1113_sg_x13,
      din => delta_q_s_net_x0,
      en => register17_q_net_x3,
      dout => register_q_net_x3
    );

  datareg_en_79473f9ed1: entity work.datareg_en_entity_79473f9ed1
    port map (
      ce_1113 => ce_1113_sg_x13,
      clk_1113 => clk_1113_sg_x13,
      din => delta_x_s_net_x0,
      en => register17_q_net_x3,
      dout => register_q_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 39,
      reg_retiming => 0,
      reset => 0,
      width => 27
    )
    port map (
      ce => ce_1_sg_x41,
      clk => clk_1_sg_x41,
      d => fifo_sum_dout_net,
      en => '1',
      rst => '1',
      q => delay_q_net
    );

  delta_q: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 23,
      a_width => 26,
      b_arith => xlSigned,
      b_bin_pt => 23,
      b_width => 26,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 27,
      core_name0 => "addsb_11_0_1482f9e8df81448a",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 27,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 23,
      s_width => 27
    )
    port map (
      a => register5_q_net,
      b => register6_q_net,
      ce => ce_1113_sg_x13,
      clk => clk_1113_sg_x13,
      clr => '0',
      en => "1",
      s => delta_q_s_net_x0
    );

  delta_x: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 23,
      a_width => 26,
      b_arith => xlSigned,
      b_bin_pt => 23,
      b_width => 26,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 27,
      core_name0 => "addsb_11_0_1482f9e8df81448a",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 27,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 23,
      s_width => 27
    )
    port map (
      a => register1_q_net,
      b => register3_q_net,
      ce => ce_1113_sg_x13,
      clk => clk_1113_sg_x13,
      clr => '0',
      en => "1",
      s => delta_x_s_net_x0
    );

  delta_y: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 23,
      a_width => 26,
      b_arith => xlSigned,
      b_bin_pt => 23,
      b_width => 26,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 27,
      core_name0 => "addsb_11_0_1482f9e8df81448a",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 27,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 23,
      s_width => 27
    )
    port map (
      a => register2_q_net,
      b => register4_q_net,
      ce => ce_1113_sg_x13,
      clk => clk_1113_sg_x13,
      clr => '0',
      en => "1",
      s => delta_y_s_net_x0
    );

  expression: entity work.expr_24cbf78c62
    port map (
      a(0) => register6_q_net_x4,
      b(0) => register6_q_net_x5,
      c(0) => register6_q_net_x6,
      ce => '0',
      clk => '0',
      clr => '0',
      d(0) => register6_q_net_x7,
      dout(0) => expression_dout_net
    );

  expression1: entity work.expr_375d7bbece
    port map (
      a(0) => x_divider_s_axis_divisor_tready_net,
      b(0) => y_divider_s_axis_divisor_tready_net,
      c(0) => q_divider_s_axis_divisor_tready_net,
      ce => '0',
      clk => '0',
      clr => '0',
      dout(0) => expression1_dout_net
    );

  fifo_q: entity work.xlfifogen
    generic map (
      core_name0 => "fifo_fg84_5b68f376f783a64c",
      data_count_width => 6,
      data_width => 27,
      has_ae => 0,
      has_af => 0,
      percent_full_width => 1
    )
    port map (
      ce => ce_1_sg_x41,
      clk => clk_1_sg_x41,
      din => register_q_net_x3,
      en => '1',
      re => q_divider_s_axis_dividend_tready_net,
      re_ce => ce_1_sg_x41,
      rst => '1',
      we => relational_op_net,
      we_ce => ce_1_sg_x41,
      dout => fifo_q_dout_net,
      empty => fifo_q_empty_net
    );

  fifo_sum: entity work.xlfifogen
    generic map (
      core_name0 => "fifo_fg84_5b68f376f783a64c",
      data_count_width => 6,
      data_width => 27,
      has_ae => 0,
      has_af => 0,
      percent_full_width => 1
    )
    port map (
      ce => ce_1_sg_x41,
      clk => clk_1_sg_x41,
      din => register_q_net_x1,
      en => '1',
      re => expression1_dout_net,
      re_ce => ce_1_sg_x41,
      rst => '1',
      we => relational_op_net,
      we_ce => ce_1_sg_x41,
      dout => fifo_sum_dout_net,
      empty => fifo_sum_empty_net
    );

  fifo_x: entity work.xlfifogen
    generic map (
      core_name0 => "fifo_fg84_5b68f376f783a64c",
      data_count_width => 6,
      data_width => 27,
      has_ae => 0,
      has_af => 0,
      percent_full_width => 1
    )
    port map (
      ce => ce_1_sg_x41,
      clk => clk_1_sg_x41,
      din => register_q_net_x0,
      en => '1',
      re => x_divider_s_axis_dividend_tready_net,
      re_ce => ce_1_sg_x41,
      rst => '1',
      we => relational_op_net,
      we_ce => ce_1_sg_x41,
      dout => fifo_x_dout_net,
      empty => fifo_x_empty_net
    );

  fifo_y: entity work.xlfifogen
    generic map (
      core_name0 => "fifo_fg84_5b68f376f783a64c",
      data_count_width => 6,
      data_width => 27,
      has_ae => 0,
      has_af => 0,
      percent_full_width => 1
    )
    port map (
      ce => ce_1_sg_x41,
      clk => clk_1_sg_x41,
      din => register_q_net_x2,
      en => '1',
      re => y_divider_s_axis_dividend_tready_net,
      re_ce => ce_1_sg_x41,
      rst => '1',
      we => relational_op_net,
      we_ce => ce_1_sg_x41,
      dout => fifo_y_dout_net,
      empty => fifo_y_empty_net
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x41,
      clk => clk_1_sg_x41,
      clr => '0',
      ip(0) => fifo_x_empty_net,
      op(0) => inverter_op_net
    );

  inverter1: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x41,
      clk => clk_1_sg_x41,
      clr => '0',
      ip(0) => fifo_sum_empty_net,
      op(0) => inverter1_op_net
    );

  inverter2: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x41,
      clk => clk_1_sg_x41,
      clr => '0',
      ip(0) => fifo_y_empty_net,
      op(0) => inverter2_op_net
    );

  inverter3: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x41,
      clk => clk_1_sg_x41,
      clr => '0',
      ip(0) => fifo_q_empty_net,
      op(0) => inverter3_op_net
    );

  q_divider: entity work.xldivider_generator_abfd96133d2f7eb1baefa6637fb34af7
    port map (
      ce => ce_1_sg_x41,
      clk => clk_1_sg_x41,
      s_axis_dividend_tdata_dividend => fifo_q_dout_net,
      s_axis_dividend_tvalid => inverter3_op_net,
      s_axis_divisor_tdata_divisor => fifo_sum_dout_net,
      s_axis_divisor_tvalid => inverter1_op_net,
      m_axis_dout_tdata_fractional => q_divider_m_axis_dout_tdata_fractional_net_x0,
      m_axis_dout_tdata_quotient => q_divider_m_axis_dout_tdata_quotient_net_x0,
      m_axis_dout_tvalid => q_divider_m_axis_dout_tvalid_net,
      s_axis_dividend_tready => q_divider_s_axis_dividend_tready_net,
      s_axis_divisor_tready => q_divider_s_axis_divisor_tready_net
    );

  register1: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_1113_sg_x13,
      clk => clk_1113_sg_x13,
      d => b_plus_c_s_net,
      en => "1",
      rst => "0",
      q => register1_q_net
    );

  register11: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x41,
      clk => clk_1_sg_x41,
      d => convert_dout_net_x1,
      en(0) => x_divider_m_axis_dout_tvalid_net,
      rst => "0",
      q => register11_q_net_x0
    );

  register12: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x41,
      clk => clk_1_sg_x41,
      d => convert_dout_net_x2,
      en(0) => q_divider_m_axis_dout_tvalid_net,
      rst => "0",
      q => register12_q_net_x0
    );

  register13: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x41,
      clk => clk_1_sg_x41,
      d => convert_dout_net_x0,
      en(0) => y_divider_m_axis_dout_tvalid_net,
      rst => "0",
      q => register13_q_net_x0
    );

  register17: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1113_sg_x13,
      clk => clk_1113_sg_x13,
      d(0) => expression_dout_net,
      en => "1",
      rst => "0",
      q(0) => register17_q_net_x3
    );

  register19: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x41,
      clk => clk_1_sg_x41,
      d => convert_dout_net,
      en => "1",
      rst => "0",
      q => register19_q_net_x0
    );

  register2: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_1113_sg_x13,
      clk => clk_1113_sg_x13,
      d => a_plus_b_s_net,
      en => "1",
      rst => "0",
      q => register2_q_net
    );

  register3: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_1113_sg_x13,
      clk => clk_1113_sg_x13,
      d => a_plus_d_s_net,
      en => "1",
      rst => "0",
      q => register3_q_net
    );

  register4: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_1113_sg_x13,
      clk => clk_1113_sg_x13,
      d => c_plus_d_s_net,
      en => "1",
      rst => "0",
      q => register4_q_net
    );

  register5: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_1113_sg_x13,
      clk => clk_1113_sg_x13,
      d => a_plus_c_s_net,
      en => "1",
      rst => "0",
      q => register5_q_net
    );

  register6: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_1113_sg_x13,
      clk => clk_1113_sg_x13,
      d => b_plus_d_s_net,
      en => "1",
      rst => "0",
      q => register6_q_net
    );

  relational: entity work.relational_6505656e93
    port map (
      a => register_q_net_x1,
      b => del_sig_div_fofb_thres_i_net_x0,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  sum: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 23,
      a_width => 26,
      b_arith => xlSigned,
      b_bin_pt => 23,
      b_width => 26,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 27,
      core_name0 => "addsb_11_0_2f1626aeedb3c308",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 27,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 23,
      s_width => 27
    )
    port map (
      a => register3_q_net,
      b => register1_q_net,
      ce => ce_1113_sg_x13,
      clk => clk_1113_sg_x13,
      clr => '0',
      en => "1",
      s => sum_s_net_x0
    );

  unsigned2signed1_4871dec4a6: entity work.unsigned2signed1_entity_4871dec4a6
    port map (
      ce_1 => ce_1_sg_x41,
      clk_1 => clk_1_sg_x41,
      s_data => y_divider_m_axis_dout_tdata_quotient_net_x0,
      u_data => y_divider_m_axis_dout_tdata_fractional_net_x0,
      data_out => convert_dout_net_x0
    );

  unsigned2signed2_2f05b465d2: entity work.unsigned2signed1_entity_4871dec4a6
    port map (
      ce_1 => ce_1_sg_x41,
      clk_1 => clk_1_sg_x41,
      s_data => x_divider_m_axis_dout_tdata_quotient_net_x0,
      u_data => x_divider_m_axis_dout_tdata_fractional_net_x0,
      data_out => convert_dout_net_x1
    );

  unsigned2signed3_5318c8a639: entity work.unsigned2signed1_entity_4871dec4a6
    port map (
      ce_1 => ce_1_sg_x41,
      clk_1 => clk_1_sg_x41,
      s_data => q_divider_m_axis_dout_tdata_quotient_net_x0,
      u_data => q_divider_m_axis_dout_tdata_fractional_net_x0,
      data_out => convert_dout_net_x2
    );

  x_divider: entity work.xldivider_generator_abfd96133d2f7eb1baefa6637fb34af7
    port map (
      ce => ce_1_sg_x41,
      clk => clk_1_sg_x41,
      s_axis_dividend_tdata_dividend => fifo_x_dout_net,
      s_axis_dividend_tvalid => inverter_op_net,
      s_axis_divisor_tdata_divisor => fifo_sum_dout_net,
      s_axis_divisor_tvalid => inverter1_op_net,
      m_axis_dout_tdata_fractional => x_divider_m_axis_dout_tdata_fractional_net_x0,
      m_axis_dout_tdata_quotient => x_divider_m_axis_dout_tdata_quotient_net_x0,
      m_axis_dout_tvalid => x_divider_m_axis_dout_tvalid_net,
      s_axis_dividend_tready => x_divider_s_axis_dividend_tready_net,
      s_axis_divisor_tready => x_divider_s_axis_divisor_tready_net
    );

  y_divider: entity work.xldivider_generator_abfd96133d2f7eb1baefa6637fb34af7
    port map (
      ce => ce_1_sg_x41,
      clk => clk_1_sg_x41,
      s_axis_dividend_tdata_dividend => fifo_y_dout_net,
      s_axis_dividend_tvalid => inverter2_op_net,
      s_axis_divisor_tdata_divisor => fifo_sum_dout_net,
      s_axis_divisor_tvalid => inverter1_op_net,
      m_axis_dout_tdata_fractional => y_divider_m_axis_dout_tdata_fractional_net_x0,
      m_axis_dout_tdata_quotient => y_divider_m_axis_dout_tdata_quotient_net_x0,
      m_axis_dout_tvalid => y_divider_m_axis_dout_tvalid_net,
      s_axis_dividend_tready => y_divider_s_axis_dividend_tready_net,
      s_axis_divisor_tready => y_divider_s_axis_divisor_tready_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/delta-sigma_tbt/DataReg_En"

entity datareg_en_entity_ed948c360a is
  port (
    ce_35: in std_logic; 
    clk_35: in std_logic; 
    din: in std_logic_vector(26 downto 0); 
    en: in std_logic; 
    dout: out std_logic_vector(26 downto 0)
  );
end datareg_en_entity_ed948c360a;

architecture structural of datareg_en_entity_ed948c360a is
  signal ce_35_sg_x8: std_logic;
  signal clk_35_sg_x8: std_logic;
  signal delta_x_s_net_x0: std_logic_vector(26 downto 0);
  signal register17_q_net_x0: std_logic;
  signal register_q_net_x0: std_logic_vector(26 downto 0);

begin
  ce_35_sg_x8 <= ce_35;
  clk_35_sg_x8 <= clk_35;
  delta_x_s_net_x0 <= din;
  register17_q_net_x0 <= en;
  dout <= register_q_net_x0;

  register_x0: entity work.xlregister
    generic map (
      d_width => 27,
      init_value => b"000000000000000000000000000"
    )
    port map (
      ce => ce_35_sg_x8,
      clk => clk_35_sg_x8,
      d => delta_x_s_net_x0,
      en(0) => register17_q_net_x0,
      rst => "0",
      q => register_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/delta-sigma_tbt"

entity delta_sigma_tbt_entity_bbfa8a8a69 is
  port (
    a: in std_logic_vector(24 downto 0); 
    avalid: in std_logic; 
    b: in std_logic_vector(24 downto 0); 
    bvalid: in std_logic; 
    c: in std_logic_vector(24 downto 0); 
    ce_1: in std_logic; 
    ce_35: in std_logic; 
    clk_1: in std_logic; 
    clk_35: in std_logic; 
    cvalid: in std_logic; 
    d: in std_logic_vector(24 downto 0); 
    delta_sigma_thres: in std_logic_vector(26 downto 0); 
    dvalid: in std_logic; 
    q: out std_logic_vector(23 downto 0); 
    sum_x0: out std_logic_vector(23 downto 0); 
    x: out std_logic_vector(23 downto 0); 
    y: out std_logic_vector(23 downto 0)
  );
end delta_sigma_tbt_entity_bbfa8a8a69;

architecture structural of delta_sigma_tbt_entity_bbfa8a8a69 is
  signal a_plus_b_s_net: std_logic_vector(25 downto 0);
  signal a_plus_c_s_net: std_logic_vector(25 downto 0);
  signal a_plus_d_s_net: std_logic_vector(25 downto 0);
  signal b_plus_c_s_net: std_logic_vector(25 downto 0);
  signal b_plus_d_s_net: std_logic_vector(25 downto 0);
  signal c_plus_d_s_net: std_logic_vector(25 downto 0);
  signal ce_1_sg_x45: std_logic;
  signal ce_35_sg_x12: std_logic;
  signal clk_1_sg_x45: std_logic;
  signal clk_35_sg_x12: std_logic;
  signal convert_dout_net: std_logic_vector(23 downto 0);
  signal convert_dout_net_x0: std_logic_vector(23 downto 0);
  signal convert_dout_net_x1: std_logic_vector(23 downto 0);
  signal convert_dout_net_x2: std_logic_vector(23 downto 0);
  signal del_sig_div_tbt_thres_i_net_x0: std_logic_vector(26 downto 0);
  signal delay_q_net: std_logic_vector(26 downto 0);
  signal delta_q_s_net_x0: std_logic_vector(26 downto 0);
  signal delta_x_s_net_x0: std_logic_vector(26 downto 0);
  signal delta_y_s_net_x0: std_logic_vector(26 downto 0);
  signal expression1_dout_net: std_logic;
  signal expression_dout_net: std_logic;
  signal fifo_q_dout_net: std_logic_vector(26 downto 0);
  signal fifo_q_empty_net: std_logic;
  signal fifo_sum_dout_net: std_logic_vector(26 downto 0);
  signal fifo_sum_empty_net: std_logic;
  signal fifo_x_dout_net: std_logic_vector(26 downto 0);
  signal fifo_x_empty_net: std_logic;
  signal fifo_y_dout_net: std_logic_vector(26 downto 0);
  signal fifo_y_empty_net: std_logic;
  signal inverter1_op_net: std_logic;
  signal inverter2_op_net: std_logic;
  signal inverter3_op_net: std_logic;
  signal inverter_op_net: std_logic;
  signal q_divider_m_axis_dout_tdata_fractional_net_x0: std_logic_vector(22 downto 0);
  signal q_divider_m_axis_dout_tdata_quotient_net_x0: std_logic_vector(26 downto 0);
  signal q_divider_m_axis_dout_tvalid_net: std_logic;
  signal q_divider_s_axis_dividend_tready_net: std_logic;
  signal q_divider_s_axis_divisor_tready_net: std_logic;
  signal register11_q_net_x0: std_logic_vector(23 downto 0);
  signal register12_q_net_x0: std_logic_vector(23 downto 0);
  signal register13_q_net_x0: std_logic_vector(23 downto 0);
  signal register17_q_net_x3: std_logic;
  signal register19_q_net_x0: std_logic_vector(23 downto 0);
  signal register1_q_net: std_logic_vector(25 downto 0);
  signal register2_q_net: std_logic_vector(25 downto 0);
  signal register3_q_net: std_logic_vector(25 downto 0);
  signal register4_q_net: std_logic_vector(25 downto 0);
  signal register5_q_net: std_logic_vector(25 downto 0);
  signal register5_q_net_x4: std_logic_vector(24 downto 0);
  signal register5_q_net_x5: std_logic_vector(24 downto 0);
  signal register5_q_net_x6: std_logic_vector(24 downto 0);
  signal register5_q_net_x7: std_logic_vector(24 downto 0);
  signal register6_q_net: std_logic_vector(25 downto 0);
  signal register6_q_net_x4: std_logic;
  signal register6_q_net_x5: std_logic;
  signal register6_q_net_x6: std_logic;
  signal register6_q_net_x7: std_logic;
  signal register_q_net_x0: std_logic_vector(26 downto 0);
  signal register_q_net_x1: std_logic_vector(26 downto 0);
  signal register_q_net_x2: std_logic_vector(26 downto 0);
  signal register_q_net_x3: std_logic_vector(26 downto 0);
  signal relational_op_net: std_logic;
  signal sum_s_net_x0: std_logic_vector(26 downto 0);
  signal x_divider_m_axis_dout_tdata_fractional_net_x0: std_logic_vector(22 downto 0);
  signal x_divider_m_axis_dout_tdata_quotient_net_x0: std_logic_vector(26 downto 0);
  signal x_divider_m_axis_dout_tvalid_net: std_logic;
  signal x_divider_s_axis_dividend_tready_net: std_logic;
  signal x_divider_s_axis_divisor_tready_net: std_logic;
  signal y_divider_m_axis_dout_tdata_fractional_net_x0: std_logic_vector(22 downto 0);
  signal y_divider_m_axis_dout_tdata_quotient_net_x0: std_logic_vector(26 downto 0);
  signal y_divider_m_axis_dout_tvalid_net: std_logic;
  signal y_divider_s_axis_dividend_tready_net: std_logic;
  signal y_divider_s_axis_divisor_tready_net: std_logic;

begin
  register5_q_net_x4 <= a;
  register6_q_net_x4 <= avalid;
  register5_q_net_x5 <= b;
  register6_q_net_x5 <= bvalid;
  register5_q_net_x6 <= c;
  ce_1_sg_x45 <= ce_1;
  ce_35_sg_x12 <= ce_35;
  clk_1_sg_x45 <= clk_1;
  clk_35_sg_x12 <= clk_35;
  register6_q_net_x6 <= cvalid;
  register5_q_net_x7 <= d;
  del_sig_div_tbt_thres_i_net_x0 <= delta_sigma_thres;
  register6_q_net_x7 <= dvalid;
  q <= register12_q_net_x0;
  sum_x0 <= register19_q_net_x0;
  x <= register11_q_net_x0;
  y <= register13_q_net_x0;

  a_plus_b: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 23,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 23,
      b_width => 25,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 26,
      core_name0 => "addsb_11_0_239e4f614ba09ab1",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 26,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 23,
      s_width => 26
    )
    port map (
      a => register5_q_net_x4,
      b => register5_q_net_x5,
      ce => ce_35_sg_x12,
      clk => clk_35_sg_x12,
      clr => '0',
      en => "1",
      s => a_plus_b_s_net
    );

  a_plus_c: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 23,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 23,
      b_width => 25,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 26,
      core_name0 => "addsb_11_0_239e4f614ba09ab1",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 26,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 23,
      s_width => 26
    )
    port map (
      a => register5_q_net_x4,
      b => register5_q_net_x6,
      ce => ce_35_sg_x12,
      clk => clk_35_sg_x12,
      clr => '0',
      en => "1",
      s => a_plus_c_s_net
    );

  a_plus_d: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 23,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 23,
      b_width => 25,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 26,
      core_name0 => "addsb_11_0_239e4f614ba09ab1",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 26,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 23,
      s_width => 26
    )
    port map (
      a => register5_q_net_x4,
      b => register5_q_net_x7,
      ce => ce_35_sg_x12,
      clk => clk_35_sg_x12,
      clr => '0',
      en => "1",
      s => a_plus_d_s_net
    );

  b_plus_c: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 23,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 23,
      b_width => 25,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 26,
      core_name0 => "addsb_11_0_239e4f614ba09ab1",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 26,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 23,
      s_width => 26
    )
    port map (
      a => register5_q_net_x5,
      b => register5_q_net_x6,
      ce => ce_35_sg_x12,
      clk => clk_35_sg_x12,
      clr => '0',
      en => "1",
      s => b_plus_c_s_net
    );

  b_plus_d: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 23,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 23,
      b_width => 25,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 26,
      core_name0 => "addsb_11_0_239e4f614ba09ab1",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 26,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 23,
      s_width => 26
    )
    port map (
      a => register5_q_net_x5,
      b => register5_q_net_x7,
      ce => ce_35_sg_x12,
      clk => clk_35_sg_x12,
      clr => '0',
      en => "1",
      s => b_plus_d_s_net
    );

  c_plus_d: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 23,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 23,
      b_width => 25,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 26,
      core_name0 => "addsb_11_0_239e4f614ba09ab1",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 26,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 23,
      s_width => 26
    )
    port map (
      a => register5_q_net_x6,
      b => register5_q_net_x7,
      ce => ce_35_sg_x12,
      clk => clk_35_sg_x12,
      clr => '0',
      en => "1",
      s => c_plus_d_s_net
    );

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 23,
      din_width => 27,
      dout_arith => 2,
      dout_bin_pt => 20,
      dout_width => 24,
      latency => 0,
      overflow => xlWrap,
      quantization => xlRound
    )
    port map (
      ce => ce_1_sg_x45,
      clk => clk_1_sg_x45,
      clr => '0',
      din => delay_q_net,
      en => "1",
      dout => convert_dout_net
    );

  datareg_en1_e5d0399944: entity work.datareg_en_entity_ed948c360a
    port map (
      ce_35 => ce_35_sg_x12,
      clk_35 => clk_35_sg_x12,
      din => sum_s_net_x0,
      en => register17_q_net_x3,
      dout => register_q_net_x1
    );

  datareg_en2_02a2053e69: entity work.datareg_en_entity_ed948c360a
    port map (
      ce_35 => ce_35_sg_x12,
      clk_35 => clk_35_sg_x12,
      din => delta_y_s_net_x0,
      en => register17_q_net_x3,
      dout => register_q_net_x2
    );

  datareg_en3_78179f99cc: entity work.datareg_en_entity_ed948c360a
    port map (
      ce_35 => ce_35_sg_x12,
      clk_35 => clk_35_sg_x12,
      din => delta_q_s_net_x0,
      en => register17_q_net_x3,
      dout => register_q_net_x3
    );

  datareg_en_ed948c360a: entity work.datareg_en_entity_ed948c360a
    port map (
      ce_35 => ce_35_sg_x12,
      clk_35 => clk_35_sg_x12,
      din => delta_x_s_net_x0,
      en => register17_q_net_x3,
      dout => register_q_net_x0
    );

  delay: entity work.xldelay
    generic map (
      latency => 29,
      reg_retiming => 0,
      reset => 0,
      width => 27
    )
    port map (
      ce => ce_1_sg_x45,
      clk => clk_1_sg_x45,
      d => fifo_sum_dout_net,
      en => '1',
      rst => '1',
      q => delay_q_net
    );

  delta_q: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 23,
      a_width => 26,
      b_arith => xlSigned,
      b_bin_pt => 23,
      b_width => 26,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 27,
      core_name0 => "addsb_11_0_1482f9e8df81448a",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 27,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 23,
      s_width => 27
    )
    port map (
      a => register5_q_net,
      b => register6_q_net,
      ce => ce_35_sg_x12,
      clk => clk_35_sg_x12,
      clr => '0',
      en => "1",
      s => delta_q_s_net_x0
    );

  delta_x: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 23,
      a_width => 26,
      b_arith => xlSigned,
      b_bin_pt => 23,
      b_width => 26,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 27,
      core_name0 => "addsb_11_0_1482f9e8df81448a",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 27,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 23,
      s_width => 27
    )
    port map (
      a => register1_q_net,
      b => register3_q_net,
      ce => ce_35_sg_x12,
      clk => clk_35_sg_x12,
      clr => '0',
      en => "1",
      s => delta_x_s_net_x0
    );

  delta_y: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 23,
      a_width => 26,
      b_arith => xlSigned,
      b_bin_pt => 23,
      b_width => 26,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 27,
      core_name0 => "addsb_11_0_1482f9e8df81448a",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 27,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 23,
      s_width => 27
    )
    port map (
      a => register2_q_net,
      b => register4_q_net,
      ce => ce_35_sg_x12,
      clk => clk_35_sg_x12,
      clr => '0',
      en => "1",
      s => delta_y_s_net_x0
    );

  expression: entity work.expr_24cbf78c62
    port map (
      a(0) => register6_q_net_x4,
      b(0) => register6_q_net_x5,
      c(0) => register6_q_net_x6,
      ce => '0',
      clk => '0',
      clr => '0',
      d(0) => register6_q_net_x7,
      dout(0) => expression_dout_net
    );

  expression1: entity work.expr_375d7bbece
    port map (
      a(0) => x_divider_s_axis_divisor_tready_net,
      b(0) => y_divider_s_axis_divisor_tready_net,
      c(0) => q_divider_s_axis_divisor_tready_net,
      ce => '0',
      clk => '0',
      clr => '0',
      dout(0) => expression1_dout_net
    );

  fifo_q: entity work.xlfifogen
    generic map (
      core_name0 => "fifo_fg84_5b68f376f783a64c",
      data_count_width => 6,
      data_width => 27,
      has_ae => 0,
      has_af => 0,
      percent_full_width => 1
    )
    port map (
      ce => ce_1_sg_x45,
      clk => clk_1_sg_x45,
      din => register_q_net_x3,
      en => '1',
      re => q_divider_s_axis_dividend_tready_net,
      re_ce => ce_1_sg_x45,
      rst => '1',
      we => relational_op_net,
      we_ce => ce_1_sg_x45,
      dout => fifo_q_dout_net,
      empty => fifo_q_empty_net
    );

  fifo_sum: entity work.xlfifogen
    generic map (
      core_name0 => "fifo_fg84_5b68f376f783a64c",
      data_count_width => 6,
      data_width => 27,
      has_ae => 0,
      has_af => 0,
      percent_full_width => 1
    )
    port map (
      ce => ce_1_sg_x45,
      clk => clk_1_sg_x45,
      din => register_q_net_x1,
      en => '1',
      re => expression1_dout_net,
      re_ce => ce_1_sg_x45,
      rst => '1',
      we => relational_op_net,
      we_ce => ce_1_sg_x45,
      dout => fifo_sum_dout_net,
      empty => fifo_sum_empty_net
    );

  fifo_x: entity work.xlfifogen
    generic map (
      core_name0 => "fifo_fg84_5b68f376f783a64c",
      data_count_width => 6,
      data_width => 27,
      has_ae => 0,
      has_af => 0,
      percent_full_width => 1
    )
    port map (
      ce => ce_1_sg_x45,
      clk => clk_1_sg_x45,
      din => register_q_net_x0,
      en => '1',
      re => x_divider_s_axis_dividend_tready_net,
      re_ce => ce_1_sg_x45,
      rst => '1',
      we => relational_op_net,
      we_ce => ce_1_sg_x45,
      dout => fifo_x_dout_net,
      empty => fifo_x_empty_net
    );

  fifo_y: entity work.xlfifogen
    generic map (
      core_name0 => "fifo_fg84_5b68f376f783a64c",
      data_count_width => 6,
      data_width => 27,
      has_ae => 0,
      has_af => 0,
      percent_full_width => 1
    )
    port map (
      ce => ce_1_sg_x45,
      clk => clk_1_sg_x45,
      din => register_q_net_x2,
      en => '1',
      re => y_divider_s_axis_dividend_tready_net,
      re_ce => ce_1_sg_x45,
      rst => '1',
      we => relational_op_net,
      we_ce => ce_1_sg_x45,
      dout => fifo_y_dout_net,
      empty => fifo_y_empty_net
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x45,
      clk => clk_1_sg_x45,
      clr => '0',
      ip(0) => fifo_x_empty_net,
      op(0) => inverter_op_net
    );

  inverter1: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x45,
      clk => clk_1_sg_x45,
      clr => '0',
      ip(0) => fifo_sum_empty_net,
      op(0) => inverter1_op_net
    );

  inverter2: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x45,
      clk => clk_1_sg_x45,
      clr => '0',
      ip(0) => fifo_y_empty_net,
      op(0) => inverter2_op_net
    );

  inverter3: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x45,
      clk => clk_1_sg_x45,
      clr => '0',
      ip(0) => fifo_q_empty_net,
      op(0) => inverter3_op_net
    );

  q_divider: entity work.xldivider_generator_abfd96133d2f7eb1baefa6637fb34af7
    port map (
      ce => ce_1_sg_x45,
      clk => clk_1_sg_x45,
      s_axis_dividend_tdata_dividend => fifo_q_dout_net,
      s_axis_dividend_tvalid => inverter3_op_net,
      s_axis_divisor_tdata_divisor => fifo_sum_dout_net,
      s_axis_divisor_tvalid => inverter1_op_net,
      m_axis_dout_tdata_fractional => q_divider_m_axis_dout_tdata_fractional_net_x0,
      m_axis_dout_tdata_quotient => q_divider_m_axis_dout_tdata_quotient_net_x0,
      m_axis_dout_tvalid => q_divider_m_axis_dout_tvalid_net,
      s_axis_dividend_tready => q_divider_s_axis_dividend_tready_net,
      s_axis_divisor_tready => q_divider_s_axis_divisor_tready_net
    );

  register1: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_35_sg_x12,
      clk => clk_35_sg_x12,
      d => b_plus_c_s_net,
      en => "1",
      rst => "0",
      q => register1_q_net
    );

  register11: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x45,
      clk => clk_1_sg_x45,
      d => convert_dout_net_x1,
      en(0) => x_divider_m_axis_dout_tvalid_net,
      rst => "0",
      q => register11_q_net_x0
    );

  register12: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x45,
      clk => clk_1_sg_x45,
      d => convert_dout_net_x2,
      en(0) => q_divider_m_axis_dout_tvalid_net,
      rst => "0",
      q => register12_q_net_x0
    );

  register13: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x45,
      clk => clk_1_sg_x45,
      d => convert_dout_net_x0,
      en(0) => y_divider_m_axis_dout_tvalid_net,
      rst => "0",
      q => register13_q_net_x0
    );

  register17: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_35_sg_x12,
      clk => clk_35_sg_x12,
      d(0) => expression_dout_net,
      en => "1",
      rst => "0",
      q(0) => register17_q_net_x3
    );

  register19: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x45,
      clk => clk_1_sg_x45,
      d => convert_dout_net,
      en => "1",
      rst => "0",
      q => register19_q_net_x0
    );

  register2: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_35_sg_x12,
      clk => clk_35_sg_x12,
      d => a_plus_b_s_net,
      en => "1",
      rst => "0",
      q => register2_q_net
    );

  register3: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_35_sg_x12,
      clk => clk_35_sg_x12,
      d => a_plus_d_s_net,
      en => "1",
      rst => "0",
      q => register3_q_net
    );

  register4: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_35_sg_x12,
      clk => clk_35_sg_x12,
      d => c_plus_d_s_net,
      en => "1",
      rst => "0",
      q => register4_q_net
    );

  register5: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_35_sg_x12,
      clk => clk_35_sg_x12,
      d => a_plus_c_s_net,
      en => "1",
      rst => "0",
      q => register5_q_net
    );

  register6: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_35_sg_x12,
      clk => clk_35_sg_x12,
      d => b_plus_d_s_net,
      en => "1",
      rst => "0",
      q => register6_q_net
    );

  relational: entity work.relational_6505656e93
    port map (
      a => register_q_net_x1,
      b => del_sig_div_tbt_thres_i_net_x0,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  sum: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 23,
      a_width => 26,
      b_arith => xlSigned,
      b_bin_pt => 23,
      b_width => 26,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 27,
      core_name0 => "addsb_11_0_2f1626aeedb3c308",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 27,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 23,
      s_width => 27
    )
    port map (
      a => register3_q_net,
      b => register1_q_net,
      ce => ce_35_sg_x12,
      clk => clk_35_sg_x12,
      clr => '0',
      en => "1",
      s => sum_s_net_x0
    );

  unsigned2signed1_0c64554e20: entity work.unsigned2signed1_entity_4871dec4a6
    port map (
      ce_1 => ce_1_sg_x45,
      clk_1 => clk_1_sg_x45,
      s_data => y_divider_m_axis_dout_tdata_quotient_net_x0,
      u_data => y_divider_m_axis_dout_tdata_fractional_net_x0,
      data_out => convert_dout_net_x0
    );

  unsigned2signed2_b5112b4796: entity work.unsigned2signed1_entity_4871dec4a6
    port map (
      ce_1 => ce_1_sg_x45,
      clk_1 => clk_1_sg_x45,
      s_data => x_divider_m_axis_dout_tdata_quotient_net_x0,
      u_data => x_divider_m_axis_dout_tdata_fractional_net_x0,
      data_out => convert_dout_net_x1
    );

  unsigned2signed3_3e8ecc04fc: entity work.unsigned2signed1_entity_4871dec4a6
    port map (
      ce_1 => ce_1_sg_x45,
      clk_1 => clk_1_sg_x45,
      s_data => q_divider_m_axis_dout_tdata_quotient_net_x0,
      u_data => q_divider_m_axis_dout_tdata_fractional_net_x0,
      data_out => convert_dout_net_x2
    );

  x_divider: entity work.xldivider_generator_abfd96133d2f7eb1baefa6637fb34af7
    port map (
      ce => ce_1_sg_x45,
      clk => clk_1_sg_x45,
      s_axis_dividend_tdata_dividend => fifo_x_dout_net,
      s_axis_dividend_tvalid => inverter_op_net,
      s_axis_divisor_tdata_divisor => fifo_sum_dout_net,
      s_axis_divisor_tvalid => inverter1_op_net,
      m_axis_dout_tdata_fractional => x_divider_m_axis_dout_tdata_fractional_net_x0,
      m_axis_dout_tdata_quotient => x_divider_m_axis_dout_tdata_quotient_net_x0,
      m_axis_dout_tvalid => x_divider_m_axis_dout_tvalid_net,
      s_axis_dividend_tready => x_divider_s_axis_dividend_tready_net,
      s_axis_divisor_tready => x_divider_s_axis_divisor_tready_net
    );

  y_divider: entity work.xldivider_generator_abfd96133d2f7eb1baefa6637fb34af7
    port map (
      ce => ce_1_sg_x45,
      clk => clk_1_sg_x45,
      s_axis_dividend_tdata_dividend => fifo_y_dout_net,
      s_axis_dividend_tvalid => inverter2_op_net,
      s_axis_divisor_tdata_divisor => fifo_sum_dout_net,
      s_axis_divisor_tvalid => inverter1_op_net,
      m_axis_dout_tdata_fractional => y_divider_m_axis_dout_tdata_fractional_net_x0,
      m_axis_dout_tdata_quotient => y_divider_m_axis_dout_tdata_quotient_net_x0,
      m_axis_dout_tvalid => y_divider_m_axis_dout_tvalid_net,
      s_axis_dividend_tready => y_divider_s_axis_dividend_tready_net,
      s_axis_divisor_tready => y_divider_s_axis_divisor_tready_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066"

entity ddc_bpm_476_066 is
  port (
    adc_ch0_i: in std_logic_vector(15 downto 0); 
    adc_ch1_i: in std_logic_vector(15 downto 0); 
    adc_ch2_i: in std_logic_vector(15 downto 0); 
    adc_ch3_i: in std_logic_vector(15 downto 0); 
    ce_1: in std_logic; 
    ce_1113: in std_logic; 
    ce_11130000: in std_logic; 
    ce_2782500: in std_logic; 
    ce_35: in std_logic; 
    ce_5565000: in std_logic; 
    ce_logic_1: in std_logic; 
    ce_logic_1113: in std_logic; 
    ce_logic_2782500: in std_logic; 
    ce_logic_5565000: in std_logic; 
    clk_1: in std_logic; 
    clk_1113: in std_logic; 
    clk_11130000: in std_logic; 
    clk_2782500: in std_logic; 
    clk_35: in std_logic; 
    clk_5565000: in std_logic; 
    del_sig_div_fofb_thres_i: in std_logic_vector(26 downto 0); 
    del_sig_div_tbt_thres_i: in std_logic_vector(26 downto 0); 
    adc_ch0_dbg_data_o: out std_logic_vector(15 downto 0); 
    adc_ch1_dbg_data_o: out std_logic_vector(15 downto 0); 
    adc_ch2_dbg_data_o: out std_logic_vector(15 downto 0); 
    adc_ch3_dbg_data_o: out std_logic_vector(15 downto 0); 
    cic_fofb_ch0_i_o: out std_logic_vector(24 downto 0); 
    cic_fofb_ch0_q_o: out std_logic_vector(24 downto 0); 
    cic_fofb_ch1_i_o: out std_logic_vector(24 downto 0); 
    cic_fofb_ch1_q_o: out std_logic_vector(24 downto 0); 
    cic_fofb_ch2_i_o: out std_logic_vector(24 downto 0); 
    cic_fofb_ch2_q_o: out std_logic_vector(24 downto 0); 
    cic_fofb_ch3_i_o: out std_logic_vector(24 downto 0); 
    cic_fofb_ch3_q_o: out std_logic_vector(24 downto 0); 
    fofb_amp_ch0_o: out std_logic_vector(24 downto 0); 
    fofb_amp_ch1_o: out std_logic_vector(24 downto 0); 
    fofb_amp_ch2_o: out std_logic_vector(24 downto 0); 
    fofb_amp_ch3_o: out std_logic_vector(24 downto 0); 
    mix_ch0_i_o: out std_logic_vector(23 downto 0); 
    mix_ch0_q_o: out std_logic_vector(23 downto 0); 
    mix_ch1_i_o: out std_logic_vector(23 downto 0); 
    mix_ch1_q_o: out std_logic_vector(23 downto 0); 
    mix_ch2_i_o: out std_logic_vector(23 downto 0); 
    mix_ch2_q_o: out std_logic_vector(23 downto 0); 
    mix_ch3_i_o: out std_logic_vector(23 downto 0); 
    mix_ch3_q_o: out std_logic_vector(23 downto 0); 
    poly35_ch0_i_o: out std_logic_vector(24 downto 0); 
    poly35_ch0_q_o: out std_logic_vector(24 downto 0); 
    poly35_ch1_i_o: out std_logic_vector(24 downto 0); 
    poly35_ch1_q_o: out std_logic_vector(24 downto 0); 
    poly35_ch2_i_o: out std_logic_vector(24 downto 0); 
    poly35_ch2_q_o: out std_logic_vector(24 downto 0); 
    poly35_ch3_i_o: out std_logic_vector(24 downto 0); 
    poly35_ch3_q_o: out std_logic_vector(24 downto 0); 
    q_fofb_o: out std_logic_vector(23 downto 0); 
    q_monit_o: out std_logic_vector(23 downto 0); 
    q_tbt_o: out std_logic_vector(23 downto 0); 
    sum_fofb_o: out std_logic_vector(23 downto 0); 
    sum_monit_o: out std_logic_vector(23 downto 0); 
    sum_tbt_o: out std_logic_vector(23 downto 0); 
    tbt_amp_ch0_o: out std_logic_vector(24 downto 0); 
    tbt_amp_ch1_o: out std_logic_vector(24 downto 0); 
    tbt_amp_ch2_o: out std_logic_vector(24 downto 0); 
    tbt_amp_ch3_o: out std_logic_vector(24 downto 0); 
    x_fofb_o: out std_logic_vector(23 downto 0); 
    x_monit_o: out std_logic_vector(23 downto 0); 
    x_tbt_o: out std_logic_vector(23 downto 0); 
    y_fofb_o: out std_logic_vector(23 downto 0); 
    y_monit_o: out std_logic_vector(23 downto 0); 
    y_tbt_o: out std_logic_vector(23 downto 0)
  );
end ddc_bpm_476_066;

architecture structural of ddc_bpm_476_066 is
  attribute core_generation_info: string;
  attribute core_generation_info of structural : architecture is "ddc_bpm_476_066,sysgen_core,{clock_period=8.88232184,clocking=Clock_Enables,compilation=HDL_Netlist,sample_periods=1.00000000000 35.00000000000 1113.00000000000 2782500.00000000000 5565000.00000000000 11130000.00000000000,testbench=0,total_blocks=1396,xilinx_adder_subtracter_block=20,xilinx_arithmetic_relational_operator_block=2,xilinx_bit_slice_extractor_block=4,xilinx_bitwise_expression_evaluator_block=4,xilinx_bus_concatenator_block=6,xilinx_cic_compiler_3_0_block=12,xilinx_clock_enable_probe_block=3,xilinx_complex_multiplier_5_0__block=4,xilinx_constant_block_block=9,xilinx_cordic_5_0_block=8,xilinx_dds_compiler_5_0_block=1,xilinx_delay_block=26,xilinx_divider_generator_4_0_block=6,xilinx_down_sampler_block=4,xilinx_fifo_block_block=8,xilinx_fir_compiler_6_2_block=4,xilinx_fir_compiler_6_3_block=3,xilinx_gateway_in_block=6,xilinx_gateway_out_block=133,xilinx_inverter_block=8,xilinx_register_block=98,xilinx_sample_time_block_block=10,xilinx_system_generator_block=1,xilinx_type_converter_block=36,xilinx_type_reinterpreter_block=70,}";

  signal adc_ch0_i_net_x1: std_logic_vector(15 downto 0);
  signal adc_ch1_i_net_x1: std_logic_vector(15 downto 0);
  signal adc_ch2_i_net_x1: std_logic_vector(15 downto 0);
  signal adc_ch3_i_net_x1: std_logic_vector(15 downto 0);
  signal ce_11130000_sg_x5: std_logic;
  signal ce_1113_sg_x14: std_logic;
  signal ce_1_sg_x46: std_logic;
  signal ce_2782500_sg_x5: std_logic;
  signal ce_35_sg_x13: std_logic;
  signal ce_5565000_sg_x5: std_logic;
  signal ce_logic_1113_sg_x1: std_logic;
  signal ce_logic_1_sg_x17: std_logic;
  signal ce_logic_2782500_sg_x1: std_logic;
  signal ce_logic_5565000_sg_x1: std_logic;
  signal cic_fofb_ch0_i_o_net: std_logic_vector(24 downto 0);
  signal cic_fofb_ch0_q_o_net: std_logic_vector(24 downto 0);
  signal cic_fofb_ch1_i_o_net: std_logic_vector(24 downto 0);
  signal cic_fofb_ch1_q_o_net: std_logic_vector(24 downto 0);
  signal cic_fofb_ch2_i_o_net: std_logic_vector(24 downto 0);
  signal cic_fofb_ch2_q_o_net: std_logic_vector(24 downto 0);
  signal cic_fofb_ch3_i_o_net: std_logic_vector(24 downto 0);
  signal cic_fofb_ch3_q_o_net: std_logic_vector(24 downto 0);
  signal clk_11130000_sg_x5: std_logic;
  signal clk_1113_sg_x14: std_logic;
  signal clk_1_sg_x46: std_logic;
  signal clk_2782500_sg_x5: std_logic;
  signal clk_35_sg_x13: std_logic;
  signal clk_5565000_sg_x5: std_logic;
  signal constant3_op_net: std_logic;
  signal dds_m_axis_data_tdata_cosine_net_x11: std_logic_vector(23 downto 0);
  signal dds_m_axis_data_tdata_sine_net_x11: std_logic_vector(23 downto 0);
  signal dds_m_axis_data_tvalid_net_x11: std_logic;
  signal del_sig_div_fofb_thres_i_net: std_logic_vector(26 downto 0);
  signal del_sig_div_tbt_thres_i_net: std_logic_vector(26 downto 0);
  signal down_sample1_q_net_x0: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x0: std_logic_vector(23 downto 0);
  signal down_sample3_q_net_x0: std_logic_vector(23 downto 0);
  signal down_sample_q_net_x0: std_logic_vector(23 downto 0);
  signal fofb_amp_ch0_o_net: std_logic_vector(24 downto 0);
  signal fofb_amp_ch1_o_net: std_logic_vector(24 downto 0);
  signal fofb_amp_ch2_o_net: std_logic_vector(24 downto 0);
  signal fofb_amp_ch3_o_net: std_logic_vector(24 downto 0);
  signal mix_ch0_i_o_net: std_logic_vector(23 downto 0);
  signal mix_ch0_q_o_net: std_logic_vector(23 downto 0);
  signal mix_ch1_i_o_net: std_logic_vector(23 downto 0);
  signal mix_ch1_q_o_net: std_logic_vector(23 downto 0);
  signal mix_ch2_i_o_net: std_logic_vector(23 downto 0);
  signal mix_ch2_q_o_net: std_logic_vector(23 downto 0);
  signal mix_ch3_i_o_net: std_logic_vector(23 downto 0);
  signal mix_ch3_q_o_net: std_logic_vector(23 downto 0);
  signal poly35_ch0_i_o_net: std_logic_vector(24 downto 0);
  signal poly35_ch0_q_o_net: std_logic_vector(24 downto 0);
  signal poly35_ch1_i_o_net: std_logic_vector(24 downto 0);
  signal poly35_ch1_q_o_net: std_logic_vector(24 downto 0);
  signal poly35_ch2_i_o_net: std_logic_vector(24 downto 0);
  signal poly35_ch2_q_o_net: std_logic_vector(24 downto 0);
  signal poly35_ch3_i_o_net: std_logic_vector(24 downto 0);
  signal poly35_ch3_q_o_net: std_logic_vector(24 downto 0);
  signal q_fofb_o_net: std_logic_vector(23 downto 0);
  signal q_monit_o_net: std_logic_vector(23 downto 0);
  signal q_tbt_o_net: std_logic_vector(23 downto 0);
  signal register6_q_net_x10: std_logic;
  signal register6_q_net_x11: std_logic;
  signal register6_q_net_x4: std_logic;
  signal register6_q_net_x5: std_logic;
  signal register6_q_net_x6: std_logic;
  signal register6_q_net_x7: std_logic;
  signal register6_q_net_x8: std_logic;
  signal register6_q_net_x9: std_logic;
  signal register_q_net_x11: std_logic_vector(23 downto 0);
  signal register_q_net_x12: std_logic_vector(23 downto 0);
  signal register_q_net_x8: std_logic_vector(23 downto 0);
  signal register_q_net_x9: std_logic_vector(23 downto 0);
  signal sum_fofb_o_net: std_logic_vector(23 downto 0);
  signal sum_monit_o_net: std_logic_vector(23 downto 0);
  signal sum_tbt_o_net: std_logic_vector(23 downto 0);
  signal tbt_amp_ch0_o_net: std_logic_vector(24 downto 0);
  signal tbt_amp_ch1_o_net: std_logic_vector(24 downto 0);
  signal tbt_amp_ch2_o_net: std_logic_vector(24 downto 0);
  signal tbt_amp_ch3_o_net: std_logic_vector(24 downto 0);
  signal x_fofb_o_net: std_logic_vector(23 downto 0);
  signal x_monit_o_net: std_logic_vector(23 downto 0);
  signal x_tbt_o_net: std_logic_vector(23 downto 0);
  signal y_fofb_o_net: std_logic_vector(23 downto 0);
  signal y_monit_o_net: std_logic_vector(23 downto 0);
  signal y_tbt_o_net: std_logic_vector(23 downto 0);

begin
  adc_ch0_i_net_x1 <= adc_ch0_i;
  adc_ch1_i_net_x1 <= adc_ch1_i;
  adc_ch2_i_net_x1 <= adc_ch2_i;
  adc_ch3_i_net_x1 <= adc_ch3_i;
  ce_1_sg_x46 <= ce_1;
  ce_1113_sg_x14 <= ce_1113;
  ce_11130000_sg_x5 <= ce_11130000;
  ce_2782500_sg_x5 <= ce_2782500;
  ce_35_sg_x13 <= ce_35;
  ce_5565000_sg_x5 <= ce_5565000;
  ce_logic_1_sg_x17 <= ce_logic_1;
  ce_logic_1113_sg_x1 <= ce_logic_1113;
  ce_logic_2782500_sg_x1 <= ce_logic_2782500;
  ce_logic_5565000_sg_x1 <= ce_logic_5565000;
  clk_1_sg_x46 <= clk_1;
  clk_1113_sg_x14 <= clk_1113;
  clk_11130000_sg_x5 <= clk_11130000;
  clk_2782500_sg_x5 <= clk_2782500;
  clk_35_sg_x13 <= clk_35;
  clk_5565000_sg_x5 <= clk_5565000;
  del_sig_div_fofb_thres_i_net <= del_sig_div_fofb_thres_i;
  del_sig_div_tbt_thres_i_net <= del_sig_div_tbt_thres_i;
  adc_ch0_dbg_data_o <= adc_ch0_i_net_x1;
  adc_ch1_dbg_data_o <= adc_ch1_i_net_x1;
  adc_ch2_dbg_data_o <= adc_ch2_i_net_x1;
  adc_ch3_dbg_data_o <= adc_ch3_i_net_x1;
  cic_fofb_ch0_i_o <= cic_fofb_ch0_i_o_net;
  cic_fofb_ch0_q_o <= cic_fofb_ch0_q_o_net;
  cic_fofb_ch1_i_o <= cic_fofb_ch1_i_o_net;
  cic_fofb_ch1_q_o <= cic_fofb_ch1_q_o_net;
  cic_fofb_ch2_i_o <= cic_fofb_ch2_i_o_net;
  cic_fofb_ch2_q_o <= cic_fofb_ch2_q_o_net;
  cic_fofb_ch3_i_o <= cic_fofb_ch3_i_o_net;
  cic_fofb_ch3_q_o <= cic_fofb_ch3_q_o_net;
  fofb_amp_ch0_o <= fofb_amp_ch0_o_net;
  fofb_amp_ch1_o <= fofb_amp_ch1_o_net;
  fofb_amp_ch2_o <= fofb_amp_ch2_o_net;
  fofb_amp_ch3_o <= fofb_amp_ch3_o_net;
  mix_ch0_i_o <= mix_ch0_i_o_net;
  mix_ch0_q_o <= mix_ch0_q_o_net;
  mix_ch1_i_o <= mix_ch1_i_o_net;
  mix_ch1_q_o <= mix_ch1_q_o_net;
  mix_ch2_i_o <= mix_ch2_i_o_net;
  mix_ch2_q_o <= mix_ch2_q_o_net;
  mix_ch3_i_o <= mix_ch3_i_o_net;
  mix_ch3_q_o <= mix_ch3_q_o_net;
  poly35_ch0_i_o <= poly35_ch0_i_o_net;
  poly35_ch0_q_o <= poly35_ch0_q_o_net;
  poly35_ch1_i_o <= poly35_ch1_i_o_net;
  poly35_ch1_q_o <= poly35_ch1_q_o_net;
  poly35_ch2_i_o <= poly35_ch2_i_o_net;
  poly35_ch2_q_o <= poly35_ch2_q_o_net;
  poly35_ch3_i_o <= poly35_ch3_i_o_net;
  poly35_ch3_q_o <= poly35_ch3_q_o_net;
  q_fofb_o <= q_fofb_o_net;
  q_monit_o <= q_monit_o_net;
  q_tbt_o <= q_tbt_o_net;
  sum_fofb_o <= sum_fofb_o_net;
  sum_monit_o <= sum_monit_o_net;
  sum_tbt_o <= sum_tbt_o_net;
  tbt_amp_ch0_o <= tbt_amp_ch0_o_net;
  tbt_amp_ch1_o <= tbt_amp_ch1_o_net;
  tbt_amp_ch2_o <= tbt_amp_ch2_o_net;
  tbt_amp_ch3_o <= tbt_amp_ch3_o_net;
  x_fofb_o <= x_fofb_o_net;
  x_monit_o <= x_monit_o_net;
  x_tbt_o <= x_tbt_o_net;
  y_fofb_o <= y_fofb_o_net;
  y_monit_o <= y_monit_o_net;
  y_tbt_o <= y_tbt_o_net;

  bpf_d31c4af409: entity work.bpf_entity_d31c4af409
    port map (
      adc_ch0_in => adc_ch0_i_net_x1,
      adc_ch1_in => adc_ch1_i_net_x1,
      adc_ch2_in => adc_ch2_i_net_x1,
      adc_ch3_in => adc_ch3_i_net_x1,
      ce_1 => ce_1_sg_x46,
      ce_logic_1 => ce_logic_1_sg_x17,
      clk_1 => clk_1_sg_x46,
      bpf_ch0_out => register_q_net_x8,
      bpf_ch1_out => register_q_net_x9,
      bpf_ch2_out => register_q_net_x11,
      bpf_ch3_out => register_q_net_x12
    );

  channel0_fofb_3577a252e5: entity work.channel0_fofb_entity_3577a252e5
    port map (
      ce_1 => ce_1_sg_x46,
      ce_1113 => ce_1113_sg_x14,
      ce_logic_1 => ce_logic_1_sg_x17,
      clk_1 => clk_1_sg_x46,
      clk_1113 => clk_1113_sg_x14,
      mix_i_in => mix_ch0_i_o_net,
      mix_q_in => mix_ch0_q_o_net,
      amp_f => fofb_amp_ch0_o_net,
      cic_fofb_i_fpga_out => cic_fofb_ch0_i_o_net,
      cic_fofb_q_fpga_out => cic_fofb_ch0_q_o_net,
      valid_f => register6_q_net_x4
    );

  channel0_tbt_b3ebb9eccb: entity work.channel0_tbt_entity_b3ebb9eccb
    port map (
      ce_1 => ce_1_sg_x46,
      ce_35 => ce_35_sg_x13,
      ce_logic_1 => ce_logic_1_sg_x17,
      clk_1 => clk_1_sg_x46,
      clk_35 => clk_35_sg_x13,
      data_in => register_q_net_x8,
      dds_cosine_in => dds_m_axis_data_tdata_cosine_net_x11,
      dds_msine_in => dds_m_axis_data_tdata_sine_net_x11,
      dds_valid_in => dds_m_axis_data_tvalid_net_x11,
      amp_f => tbt_amp_ch0_o_net,
      decim_35_i_fpga_out => poly35_ch0_i_o_net,
      decim_35_q_fpga_out => poly35_ch0_q_o_net,
      mix_i => mix_ch0_i_o_net,
      mix_q => mix_ch0_q_o_net,
      valid_f => register6_q_net_x5
    );

  channel1_fofb_8f5127405d: entity work.channel0_fofb_entity_3577a252e5
    port map (
      ce_1 => ce_1_sg_x46,
      ce_1113 => ce_1113_sg_x14,
      ce_logic_1 => ce_logic_1_sg_x17,
      clk_1 => clk_1_sg_x46,
      clk_1113 => clk_1113_sg_x14,
      mix_i_in => mix_ch1_i_o_net,
      mix_q_in => mix_ch1_q_o_net,
      amp_f => fofb_amp_ch1_o_net,
      cic_fofb_i_fpga_out => cic_fofb_ch1_i_o_net,
      cic_fofb_q_fpga_out => cic_fofb_ch1_q_o_net,
      valid_f => register6_q_net_x6
    );

  channel1_tbt_8d468f1125: entity work.channel0_tbt_entity_b3ebb9eccb
    port map (
      ce_1 => ce_1_sg_x46,
      ce_35 => ce_35_sg_x13,
      ce_logic_1 => ce_logic_1_sg_x17,
      clk_1 => clk_1_sg_x46,
      clk_35 => clk_35_sg_x13,
      data_in => register_q_net_x9,
      dds_cosine_in => dds_m_axis_data_tdata_cosine_net_x11,
      dds_msine_in => dds_m_axis_data_tdata_sine_net_x11,
      dds_valid_in => dds_m_axis_data_tvalid_net_x11,
      amp_f => tbt_amp_ch1_o_net,
      decim_35_i_fpga_out => poly35_ch1_i_o_net,
      decim_35_q_fpga_out => poly35_ch1_q_o_net,
      mix_i => mix_ch1_i_o_net,
      mix_q => mix_ch1_q_o_net,
      valid_f => register6_q_net_x7
    );

  channel2_fofb_c122b5720b: entity work.channel0_fofb_entity_3577a252e5
    port map (
      ce_1 => ce_1_sg_x46,
      ce_1113 => ce_1113_sg_x14,
      ce_logic_1 => ce_logic_1_sg_x17,
      clk_1 => clk_1_sg_x46,
      clk_1113 => clk_1113_sg_x14,
      mix_i_in => mix_ch2_i_o_net,
      mix_q_in => mix_ch2_q_o_net,
      amp_f => fofb_amp_ch2_o_net,
      cic_fofb_i_fpga_out => cic_fofb_ch2_i_o_net,
      cic_fofb_q_fpga_out => cic_fofb_ch2_q_o_net,
      valid_f => register6_q_net_x8
    );

  channel2_tbt_c5e2abdcfa: entity work.channel0_tbt_entity_b3ebb9eccb
    port map (
      ce_1 => ce_1_sg_x46,
      ce_35 => ce_35_sg_x13,
      ce_logic_1 => ce_logic_1_sg_x17,
      clk_1 => clk_1_sg_x46,
      clk_35 => clk_35_sg_x13,
      data_in => register_q_net_x11,
      dds_cosine_in => dds_m_axis_data_tdata_cosine_net_x11,
      dds_msine_in => dds_m_axis_data_tdata_sine_net_x11,
      dds_valid_in => dds_m_axis_data_tvalid_net_x11,
      amp_f => tbt_amp_ch2_o_net,
      decim_35_i_fpga_out => poly35_ch2_i_o_net,
      decim_35_q_fpga_out => poly35_ch2_q_o_net,
      mix_i => mix_ch2_i_o_net,
      mix_q => mix_ch2_q_o_net,
      valid_f => register6_q_net_x9
    );

  channel3_fofb_79576133ce: entity work.channel0_fofb_entity_3577a252e5
    port map (
      ce_1 => ce_1_sg_x46,
      ce_1113 => ce_1113_sg_x14,
      ce_logic_1 => ce_logic_1_sg_x17,
      clk_1 => clk_1_sg_x46,
      clk_1113 => clk_1113_sg_x14,
      mix_i_in => mix_ch3_i_o_net,
      mix_q_in => mix_ch3_q_o_net,
      amp_f => fofb_amp_ch3_o_net,
      cic_fofb_i_fpga_out => cic_fofb_ch3_i_o_net,
      cic_fofb_q_fpga_out => cic_fofb_ch3_q_o_net,
      valid_f => register6_q_net_x10
    );

  channel3_tbt_63129db436: entity work.channel0_tbt_entity_b3ebb9eccb
    port map (
      ce_1 => ce_1_sg_x46,
      ce_35 => ce_35_sg_x13,
      ce_logic_1 => ce_logic_1_sg_x17,
      clk_1 => clk_1_sg_x46,
      clk_35 => clk_35_sg_x13,
      data_in => register_q_net_x12,
      dds_cosine_in => dds_m_axis_data_tdata_cosine_net_x11,
      dds_msine_in => dds_m_axis_data_tdata_sine_net_x11,
      dds_valid_in => dds_m_axis_data_tvalid_net_x11,
      amp_f => tbt_amp_ch3_o_net,
      decim_35_i_fpga_out => poly35_ch3_i_o_net,
      decim_35_q_fpga_out => poly35_ch3_q_o_net,
      mix_i => mix_ch3_i_o_net,
      mix_q => mix_ch3_q_o_net,
      valid_f => register6_q_net_x11
    );

  constant3: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net
    );

  dds: entity work.xldds_compiler_b7bbc719459e4bb4074716a9175f7d86
    port map (
      ce => ce_1_sg_x46,
      clk => clk_1_sg_x46,
      m_axis_data_tready => constant3_op_net,
      m_axis_data_tdata_cosine => dds_m_axis_data_tdata_cosine_net_x11,
      m_axis_data_tdata_sine => dds_m_axis_data_tdata_sine_net_x11,
      m_axis_data_tvalid => dds_m_axis_data_tvalid_net_x11
    );

  decim_monit_56a50fad1d: entity work.decim_monit_entity_56a50fad1d
    port map (
      ce_1 => ce_1_sg_x46,
      ce_1113 => ce_1113_sg_x14,
      ce_11130000 => ce_11130000_sg_x5,
      ce_2782500 => ce_2782500_sg_x5,
      ce_5565000 => ce_5565000_sg_x5,
      ce_logic_1113 => ce_logic_1113_sg_x1,
      ce_logic_2782500 => ce_logic_2782500_sg_x1,
      ce_logic_5565000 => ce_logic_5565000_sg_x1,
      clk_1 => clk_1_sg_x46,
      clk_1113 => clk_1113_sg_x14,
      clk_11130000 => clk_11130000_sg_x5,
      clk_2782500 => clk_2782500_sg_x5,
      clk_5565000 => clk_5565000_sg_x5,
      data_in_q => down_sample2_q_net_x0,
      data_in_sum => down_sample3_q_net_x0,
      data_in_x => down_sample_q_net_x0,
      data_in_y => down_sample1_q_net_x0,
      monit_q_out => q_monit_o_net,
      monit_sum_out => sum_monit_o_net,
      monit_x_out => x_monit_o_net,
      monit_y_out => y_monit_o_net
    );

  delta_sigma_fofb_ee61e649ea: entity work.delta_sigma_fofb_entity_ee61e649ea
    port map (
      a => fofb_amp_ch0_o_net,
      avalid => register6_q_net_x4,
      b => fofb_amp_ch1_o_net,
      bvalid => register6_q_net_x6,
      c => fofb_amp_ch2_o_net,
      ce_1 => ce_1_sg_x46,
      ce_1113 => ce_1113_sg_x14,
      clk_1 => clk_1_sg_x46,
      clk_1113 => clk_1113_sg_x14,
      cvalid => register6_q_net_x8,
      d => fofb_amp_ch3_o_net,
      delta_sigma_thres => del_sig_div_fofb_thres_i_net,
      dvalid => register6_q_net_x10,
      q => q_fofb_o_net,
      sum_x0 => sum_fofb_o_net,
      x => x_fofb_o_net,
      y => y_fofb_o_net
    );

  delta_sigma_tbt_bbfa8a8a69: entity work.delta_sigma_tbt_entity_bbfa8a8a69
    port map (
      a => tbt_amp_ch0_o_net,
      avalid => register6_q_net_x5,
      b => tbt_amp_ch1_o_net,
      bvalid => register6_q_net_x7,
      c => tbt_amp_ch2_o_net,
      ce_1 => ce_1_sg_x46,
      ce_35 => ce_35_sg_x13,
      clk_1 => clk_1_sg_x46,
      clk_35 => clk_35_sg_x13,
      cvalid => register6_q_net_x9,
      d => tbt_amp_ch3_o_net,
      delta_sigma_thres => del_sig_div_tbt_thres_i_net,
      dvalid => register6_q_net_x11,
      q => q_tbt_o_net,
      sum_x0 => sum_tbt_o_net,
      x => x_tbt_o_net,
      y => y_tbt_o_net
    );

  down_sample: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 23,
      d_width => 24,
      ds_ratio => 1113,
      latency => 1,
      phase => 1112,
      q_arith => xlSigned,
      q_bin_pt => 23,
      q_width => 24
    )
    port map (
      d => x_fofb_o_net,
      dest_ce => ce_1113_sg_x14,
      dest_clk => clk_1113_sg_x14,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x46,
      src_clk => clk_1_sg_x46,
      src_clr => '0',
      q => down_sample_q_net_x0
    );

  down_sample1: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 23,
      d_width => 24,
      ds_ratio => 1113,
      latency => 1,
      phase => 1112,
      q_arith => xlSigned,
      q_bin_pt => 23,
      q_width => 24
    )
    port map (
      d => y_fofb_o_net,
      dest_ce => ce_1113_sg_x14,
      dest_clk => clk_1113_sg_x14,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x46,
      src_clk => clk_1_sg_x46,
      src_clr => '0',
      q => down_sample1_q_net_x0
    );

  down_sample2: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 23,
      d_width => 24,
      ds_ratio => 1113,
      latency => 1,
      phase => 1112,
      q_arith => xlSigned,
      q_bin_pt => 23,
      q_width => 24
    )
    port map (
      d => q_fofb_o_net,
      dest_ce => ce_1113_sg_x14,
      dest_clk => clk_1113_sg_x14,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x46,
      src_clk => clk_1_sg_x46,
      src_clr => '0',
      q => down_sample2_q_net_x0
    );

  down_sample3: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 20,
      d_width => 24,
      ds_ratio => 1113,
      latency => 1,
      phase => 1112,
      q_arith => xlSigned,
      q_bin_pt => 20,
      q_width => 24
    )
    port map (
      d => sum_fofb_o_net,
      dest_ce => ce_1113_sg_x14,
      dest_clk => clk_1113_sg_x14,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x46,
      src_clk => clk_1_sg_x46,
      src_clr => '0',
      q => down_sample3_q_net_x0
    );

end structural;