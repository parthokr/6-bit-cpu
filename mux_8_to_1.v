module mux_8_to_1(
    input wire i0,
    input wire i1,
    input wire i2,
    input wire i3,
    input wire i4,
    input wire i5,
    input wire i6,
    input wire i7,
    input wire [2:0] sel,
    output out
);

reg ans;
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
end

assign out = ans;

endmodule