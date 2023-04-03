module control_unit(
    input wire [3:0] opcode,
    input wire cf,
    input wire sf,
    input wire zf,
    output wire [1:0] op,
    output wire jmp_sel,
    output wire imm_sel,
    output wire reg_en
);
    assign op = opcode[1:0];
    assign imm_sel = ~opcode[3] & opcode[2];

    wire branching, jmp, zf_or_not_sf, jge;
    assign branching = opcode[3] & ~opcode[2];
    assign jmp = ~opcode[1] & ~opcode[0];
    assign zf_or_not_sf = zf | ~sf;
    assign jge = ~opcode[1] & opcode[0] & zf_or_not_sf;

    assign jmp_sel = (jmp | jge) & branching;
    
    assign reg_en = (~opcode[3] & ~opcode[2]) | imm_sel;

endmodule