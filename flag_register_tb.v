`timescale 1ns/1ps
`include "flag_register.v"

module flag_register_tb; 
    reg cf, sf, zf, clk;
    wire cf_out, sf_out, zf_out;

    flag_register uut(cf, sf, zf, clk, cf_out, sf_out, zf_out);
    always #10 clk = ~clk;
    initial begin
        clk <= 0;
        cf <= 1;
        sf <= 1;
        zf <= 1;
        #20
        cf <= 0;
        sf <= 0;
        #20
        $finish;
    end
    initial begin
        $dumpfile("flag_register.vcd");
        $dumpvars(0, flag_register_tb);
        $monitor("cf=%b sf=%b zf=%b clk=%b cf_out=%b sf_out=%b zf_out=%b", cf, sf, zf, clk, cf_out, sf_out, zf_out);
    end
endmodule