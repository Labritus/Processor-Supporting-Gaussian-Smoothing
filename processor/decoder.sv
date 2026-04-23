// module of decoder

`include "ALUcodes.sv"
`include "opcodes.sv"

module decoder (
    input logic [1:0] opcode,
    output logic write_En, Imm_sel, func, ROM_sel
);
    timeunit 1ns; timeprecision 10ps;
    
    always_comb begin
        unique case (opcode)
                `NOP: begin               // for after reset it should be '0
                    write_En = 1'b0;  // dont allow write reg
                    Imm_sel = 1'b0;
                    func = `funcMUL;         // actually 1'b0
                    ROM_sel = 0;
                end

                `ADD: begin
                    write_En = 1'b1;
                    Imm_sel = 1'b0;
                    func = `funcADD;
                    ROM_sel = 0;
                end

                `MULI: begin
                    write_En = 1'b1;
                    Imm_sel = 1'b1;
                    func = `funcMUL;
                    ROM_sel = 0;
                end

                `LOADI: begin
                    write_En = 1'b1;
                    Imm_sel = 1'b1;
                    func = `funcADD;         // still use RADD function
                    ROM_sel = 1;
                end
        endcase
    end

endmodule