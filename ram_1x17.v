`include "ram_1x1.v"
module ram_1x17(
    input wire [16:0] wd,
    input wire ws,
    input wire rs1,
    input wire rs2,
    input wire clk,
    output wire [16:0] rd1,
    output wire [16:0] rd2
);
ram_1x1 r0(wd[0], ws, rs1, rs2, clk, rd1[0], rd2[0]);
ram_1x1 r1(wd[1], ws, rs1, rs2, clk, rd1[1], rd2[1]);
ram_1x1 r2(wd[2], ws, rs1, rs2, clk, rd1[2], rd2[2]);
ram_1x1 r3(wd[3], ws, rs1, rs2, clk, rd1[3], rd2[3]);
ram_1x1 r4(wd[4], ws, rs1, rs2, clk, rd1[4], rd2[4]);
ram_1x1 r5(wd[5], ws, rs1, rs2, clk, rd1[5], rd2[5]);
ram_1x1 r6(wd[6], ws, rs1, rs2, clk, rd1[6], rd2[6]);
ram_1x1 r7(wd[7], ws, rs1, rs2, clk, rd1[7], rd2[7]);
ram_1x1 r8(wd[8], ws, rs1, rs2, clk, rd1[8], rd2[8]);
ram_1x1 r9(wd[9], ws, rs1, rs2, clk, rd1[9], rd2[9]);
ram_1x1 r10(wd[10], ws, rs1, rs2, clk, rd1[10], rd2[10]);
ram_1x1 r11(wd[11], ws, rs1, rs2, clk, rd1[11], rd2[11]);
ram_1x1 r12(wd[12], ws, rs1, rs2, clk, rd1[12], rd2[12]);
ram_1x1 r13(wd[13], ws, rs1, rs2, clk, rd1[13], rd2[13]);
ram_1x1 r14(wd[14], ws, rs1, rs2, clk, rd1[14], rd2[14]);
ram_1x1 r15(wd[15], ws, rs1, rs2, clk, rd1[15], rd2[15]);
ram_1x1 r16(wd[16], ws, rs1, rs2, clk, rd1[16], rd2[16]);

endmodule