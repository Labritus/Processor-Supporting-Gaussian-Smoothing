// module of ROM_wave.sv

module ROM_wave (
    input logic [7:0] ROM_addr,         // address from 0 to 255
    output logic signed [7:0] ROM_data
);

    logic signed [7:0] Mem_wave [0:255];

    initial begin
        $readmemh("wave.hex.txt", Mem_wave); // readmemh for hex
    end

    assign ROM_data = Mem_wave[ROM_addr];

endmodule