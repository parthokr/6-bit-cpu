`timescale 1ns/1ps
`include "rol_6_bit.v"

module rol_6_bit_tb; 
    reg [5:0] a, b;
    reg cf_prev;
    wire [5:0] r;
    wire cf, sf, zf;

    rol_6_bit uut(a, b, cf_prev, r, cf, sf, zf);
    initial begin
        cf_prev <= 1;
        a <= 6'b010101;
        b <= 6'b000000;
        #20
        a <= 6'b010101;
        b <= 6'b000001;
        #20
        cf_prev <= 0;
        a <= 6'b111100;
        b <= 6'b000001;
        #20
        cf_prev <= 0;
        a <= 6'b100101;
        b <= 6'b001100;
        #30
        $finish;
    end
    initial begin
        $dumpfile("rol_6_bit.vcd");
        $dumpvars(0, rol_6_bit_tb);
        $monitor("a=%b b=%b r=%b cf_prev=%b cf=%b sf=%b zf=%b", a, b, r, cf_prev, cf, sf, zf);
    end
endmodule