`timescale 1ns/1ps
`include "ram_1x17.v"

module ram_1x17_tb; 
    reg [16:0] wd;
    reg ws, rs1, rs2, clk;
    wire [16:0] rd1, rd2;

    ram_1x17 uut(wd, ws, rs1, rs2, clk, rd1, rd2);
    always #10 clk = ~clk;
    initial begin
        clk <= 1;
        wd <= 20;
        ws <= 0;
        rs1 <= 0;
        #20;
        ws <= 1;
        #20;
        rs1 <= 1;
        #20;
        rs2 <= 1;
        #20;
        ws <= 0;
        wd <= 35;
        #20;
        ws <= 1;
        #20;
        rs2 <= 0;
        $finish;
    end
    initial begin
        $dumpfile("ram_1x17.vcd");
        $dumpvars(0, ram_1x17_tb);
        $monitor("clk=%b wd=%b ws=%b rs1=%b rs2=%b rd1=%b rd2=%b", clk, wd, ws, rs1, rs2, rd1, rd2);
    end
endmodule