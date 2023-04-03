`include "full_adder.v"
module adder_6_bit(
    input wire [5:0] a,
    input wire [5:0] b,
    output wire [5:0] r,
    output cf,
    output sf,
    output zf
);

wire c1, c2, c3, c4, c5;
full_adder fa0(a[0], b[0], 1'b0, r[0], c1);
full_adder fa1(a[1], b[1], c1, r[1], c2);
full_adder fa2(a[2], b[2], c2, r[2], c3);
full_adder fa3(a[3], b[3], c3, r[3], c4);
full_adder fa4(a[4], b[4], c4, r[4], c5);
full_adder fa5(a[5], b[5], c5, r[5], cf);

assign sf = r[5];
assign zf = ~r[0] & ~r[1] & ~r[2] & ~r[3] & ~r[4] & ~r[5];


endmodule