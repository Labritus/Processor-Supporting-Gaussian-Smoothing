timeunit 1ns; timeprecision 10ps;

module picoMIPS_stim();

    logic clk;
    logic [9:0] SW;
    logic signed [7:0] LED;

    picoMIPS dut (
        .clk(clk),
        .SW(SW),
        .LED(LED)
    );

    initial begin
        clk = 0;
        forever #200 clk = ~clk;
    end

    initial begin
        SW = '0;
        #200;
        SW[9] = 1'b1;
        #100;
        SW[7:0] = 8'd253;
        #500;
        SW[8] = 1'b1;
        #10000;
        SW[7:0] = 8'd10;
        #500;
        SW[8] = 1'b0;
        #500;
        SW[8] = 1'b1;
        #10000;
        $stop;
    end

endmodule