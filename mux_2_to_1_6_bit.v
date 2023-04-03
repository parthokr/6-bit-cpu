module mux_2_to_1_6_bit(
    input wire [5:0] i0,
    input wire [5:0] i1,
    input wire sel,
    output [5:0] out
);

reg [5:0] ans;
always @(*) begin
    if (sel == 0)
        ans = i0;
    else if (sel == 1)
        ans = i1;
end

assign out = ans;

endmodule