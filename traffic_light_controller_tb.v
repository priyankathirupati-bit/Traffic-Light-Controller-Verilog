`timescale 1ns/1ps

module traffic_light_tb;

reg clk;
reg rst;
wire [2:0] roadA;
wire [2:0] roadB;

// Instantiate the Design Under Test (DUT)
traffic_light uut (
    .clk(clk),
    .rst(rst),
    .roadA(roadA),
    .roadB(roadB)
);

// Clock Generation
initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Apply Reset
initial
begin
    rst = 1;      // Apply reset
    #10;
    rst = 0;      // Release reset

    #80;          // Run simulation

    $finish;
end

endmodule
