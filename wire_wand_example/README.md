# Verilog_Basics

이 저장소는 Verilog 학습을 위한 예제 코드와 시뮬레이션 결과 파일을 포함합니다.

## wire_wand_example

이 폴더에는 net 자료형인 `wire`와 `wand`의 동작 차이를 이해하기 위한 Verilog 예제 코드가 있습니다.
- `wire_wand_example.v`: 메인 모듈
- `wire_wand_example_tb.v`: 테스트 벤치
- `wire_wand_example.vcd`: 시뮬레이션 파형 데이터
- `wire_wand_example_sim`: 시뮬레이션 실행 파일

### 시뮬레이션 방법
#VSCode와 GTKWave를 이용하여 시뮬레이션 했습니다.
# gtkwave 문제 시 $display로 실행
# Verilog-2001 문법을 따라 input reg를 input으로 지정
```bash
iverilog -o wire_wand_example_sim wire_wand_example.v wire_wand_example_tb.v
vvp wire_wand_example_sim
gtkwave wire_wand_example.vcd
# gtkwave 문제 시 $display로 실행
# Verilog-2001 문법을 따라 input reg를 input으로 지정
