`timescale 1ns/1ps
`include "ram_7x17.v"

module ram_7x17_tb; 
    reg [2:0] ra1, ra2, wr;
    reg [16:0] wrd;
    reg we, clk;
    wire [16:0] rd1, rd2;

    ram_7x17 uut(ra1, ra2, wr, wrd, we, clk, rd1, rd2);
    always #5 clk = ~clk;
    initial begin
        clk <= 0;
        we <= 0;
        wr <= 0;
        wrd <= 25;
        #20;
        we <= 1;
        #20;
        ra1 <= 0;
        #20;
        we <= 0;
        #20;
        we <= 0;
        wr <= 1;
        wrd <= 78;
        we <= 1;
        #20;
        ra2 <= 1;
        #20;
        $finish;
    end
    initial begin
        $dumpfile("ram_7x17.vcd");
        $dumpvars(0, ram_7x17_tb);
        $monitor("clk=%b wr=%b wrd=%b we=%b ra1=%b ra2=%b | rd1=%b rd2=%b", clk, wr, wrd, we, ra1, ra2, rd1, rd2);
    end
endmodule