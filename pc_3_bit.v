module pc_3_bit(
    input wire [2:0] in,
    input wire clk,
    output [2:0] out
);
    reg [2:0] d = 3'b000;
    always @(posedge clk) begin
        d <= in;
    end
    assign out = d;
endmodule