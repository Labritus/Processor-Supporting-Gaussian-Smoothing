// module of mux_Imm

module ALU #(parameter n = 8)(
    input logic signed [n-1:0] Rs_data, // from Rs
    input logic signed [5:0] Imm_data,  // from instruction[4:0]
    input logic Imm_sel,
    output logic signed [n-1:0] b // to b of ALU
);

    logic signed [n-1:0] extended_Imm_data; // exntend Imm_data to n bit
    
    assign extended_Imm_data = { {(n-6){Imm_data[5]}}, Imm_data }; // extend MSB (sign bit)

    always_comb begin
        if (Imm_sel == 1'b1) begin
            b = extended_imm_data;
        end else begin
            b = Rs_data;
        end
    end

endmodule