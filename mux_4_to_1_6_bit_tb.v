`timescale 1ns/1ps
`include "mux_4_to_1_6_bit.v"

module mux_4_to_1_6_bit_tb; 
    reg [5:0] i0, i1, i2, i3;
    reg [1:0] sel;
    wire [5:0] out;


    mux_4_to_1_6_bit uut(i0, i1, i2, i3, sel, out);
    initial begin
            assign i0 = 0;
            assign i1 = 1;
            assign i2 = 2;
            assign i3 = 3;
        sel <= 0;
        #20
        sel <= 1;
        #20
        sel <= 2;
        #20
        sel <= 3;
        #20
        sel <= 4;
        #20
        sel <= 5;
        #20
        sel <= 6;
        #20
        sel <= 7;
        #20
        #20;
        $finish;
    end
    initial begin
        $dumpfile("mux_4_to_1_6_bit.vcd");
        $dumpvars(0, mux_4_to_1_6_bit_tb);
        $monitor("sel=%b out=%b", sel, out);
    end
endmodule