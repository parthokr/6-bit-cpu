`timescale 1ns/1ps
`include "full_adder.v"

module full_adder_tb;
    reg a, b, c_in;
    wire s, c_out;
    full_adder fa(a, b, c_in, s, c_out);
    initial
    begin
        a <= 0;
        b <= 0;
        c_in <= 0;
        #20;
        a <= 1;
        b <= 0;
        c_in <= 0;
        #20;
        a <= 0;
        b <= 1;
        c_in <= 0;
        #20;
        a <= 0;
        b <= 0;
        c_in <= 1;
        #20;
        a <= 1;
        b <= 1;
        c_in <= 0;
        #20;
        $finish;
    end
    initial begin
        $dumpfile("full_adder.vcd");
        $dumpvars(0, full_adder_tb);
        $monitor("a=%b b=%b c_in=%b s=%b", a, b, c_in, s);
    end
endmodule