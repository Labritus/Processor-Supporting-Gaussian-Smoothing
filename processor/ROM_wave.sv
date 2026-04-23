// module of ROM_wave.sv

module ROM_wave (
    input logic [7:0] ROM_addr,         // address from 0 to 255
    output logic signed [7:0] ROM_data
);
    timeunit 1ns; timeprecision 10ps;
    
    logic signed [7:0] mem_wave [0:255];

    initial begin
        $readmemh("wave.hex", mem_wave); // readmemh for hex
    end

    assign ROM_data = mem_wave[ROM_addr];

endmodule