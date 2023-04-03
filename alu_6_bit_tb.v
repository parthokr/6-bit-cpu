`timescale 1ns/1ps
`include "alu_6_bit.v"

module alu_6_bit_tb; 
    reg [5:0] a, b;
    reg cf_prev;
    reg [1:0] op;
    wire [5:0] r;
    wire cf, sf, zf;

    alu_6_bit uut(a, b, cf_prev, op, r, cf, sf, zf);
    initial begin
        cf_prev <= 1;
        a <= 6'b010101;
        b <= 6'b000000;
        op <= 2'b10;
        #20
        a <= 6'b010101;
        b <= 6'b000001;
        op <= 2'b01;
        #20
        cf_prev <= 0;
        a <= 6'b111100;
        b <= 6'b000001;
        op <= 01;
        #20
        cf_prev <= 0;
        a <= 6'b100101;
        b <= 6'b001100;
        op <= 2'b10;
        #20
        a <= 6'b111111;
        b <= 6'b000001;
        op <= 2'b01;
        #30
        $finish;
    end
    initial begin
        $dumpfile("alu_6_bit.vcd");
        $dumpvars(0, alu_6_bit_tb);
        $monitor("a=%b b=%b op=%b r=%b cf_prev=%b cf=%b sf=%b zf=%b", a, b, op, r, cf_prev, cf, sf, zf);
    end
endmodule