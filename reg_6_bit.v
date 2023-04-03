`include "reg_1_bit.v"
module reg_6_bit(
    input wire [5:0] d_in,
    output wire [5:0] d_out,
    input wire sel,
    input wire clk
);
reg_1_bit r0(.d_in(d_in[0]), .d_out(d_out[0]), .sel(sel), .clk(clk));
reg_1_bit r1(.d_in(d_in[1]), .d_out(d_out[1]), .sel(sel), .clk(clk));
reg_1_bit r2(.d_in(d_in[2]), .d_out(d_out[2]), .sel(sel), .clk(clk));
reg_1_bit r3(.d_in(d_in[3]), .d_out(d_out[3]), .sel(sel), .clk(clk));
reg_1_bit r4(.d_in(d_in[4]), .d_out(d_out[4]), .sel(sel), .clk(clk));
reg_1_bit r5(.d_in(d_in[5]), .d_out(d_out[5]), .sel(sel), .clk(clk));

endmodule