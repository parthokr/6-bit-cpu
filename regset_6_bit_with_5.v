`include "reg_6_bit.v"
`include "dec_3_to_8_with_en.v"
`include "mux_8_to_1_6_bit.v"

module regset_6_bit_with_5(
    input wire [2:0] wr,
    input wire we,
    input wire [5:0] wrd,
    input wire [2:0] ra,
    input wire [2:0] rb,
    output wire [5:0] a,
    output wire [5:0] b,
    input wire clk
);
    
    wire [7:0] selected_reg;
    dec_3_to_8_with_en dec1(wr, we, selected_reg);

    wire [5:0] reg0, reg1, reg2, reg3, reg4;
    reg_6_bit r0(.d_in(wrd), .d_out(reg0), .sel(selected_reg[0]), .clk(clk));
    reg_6_bit r1(.d_in(wrd), .d_out(reg1), .sel(selected_reg[1]), .clk(clk));
    reg_6_bit r2(.d_in(wrd), .d_out(reg2), .sel(selected_reg[2]), .clk(clk));
    reg_6_bit r3(.d_in(wrd), .d_out(reg3), .sel(selected_reg[3]), .clk(clk));
    reg_6_bit r4(.d_in(wrd), .d_out(reg4), .sel(selected_reg[4]), .clk(clk));

    
    mux_8_to_1_6_bit m1(.i0(reg0), .i1(reg1), .i2(reg2), .i3(reg3), .i4(reg4), .i5(6'b000000), .i6(6'b000000), .i7(6'b000000), .sel(ra), .out(a));
    mux_8_to_1_6_bit m2(.i0(reg0), .i1(reg1), .i2(reg2), .i3(reg3), .i4(reg4), .i5(6'b000000), .i6(6'b000000), .i7(6'b000000), .sel(rb), .out(b));



endmodule