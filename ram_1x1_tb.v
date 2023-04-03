`timescale 1ns/1ps
`include "ram_1x1.v"

module ram_1x1_tb; 
    reg wd, ws, rs1, rs2, clk;
    wire rd1, rd2;

    ram_1x1 uut(wd, ws, rs1, rs2, clk, rd1, rd2);
    always #10 clk = ~clk;
    initial begin
        clk <= 1;
        wd <= 1;
        ws <= 0;
        rs1 <= 0;
        #20;
        ws <= 1;
        #20;
        rs1 <= 1;
        #20;
        rs2 <= 1;
        #20;
        $finish;
    end
    initial begin
        $dumpfile("ram_1x1.vcd");
        $dumpvars(0, ram_1x1_tb);
        $monitor("clk=%b wd=%b ws=%b rs1=%b rs2=%b rd1=%b rd2=%b", clk, wd, ws, rs1, rs2, rd1, rd2);
    end
endmodule