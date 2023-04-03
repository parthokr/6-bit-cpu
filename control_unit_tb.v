`timescale 1ns/1ps
`include "control_unit.v"

module control_uni_tb;
    reg [3:0] opcode;
    reg cf;
    reg sf;
    reg zf;
    wire [1:0] op;
    wire jmp_sel;
    wire imm_sel;
    wire reg_en;

    control_unit uut(opcode, cf, sf, zf, op, jmp_sel, imm_sel, reg_en);
    initial begin
        opcode <= 4'b0000;
        cf <= 0;
        sf <= 1;
        zf <= 0;
        #20;
        opcode <= 4'b0100;
        #20;
        opcode <= 4'b1000;
        #20;
        opcode <= 4'b1001;
        #20;
        sf <= 0;
        #20;
        sf <= 1;
        zf <= 1;
        #20;
        $finish;
    end
    initial begin
        $dumpfile("control_unit.vcd");
        $dumpvars(0, control_uni_tb);
        $monitor("opcode=%b cf=%b sf=%b zf=%b | op=%b jmp_sel=%b imm_sel=%b reg_en=%b", opcode, cf, sf, zf, op, jmp_sel, imm_sel, reg_en);
    end
endmodule