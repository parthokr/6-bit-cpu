`timescale 1ns/1ps
`include "adder_6_bit.v"

module adder_6_bit_tb;
    reg [5:0] a, b;
    wire [5:0] r;
    wire cf, sf, zf;

    adder_6_bit uut(a, b, r, cf, sf, zf);
    initial
    begin
        a <= 6'b010101;
        b <= 6'b001100;
        #20;
        a <= 6'b111100;
        b <= 6'b000000;
        #20;
        a <= 6'b111111;
        b <= 6'b000001;
        $finish;
    end
    initial begin
        $dumpfile("adder_6_bit.vcd");
        $dumpvars(0, adder_6_bit_tb);
        $monitor("a=%b b=%b r=%b cf=%b sf=%b zf=%b", a, b, r, cf, sf, zf);
    end
endmodule