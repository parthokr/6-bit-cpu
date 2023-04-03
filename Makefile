all:
	make reg_6_bit
	make dec_3_to_8
	make regset
	make mux
	make mux6
	make mux4_2_1_6b
	make mux4_2_1_3b
	make mux2_1_3b
	make mux2_1_6b
	make or
	make fa
	make adder
	make rol
	make alu
	make flag_reg
	make ram_1x1
	make ram_1x17
	make ram_7x17
	make pc
	make pca
	make cu
	make cpu

reg_1_bit:
		iverilog -o reg_1_bit.vvp reg_1_bit_tb.v
		vvp reg_1_bit.vvp

reg_6_bit:
		iverilog -o reg_6_bit.vvp reg_6_bit_tb.v
		vvp reg_6_bit.vvp

dec_3_to_8:
		iverilog -o dec_3_to_8.vvp dec_3_to_8_tb.v
		vvp dec_3_to_8.vvp

regset:
		iverilog -o regset_6_bit_with_5.vvp regset_6_bit_with_5_tb.v
		vvp regset_6_bit_with_5.vvp
mux:
		iverilog -o mux_8_to_1.vvp mux_8_to_1_tb.v
		vvp mux_8_to_1.vvp
mux6:
		iverilog -o mux_8_to_1_6_bit.vvp mux_8_to_1_6_bit_tb.v
		vvp mux_8_to_1_6_bit.vvp
mux4_2_1_6b:
		iverilog -o mux_4_to_1_6_bit.vvp mux_4_to_1_6_bit_tb.v
		vvp mux_4_to_1_6_bit.vvp
mux4_2_1_3b:
		iverilog -o mux_4_to_1_3_bit.vvp mux_4_to_1_3_bit_tb.v
		vvp mux_4_to_1_3_bit.vvp
mux2_1_3b:
		iverilog -o mux_2_to_1_3_bit.vvp mux_2_to_1_3_bit_tb.v
		vvp mux_2_to_1_3_bit.vvp
mux2_1_6b:
		iverilog -o mux_2_to_1_6_bit.vvp mux_2_to_1_6_bit_tb.v
		vvp mux_2_to_1_6_bit.vvp
or:
		iverilog -o or_6_bit.vvp or_6_bit_tb.v
		vvp or_6_bit.vvp
fa:
		iverilog -o full_adder.vvp full_adder_tb.v
		vvp full_adder.vvp
adder:
		iverilog -o adder_6_bit.vvp adder_6_bit_tb.v
		vvp adder_6_bit.vvp
rol:
		iverilog -o rol_6_bit.vvp rol_6_bit_tb.v
		vvp rol_6_bit.vvp
alu:
		iverilog -o alu_6_bit.vvp alu_6_bit_tb.v
		vvp alu_6_bit.vvp
flag_reg:
		iverilog -o flag_register.vvp flag_register_tb.v
		vvp flag_register.vvp
ram_1x1:
		iverilog -o ram_1x1.vvp ram_1x1_tb.v
		vvp ram_1x1.vvp
ram_1x17:
		iverilog -o ram_1x17.vvp ram_1x17_tb.v
		vvp ram_1x17.vvp
ram_7x17:
		iverilog -o ram_7x17.vvp ram_7x17_tb.v
		vvp ram_7x17.vvp
pc:
		iverilog -o pc_3_bit.vvp pc_3_bit_tb.v
		vvp pc_3_bit.vvp
pca:
		iverilog -o pca_3_bit.vvp pca_3_bit_tb.v
		vvp pca_3_bit.vvp
cu:
		iverilog -o control_unit.vvp control_unit_tb.v
		vvp control_unit.vvp
cpu:
		iverilog -o cpu.vvp cpu_tb.v
		vvp cpu.vvp
clean:
		rm -r *.vvp
		rm -r *.vcd