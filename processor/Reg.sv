// module of Reg

module Reg #(parameter n = 8)(
    input logic clk, nReset, write_En,
    input logic [n-1:0] SW7_0,
    input logic [1:0] Rd, Rs,
    input logic signed [n-1:0] Wdata,
    output logic signed [n-1:0] Rd_data, Rs_data,
    output logic signed [n-1:0] LED    
)

    logic signed [n-1:0] R [3:0];
    // 00: R0 = '0
    // 01: R1 = SW7_0
    // 10: R2
    // 11: R3 (LED = R3)

    // write logic
    always_ff @(posedge clk or negedge nReset) begin
        if (!nReset) begin
                R[2] <= '0;
                R[3] <= '0;
        end else if (write_En) begin
            if (Rd[1] == 1'b1) begin
                R[Rd] <= Wdata;
            end
        end
    end

    // read logic
    always_comb begin
        case (Rd)
            2'b00:   Rd_data = '0;
            2'b01:   Rd_data = SW7_0;
            default: Rd_data = R[Rd];
        endcase
    end
    always_comb begin
        case (Rs)
            2'b00:   Rs_data = '0;
            2'b01:   Rs_data = SW7_0;
            default: Rs_data = R[Rs];
        endcase
    end
    assign LED = R[3];

endmodule