`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2025 00:53:41
// Design Name: 
// Module Name: ShiftRows_tb
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

module shiftrows_tb();

reg [127:0] state_in;
wire [127:0] state_out;

shiftrows uut(.state_in(state_in), .state_out(state_out));

initial begin
    state_in = 128'h63637c7c7b7bc5c57676c0c07575d2d2;
    #10;
    $display("ShiftRows Out: %h", state_out);
end

endmodule
