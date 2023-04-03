module or_6_bit(
    input wire [5:0] a,
    input wire [5:0] b,
    output [5:0] r,
    output wire cf,
    output wire sf,
    output wire zf
);

    assign r[0] = a[0] | b[0];
    assign r[1] = a[1] | b[1];
    assign r[2] = a[2] | b[2];
    assign r[3] = a[3] | b[3];
    assign r[4] = a[4] | b[4];
    assign r[5] = a[5] | b[5];
    // could have just done this -> assign c = a | b;
    // but this is just to show how it works

    assign cf = 1'b0;
    assign sf = r[5];
    assign zf = ~r[0] & ~r[1] & ~r[2] & ~r[3] & ~r[4] & ~r[5];

endmodule