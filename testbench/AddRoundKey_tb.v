`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2025 00:53:41
// Design Name: 
// Module Name: AddRoundKey_tb
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

module addroundkey_tb();

reg [127:0] state_in, round_key;
wire [127:0] state_out;

addroundkey uut(.state_in(state_in), .round_key(round_key), .state_out(state_out));

initial begin
    state_in = 128'h591ceea1c28636d1caddaf024a27dca2;
    round_key = 128'h62636363626363636263636362636363;
    #10;
    $display("AddRoundKey Out: %h", state_out);
end

endmodule
