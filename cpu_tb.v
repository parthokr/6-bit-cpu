`include "cpu.v"
`timescale 1ns/1ps
module cpu_tb;
    reg [2:0] ra2, wr;
    reg [16:0] wrd;
    reg we, clk, pc_en;

    wire [5:0] result_from_alu;
    wire [1:0] op;
    wire [16:0] rd2;
    wire [2:0] ins_num; // instruction number
    wire [2:0] ra;
    wire [2:0] rb;
    wire [5:0] a;
    wire [5:0] b;
    wire cpu_clk;
    wire imm_sel;
    wire jmp_sel;
    wire [5:0] imm_data;
    cpu uut(
        // inputs
        .ra2(ra2),
        .wr(wr),
        .wrd(wrd),
        .we(we),
        .clk(clk),
        .pc_en(pc_en),
        // outputs
        .debug_op(op),
        .debug_rd2(rd2),
        .debug_ins_num(ins_num),
        .debug_ra(ra),
        .debug_rb(rb),
        .debug_a(a),
        .debug_b(b),
        .debug_cpu_clk(cpu_clk),
        .debug_imm_sel(imm_sel),
        .debug_jmp_sel(jmp_sel),
        .debug_imm_data(imm_data),
        .debug_result_from_alu(result_from_alu)
    );
    always #10 clk = ~clk;
    initial
    begin
        clk <= 0;
        pc_en <= 0;
        we <= 1;

        wr <= 0; // WRITE TO RAN 0 (R0)
        wrd <= 17'b01010000001010000; // ADD R0, 5
        #20;
        wr <= 1; // WRITE TO RAM 1 (R1)
        wrd <= 17'b01010010001000000; // ADD R1, 4
        #20;
        wr <= 2; // WRITE TO RAM 2 (R2)
        wrd <= 17'b00010000010000000; // ADD R0, R1
        #20
        wr <= 3; // WRITE TO RAM 3 (R3)
        wrd <= 17'b10000000000000000; // JMP 0
        #20
        we <= 0;
        pc_en <= 1;
        #20;
        #20;
        #20;
        #20;
        #20;
        $finish;
    end
    initial begin
        $dumpfile("cpu.vcd");
        $dumpvars(0, cpu_tb);
        $monitor("clk: %b, pc_en: %b, we: %b, wr: %b, wrd: %b, op: %b, ins_num: %b, ra: %b, rb: %b, a: %b, b: %b, cpu_clk: %b, imm_sel: %b, jmp_sel: %b, imm_data: %b, result_from_alu: %b", clk, pc_en, we, wr, wrd, op, ins_num, ra, rb, a, b, cpu_clk, imm_sel, jmp_sel, imm_data, result_from_alu);
    end
endmodule