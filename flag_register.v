module flag_register(
    input wire cf,
    input wire sf,
    input wire zf,
    input wire clk,
    output wire cf_out,
    output wire sf_out,
    output wire zf_out
);

reg _cf = 0, _sf = 0, _zf = 0;
always @(posedge clk) begin
    _cf <= cf;
    _sf <= sf;
    _zf <= zf;
end

assign cf_out = _cf;
assign sf_out = _sf;
assign zf_out = _zf;


endmodule