########################################################################
# 공통 3.3 V I/O
set_property IOSTANDARD LVCMOS33 \
  [get_ports {clk rst_n led[*]}]

########################################################################
# 100 MHz 시스템 클럭   (← 매뉴얼: SYS_CLK_100M = R4)
set_property PACKAGE_PIN R4 [get_ports clk]
create_clock -period 10.0 [get_ports clk]

########################################################################
# Reset (active-Low)   SW23 = U7
set_property PACKAGE_PIN U7 [get_ports rst_n]

########################################################################
# 16 LEDs   (매뉴얼 핀)
set_property PACKAGE_PIN Y18  [get_ports {led[0]}]
set_property PACKAGE_PIN AA18 [get_ports {led[1]}]
set_property PACKAGE_PIN AB18 [get_ports {led[2]}]
set_property PACKAGE_PIN W19  [get_ports {led[3]}]
set_property PACKAGE_PIN Y19  [get_ports {led[4]}]
set_property PACKAGE_PIN AA19 [get_ports {led[5]}]
set_property PACKAGE_PIN W20  [get_ports {led[6]}]
set_property PACKAGE_PIN AA20 [get_ports {led[7]}]
set_property PACKAGE_PIN AB20 [get_ports {led[8]}]
set_property PACKAGE_PIN W21  [get_ports {led[9]}]
set_property PACKAGE_PIN Y21  [get_ports {led[10]}]
set_property PACKAGE_PIN AA21 [get_ports {led[11]}]
set_property PACKAGE_PIN AB21 [get_ports {led[12]}]
set_property PACKAGE_PIN W22  [get_ports {led[13]}]
set_property PACKAGE_PIN Y22  [get_ports {led[14]}]
set_property PACKAGE_PIN AB22 [get_ports {led[15]}]

# ───────────────────────────────
# ※ 7-세그 seg/an 관련 줄은 모두 삭제하거나
#    앞에 #을 붙여 주석 처리
# ───────────────────────────────
