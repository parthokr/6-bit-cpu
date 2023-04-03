module ram_1x1(
    input wire wd,
    input wire ws,
    input wire rs1,
    input wire rs2,
    input wire clk,
    output wire rd1,
    output wire rd2
);
reg d = 1'b0;
always @(posedge clk) begin
    if (ws) begin
        d <= wd;
    end
end
assign rd1 = rs1 ? d : 1'b0;
assign rd2 = rs2 ? d : 1'b0;
endmodule