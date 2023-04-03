module mux_4_to_1_3_bit(
    input wire [2:0] i0,
    input wire [2:0] i1,
    input wire [2:0] i2,
    input wire [2:0] i3,
    input wire [1:0] sel,
    output [2:0] out
);

reg [2:0] ans;
always @(*) begin
    if (sel == 2'b00)
        ans = i0;
    else if (sel == 2'b01)
        ans = i1;
    else if (sel == 2'b10)
        ans = i2;
    else if (sel == 2'b11)
        ans = i3;
end

assign out = ans;

endmodule