`include "or_6_bit.v"
`include "adder_6_bit.v"
`include "rol_6_bit.v"
`include "mux_4_to_1_6_bit.v"
`include "mux_4_to_1_3_bit.v"


module alu_6_bit(
    input wire [5:0] a,
    input wire [5:0] b,
    input wire cf_prev,
    input wire [1:0] op,
    output wire [5:0] r,
    output wire cf,
    output wire sf,
    output wire zf
);

wire [5:0] r0, r1, r2;
wire cf0, sf0, zf0;
wire cf1, sf1, zf1;
wire cf2, sf2, zf2;
or_6_bit res1(a, b, r0, cf0, sf0, zf0);
adder_6_bit res0(a, b, r1, cf1, sf1, zf1);
rol_6_bit res2(a, b, cf_prev, r2, cf2, sf2, zf2);
mux_4_to_1_6_bit select_result(r0, r1, r2, 6'b000000, op, r);
mux_4_to_1_3_bit select_flag({cf0, sf0, zf0}, {cf1, sf1, zf1}, {cf2, sf2, zf2}, 3'b000, op, {cf, sf, zf});


endmodule