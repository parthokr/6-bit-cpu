`timescale 1ns/1ps
`include "or_6_bit.v"

module or_6_bit_tb;
    reg [5:0] a, b;
    wire [5:0] c;
    wire cf, sf, zf;

    or_6_bit uut(a, b, c, cf, sf, zf);
    initial
    begin
        a <= 6'b010101;
        b <= 6'b001100;
        #20;
        a <= 6'b111100;
        b <= 6'b000000;
        #20;
        a <= 6'b000000;
        b <= 6'b000000;
        #20;
        $finish;
    end
    initial begin
        $dumpfile("or_6_bit.vcd");
        $dumpvars(0, or_6_bit_tb);
        $monitor("a=%b b=%b c=%b, cf=%b, sf=%b, zf=%b", a, b, c, cf, sf, zf);
    end
endmodule