// module of picoMIPS

module picoMIPS #(parameter n = 8)(
    input logic clk,
    input logic [9:0] SW,
    output logic signed [7:0] LED
);
    timeunit 1ns; timeprecision 10ps;

    wire [n-1:0] Rd_data, a, b, result, Wdata,ROM_data;
    wire [1:0] opcode, Rd, Rs;
    wire [5:0] Imm_data;
    wire write_En, Imm_sel, func, ROM_sel;
    wire [3:0] addr_prog;



    ALU ALU1(
        .a(a),
        .b(b),
        .func(func),
        .result(result)
    );

    decoder decoder1(
        .opcode(opcode),
        .write_En(write_En),
        .Imm_sel(Imm_sel),
        .func(func),
        .ROM_sel(ROM_sel)
    );

    mux_Imm mux_Imm1(
        .Rd_data(Rd_data),
        .Imm_data(Imm_data),
        .Imm_sel(Imm_sel),
        .a(a)
    );

    mux_ROM mux_ROM1(
        .ALU_data(result),
        .ROM_data(ROM_data),
        .ROM_sel(ROM_sel),
        .Wdata(Wdata)
    );

    pc pc1(
        .clk(clk),
        .nReset(SW[9]),
        .SW8(SW[8]),
        .pc_out(addr_prog)
    );

    prog prog1(
        .addr_prog(addr_prog),
        .instruction({opcode, Rd, Rs, Imm_data})
    );

    Reg Reg1(
        .clk(clk),
        .nReset(SW[9]),
        .write_En(write_En),
        .SW7_0(SW[7:0]),
        .Rd(Rd),
        .Rs(Rs),
        .Wdata(Wdata),
        .Rd_data(Rd_data),
        .Rs_data(b),
        .LED(LED)
    );

    ROM_wave ROM_wave1(
        .ROM_addr(result),
        .ROM_data(ROM_data)
    );

endmodule
