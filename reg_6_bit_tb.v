`timescale 1ns/1ps
`include "reg_6_bit.v"

module reg_6_bit_tb;
    reg [5:0] d_in;
    wire [5:0] d_out;
    reg sel;
    reg clk;


    reg_6_bit uut(d_in, d_out, sel, clk);
    always #10 clk = ~clk;
    initial begin
        clk <= 0;
        sel <= 0;
        d_in <= 6'b010101;
        #20
        sel <= 1;
        d_in <= 6'b001100;
        #20
        sel <= 1;
        d_in <= 6'b111100;
        #20;
        $finish;
    end
    initial begin
        $dumpfile("reg_6_bit.vcd");
        $dumpvars(0, reg_6_bit_tb);
        $monitor("sel=%b clk=%b d=%b q=%b", sel, clk, d_in, d_out);
    end
endmodule