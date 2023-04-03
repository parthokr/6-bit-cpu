`timescale 1ns/1ps
`include "dec_3_to_8.v"

module dec_3_to_8_tb;
    reg [2:0] A;
    wire [7:0] Y;

    dec_3_to_8 uut(A, Y);

    initial begin
        A <= 3'b001; #10
        A <= 3'b000; #10
        A <= 3'b001; #10
        A <= 3'b010; #10
        #20;
        $finish;
    end

    initial begin
        $dumpfile("dec_3_to_8.vcd");
        $dumpvars(0, dec_3_to_8_tb);
        $monitor("A=%b Y=%b\n", A, Y);
    end
endmodule