`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2025 00:53:41
// Design Name: 
// Module Name: MixColumns_tb
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

module mixcolumns_tb();

reg [127:0] state_in;
wire [127:0] state_out;

mixcolumns uut(.state_in(state_in), .state_out(state_out));

initial begin
    state_in = 128'h637bc0d27b76d27c76757cc57563c5c0; // AES örnek giriş
    #10;
    $display("MixColumns Out: %h", state_out);
end

endmodule
