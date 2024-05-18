# .PHONY: vcs sim clean

# TEST_DESIGN = radix2_div

# vcs:
# 		vcs -sverilog +v2k -timescale=1ns/1ns       \
# 		-debug_all         							\
# 		-l compile.log 								\
# 		${TEST_DESIGN}.v testbench.v

# sim:
# 		./simv -l run.log

# clean:
# 		rm -rf *.log  csrc  simv*  *.key *.vpd  DVEfiles coverage *.vdb output.txt

.PHONY: modelsim sim clean

TEST_DESIGN = radix2_div

modelsim:
		vlib work
		vlog +acc -work work -sv ${TEST_DESIGN}.v testbench.v

sim:
		vsim -c -do "run -all; quit" testbench

clean:
		rm -rf *.log  work transcript vsim.wlf *.vcd