`timescale 1ns/1ps
`include "regset_6_bit_with_5.v"

module regset_6_bit_with_5_tb;
    reg [2:0] wr;
    reg we;
    reg [5:0] wrd;
    reg [2:0] ra;
    reg [2:0] rb;
    wire [5:0] a;
    wire [5:0] b;
    reg clk;

    regset_6_bit_with_5 uut(wr, we, wrd, ra, rb, a, b, clk);
    always #5 clk = ~clk;
    initial
    begin
        clk <= 1;
        wr <= 3'b000;
        wrd <= 7;
        we <= 1;
        #30;
        wr <= 3'b001;
        wrd <= 6;
        we <= 1;
        #30;
        ra <= 3'b000;
        #30;
        ra <= 3'bxxx;
        rb <= 3'b001;
        #30;
        $finish;
    end
    initial begin
        $dumpfile("regset_6_bit_with_5.vcd");
        $dumpvars(0, regset_6_bit_with_5_tb);
        $monitor("clk=%b we=%b wr=%b wrd=%b ra=%b rb=%b a=%b b=%b", clk, we, wr, wrd, ra, rb, a, b);
    end
endmodule