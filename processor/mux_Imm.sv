// module of mux_Imm

module mux_Imm #(parameter n = 8)(
    input logic signed [n-1:0] Rd_data, // from Rd
    input logic signed [5:0] Imm_data,  // from instruction[4:0]
    input logic Imm_sel,
    output logic signed [n-1:0] a // to b of ALU
);
    timeunit 1ns; timeprecision 10ps;
    
    logic signed [n-1:0] extended_Imm_data; // exntend Imm_data to n bit
    
    assign extended_Imm_data = { {(n-6){Imm_data[5]}}, Imm_data }; // extend MSB (sign bit)

    always_comb begin
        if (Imm_sel == 1'b1) begin
            a = extended_Imm_data;
        end else begin
            a = Rd_data;
        end
    end

endmodule