`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2025 00:53:41
// Design Name: 
// Module Name: subbytes_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module subbytes_tb();

reg [127:0] state_in;
wire [127:0] state_out;

subbytes uut(.state_in(state_in), .state_out(state_out));

initial begin
    state_in = 128'h00000101030307070f0f1f1f3f3f7f7f;
    #10;
    $display("SubBytes Out: %h", state_out);
end

endmodule
