module pca_3_bit(
    input wire [2:0] in,
    output wire [2:0] out
);
    assign out = in + 1;
endmodule