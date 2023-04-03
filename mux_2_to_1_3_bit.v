module mux_2_to_1_3_bit(
    input wire [2:0] i0,
    input wire [2:0] i1,
    input wire sel,
    output [2:0] out
);

reg [2:0] ans;
always @(*) begin
    if (sel == 0)
        ans = i0;
    else if (sel == 1)
        ans = i1;
    else 
        ans = i0;
end

assign out = ans;

endmodule