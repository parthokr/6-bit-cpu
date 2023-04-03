module reg_1_bit(
    input wire d_in,
    output wire d_out,
    input wire sel,
    input wire clk
);
reg _d_out = 1'b0;
always @(posedge clk) begin
    if (sel && clk) 
        _d_out <= d_in;
end
assign d_out = _d_out;
endmodule