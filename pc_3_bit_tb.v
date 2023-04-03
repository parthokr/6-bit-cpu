`timescale 1ns/1ps
`include "pc_3_bit.v"

module pc_3_bit_tb;
    reg [2:0] in;
    reg clk;
    wire [2:0] out;
    pc_3_bit uut(in, clk, out);
    always #5 clk = ~clk;
    initial begin
        // in <= 1;
        // #20;
        // in <= 2;
        // #20;
        // in <= 7;
        // #20;
        #20;
        $finish;
    end
    initial begin
        $dumpfile("pc_3_bit.vcd");
        $dumpvars(0, pc_3_bit_tb);
        $monitor("in=%b out=%b", in, out);
    end
endmodule