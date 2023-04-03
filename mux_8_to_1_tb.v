`timescale 1ns/1ps
`include "mux_8_to_1.v"

module mux_8_to_1_tb; 
    reg i0, i1, i2, i3, i4, i5, i6, i7;
    reg [2:0] sel;
    wire out;


    mux_8_to_1 uut(i0, i1, i2, i3, i4, i5, i6, i7, sel, out);
    initial begin
        assign i0 = 0;
        assign i1 = 1;
        assign i2 = 0;
        assign i3 = 0;
        assign i4 = 1;
        assign i5 = 0;
        assign i6 = 1;
        assign i7 = 1;

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
        $dumpfile("mux_8_to_1.vcd");
        $dumpvars(0, mux_8_to_1_tb);
        $monitor("sel=%b out=%b", sel, out);
    end
endmodule