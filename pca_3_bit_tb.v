`timescale 1ns/1ps
`include "pca_3_bit.v"

module pca_3_bit_tb;
    reg [2:0] in;
    wire [2:0] out;
    pca_3_bit uut(in, out);
    initial begin
        #20;
        $finish;
    end
    initial
    begin
        $dumpfile("pca_3_bit.vcd");
        $dumpvars(0, pca_3_bit_tb);
        $monitor("in=%b out=%b", in, out);
    end

endmodule