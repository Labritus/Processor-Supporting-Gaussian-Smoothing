// module of prog

module prog #(parameter addr_width = 4, I_size = 12)(
    input logic [addr_width-1:0] addr_prog,
    output logic [I_size-1:0] instruction
);
    timeunit 1ns; timeprecision 10ps;
    
    logic [I_size-1:0] prog_mem [0:(2**addr_width)-1];

    initial begin
        $readmemh("prog.hex", prog_mem);
    end

    assign instruction = prog_mem[addr_prog];

endmodule
