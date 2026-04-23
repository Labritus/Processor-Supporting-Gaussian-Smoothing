// module of mux_ROM

module ALU #(parameter n = 8)(
    input logic signed [n-1:0] ALU_data, ROM_data, // from result of ALU and ROM
    input logic ROM_sel,
    output logic signed [n-1:0] Wdata // to Wdata of Reg
);

    always_comb begin
        if (ROM_sel == 1'b1) begin
            Wdata = ROM_data;
        end else begin
            Wdata = ALU_data;
        end
    end

endmodule