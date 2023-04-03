module full_adder(
    input wire a,
    input wire b,
    input wire c_in,
    output wire s,
    output wire c_out
);
    assign s = a ^ b ^ c_in;
    assign c_out = (a & b) | (b & c_in) | (a & c_in);
endmodule