module mux_8_to_1_6_bit(
    input wire [5:0] i0,
    input wire [5:0] i1,
    input wire [5:0] i2,
    input wire [5:0] i3,
    input wire [5:0] i4,
    input wire [5:0] i5,
    input wire [5:0] i6,
    input wire [5:0] i7,
    input wire [2:0] sel,
    output [5:0] out
);

reg [5:0] ans;
always @(*) begin
    if (sel == 3'b000)
        ans = i0;
    else if (sel == 3'b001)
        ans = i1;
    else if (sel == 3'b010)
        ans = i2;
    else if (sel == 3'b011)
        ans = i3;
    else if (sel == 3'b100)
        ans = i4;
    else if (sel == 3'b101)
        ans = i5;
    else if (sel == 3'b110)
        ans = i6;
    else if (sel == 3'b111)
        ans = i7;
    else
        ans = 6'b000000;
end

assign out = ans;

endmodule