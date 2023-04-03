`timescale 1ns/1ps
`include "mux_2_to_1_3_bit.v"

module mux_2_to_1_3_bit_tb; 
    reg [2:0] i0, i1;
    reg sel;
    wire [2:0] out;


    mux_2_to_1_3_bit uut(i0, i1, sel, out);
    initial begin
        assign i0 = 0;
        assign i1 = 4;
        sel <= 0;
        #20
        sel <= 1;
        #20;
        $finish;
    end
    initial begin
        $dumpfile("mux_2_to_1_3_bit.vcd");
        $dumpvars(0, mux_2_to_1_3_bit_tb);
        $monitor("sel=%b out=%b", sel, out);
    end
endmodule