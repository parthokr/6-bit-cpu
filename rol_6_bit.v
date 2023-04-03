module rol_6_bit(
    input wire [5:0] a,
    input wire [5:0] b,
    input wire cf_prev,
    output wire [5:0] r,
    output wire cf,
    output wire sf,
    output wire zf
);
reg [5:0] _r;
reg _cf;
always @(*)
begin  
    if (b%6 == 0)
    begin
        _r = a;
        _cf = cf_prev;
    end
    else if (b%6 == 1)
    begin
        _r = {a[4:0], a[5]};
        _cf = a[5];
    end
    else if (b%6 == 2)
    begin
        _r = {a[3:0], a[5:4]};
        _cf = a[5:4];
    end
    else if (b%6 == 3)
    begin
        _r = {a[2:0], a[5:3]};
        _cf = a[5:3];
    end
    else if (b%6 == 4)
    begin
        _r = {a[1:0], a[5:2]};
        _cf = a[5:2];
    end
    else if (b%6 == 5)
    begin
        _r = {a[0], a[5:1]};
        _cf = a[5:1];
    end
end

assign r = _r;
assign cf = _cf;
assign sf = _r[5];
assign zf = ~_r[0] & ~_r[1] & ~_r[2] & ~_r[3] & ~_r[4] & ~_r[5];

endmodule