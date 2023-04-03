`timescale 1ns/1ps
`include "reg_1_bit.v"

module reg_1_bit_tb;
    reg d_in;
    wire d_out;
    reg sel;
    reg clk;


    reg_1_bit uut(d_in, d_out, sel, clk);
    always #10 clk = ~clk;
    initial begin
        clk <= 0;
        sel <= 0;
        d_in <= 1'b0;
        #20
        sel <= 1;
        d_in <= 1'b1;
        #20
        sel <= 1;
        d_in <= 1'b0;
        #20;
        $finish;
    end
    initial begin
        $dumpfile("reg_1_bit.vcd");
        $dumpvars(0, reg_1_bit_tb);
        $monitor("sel=%b clk=%b d=%b q=%b", sel, clk, d_in, d_out);
    end
endmodule