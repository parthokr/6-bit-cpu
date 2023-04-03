`include "ram_1x17.v"
`include "dec_3_to_8.v"
module ram_7x17(
    input wire [2:0] ra1,
    input wire [2:0] ra2,
    input wire [2:0] wr,
    input wire [16:0] wrd,
    input wire we,
    input wire clk,
    output wire [16:0] rd1,
    output wire [16:0] rd2
);
wire [7:0] select_reg_for_write, select_reg1, select_reg2;
dec_3_to_8 select1(ra1, select_reg1);
dec_3_to_8 select2(ra2, select_reg2);
dec_3_to_8 select3(wr, select_reg_for_write);

wire [16:0] rd1_0, rd1_1, rd1_2, rd1_3, rd1_4, rd1_5, rd1_6;
wire [16:0] rd2_0, rd2_1, rd2_2, rd2_3, rd2_4, rd2_5, rd2_6;
ram_1x17 row0(wrd, (we & select_reg_for_write[0]), select_reg1[0], select_reg2[0], clk, rd1_0, rd2_0);
ram_1x17 row1(wrd, (we & select_reg_for_write[1]), select_reg1[1], select_reg2[1], clk, rd1_1, rd2_1);
ram_1x17 row2(wrd, (we & select_reg_for_write[2]), select_reg1[2], select_reg2[2], clk, rd1_2, rd2_2);
ram_1x17 row3(wrd, (we & select_reg_for_write[3]), select_reg1[3], select_reg2[3], clk, rd1_3, rd2_3);
ram_1x17 row4(wrd, (we & select_reg_for_write[4]), select_reg1[4], select_reg2[4], clk, rd1_4, rd2_4);
ram_1x17 row5(wrd, (we & select_reg_for_write[5]), select_reg1[5], select_reg2[5], clk, rd1_5, rd2_5);
ram_1x17 row6(wrd, (we & select_reg_for_write[6]), select_reg1[6], select_reg2[6], clk, rd1_6, rd2_6);

assign rd1 = rd1_0 | rd1_1 | rd1_2 | rd1_3 | rd1_4 | rd1_5 | rd1_6;
assign rd2 = rd2_0 | rd2_1 | rd2_2 | rd2_3 | rd2_4 | rd2_5 | rd2_6;

endmodule