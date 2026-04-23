// module of pc
    
module pc #(parameter addr_width = 4)(
    input logic clk, nReset, SW8,
    output logic [addr_width-1:0] pc_out
);
    timeunit 1ns; timeprecision 10ps;
    
    typedef enum logic [1:0] {
        WAIT_0, // wait for SW8 = 0
        WAIT_1, // wait for SW8 = 1
        RUN     // begin pc
    } state_t;
    state_t state;

    always_ff @(posedge clk or negedge nReset) begin
        if (!nReset) begin
            state <= WAIT_0;
            pc_out <= '0;
        end else begin
            case (state)
                WAIT_0: begin
                    pc_out <= '0;
                    if (SW8 == 1'b0) begin
                        state <= WAIT_1;
                    end
                end

                WAIT_1: begin
                    pc_out <= '0;
                    if (SW8 == 1'b1) begin
                        state <= RUN;
                        pc_out <= pc_out + 1'b1;
                    end
                end

                RUN: begin
                    if (pc_out == '0) begin
                        state <= WAIT_0;
                        pc_out <= '0;
                    end else begin
                        pc_out <= pc_out + 1'b1;
                    end
                end

                default: begin
                    state <= WAIT_0;
                    pc_out <= '0;
                end
            endcase
        end
    end

endmodule