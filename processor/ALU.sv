// module of ALU

`include "ALUcodes.sv"

module ALU #(parameter n = 8)(
    input logic signed [n-1:0] a, b, // ALU operands
    input logic func, // ALU function code
    output logic signed [n-1:0] result // ALU result
);

    logic signed [n:0] full_ADD;
    logic signed [2*n-1:0] full_MUL;

    always_comb begin
        full_ADD = a + b;
        full_MUL = a * b;
        unique case (func)
            `funcADD: begin
                result = full_ADD[n-1:0];
            end

            `funucMUL: begin
                result = full_MUL[2*n-2:n-1];
            end
        endcase
    end
endmodule