`include "ram_7x17.v"
`include "pc_3_bit.v"
`include "pca_3_bit.v"
`include "mux_2_to_1_3_bit.v"
`include "control_unit.v"
`include "flag_register.v"
`include "regset_6_bit_with_5.v"
`include "alu_6_bit.v"
`include "mux_2_to_1_6_bit.v"


module cpu(
    // input
    input wire [2:0] ra2,
    input wire [2:0] wr,
    input wire [16:0] wrd,
    input wire we,
    input wire clk,
    input wire pc_en,

    // output
    output wire [1:0] debug_op,
    output wire [16:0] debug_rd2,
    output wire [2:0] debug_ins_num, // instruction number
    output wire [2:0] debug_ra, 
    output wire [2:0] debug_rb,
    output wire [5:0] debug_a,
    output wire [5:0] debug_b,
    output wire debug_cpu_clk,
    output wire debug_imm_sel,
    output wire debug_jmp_sel,
    output wire [5:0] debug_imm_data,
    output wire [5:0] debug_result_from_alu
);

// wire cpu_clk;
assign cpu_clk = (pc_en & clk);

// prog counter adder
wire [2:0] output_of_prog_counter_adder; // output of prog counter adder
pca_3_bit get_output_of_prog_counter_adder(.in(output_of_prog_counter), 
                                            .out(output_of_prog_counter_adder));

// program counter
wire [2:0] next_ins_or_jmp_data; // input of prog counter
// make ready the next instruction or jump data
mux_2_to_1_3_bit get_next_ins_or_jmp_data(.sel(jmp_sel),
                                          .i0(output_of_prog_counter_adder), 
                                          .i1(jmp_data),
                                          .out(next_ins_or_jmp_data));
wire [2:0] output_of_prog_counter; // output of prog counter
pc_3_bit pc(.in(next_ins_or_jmp_data), .clk(cpu_clk), .out(output_of_prog_counter));


wire [16:0] output_of_ram1, output_of_ram2; // output of ram
ram_7x17 get_output_of_ram(
    .ra1(output_of_prog_counter),
    .ra2(ra2), // user input
    .wr(wr),
    .wrd(wrd),
    .we(we),
    .clk(clk),
    .rd1(output_of_ram1),
    .rd2(output_of_ram2)
); 

// split the output of ram into opcode, r1, r2, jmp_data, imm_data
wire [3:0] opcode;
assign opcode = output_of_ram1[16:13];
wire [2:0] ra, rb;
assign ra = output_of_ram1[12:10];
assign rb = output_of_ram1[9:7];

wire [2:0] jmp_data;
wire [5:0] imm_data;
assign jmp_data = output_of_ram1[12:10];
assign imm_data = output_of_ram1[9:4];

// control unit
// prepare the output for control unit
wire [1:0] op;
wire jmp_sel;
wire imm_sel;
wire reg_en;
control_unit get_control_unit(
    // input
    .opcode(opcode), 
    // output
    .op(op), 
    .jmp_sel(jmp_sel), 
    .imm_sel(imm_sel),
    .reg_en(reg_en),
    .cf(cf_out_from_flag_register),
    .sf(select_flag),
    .zf(zf_out_from_flag_register)
    );

// register set
wire [5:0] regset_out_a, regset_out_b;
regset_6_bit_with_5 get_regset(
    // INPUT
    .wr(ra),
    .we(reg_en),
    .wrd(result_from_alu), 
    .ra(ra),
    .rb(rb), 
    .clk(cpu_clk),
    // OUTPUT
    .a(regset_out_a),
    .b(regset_out_b)
    );

// ALU
// prepare the input of ALU
wire [5:0] reg_value_or_imm_data; // input of ALU [b or imm_data]
mux_2_to_1_6_bit get_reg_value_or_imm_data(.sel(imm_sel),
                                            .i0(regset_out_b),
                                            .i1(imm_data),
                                            .out(reg_value_or_imm_data));
// prepare the output of ALU
wire cf_out_from_alu, sf_out_from_alu, zf_out_from_alu;
wire [5:0] result_from_alu; // connect with register set [wrd]
alu_6_bit get_alu_result(
    // input
    .a(regset_out_a),
    .b(reg_value_or_imm_data),
    .cf_prev(cf_out_from_flag_register),
    .op(op),
    // output
    .r(result_from_alu),
    .cf(cf_out_from_alu),
    .sf(sf_out_from_alu),
    .zf(zf_out_from_alu)
    );
assign alu_out = result_from_alu;


// flag register
wire cf_out_from_flag_register, sf_out_from_flag_register, zf_out_from_flag_register;
flag_register get_flags_from_flag_register(
    // input
    .cf(cf_out_from_alu),
    .sf(sf_out_from_alu),
    .zf(zf_out_from_alu),
    .clk(cpu_clk),
    // output
    .cf_out(cf_out_from_flag_register),
    .sf_out(sf_out_from_flag_register),
    .zf_out(zf_out_from_flag_register)
    );
    

// send output to debug
assign debug_op = op;
assign debug_rd2 = output_of_ram2;
assign debug_ins_num = output_of_prog_counter;
assign debug_ra = ra;
assign debug_rb = rb;
assign debug_a = regset_out_a;
assign debug_b = regset_out_b;
assign debug_cpu_clk = cpu_clk;
assign debug_imm_sel = imm_sel;
assign debug_jmp_sel = jmp_sel;
assign debug_imm_data = imm_data;
assign debug_result_from_alu = result_from_alu;

endmodule