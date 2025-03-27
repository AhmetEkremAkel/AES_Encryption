`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2025 16:08:02
// Design Name: 
// Module Name: invshiftrows_tb
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

module invshiftrows_tb();

reg [127:0] isr_in;
wire [127:0] isr_out;

invshiftrows uut(.isr_in(isr_in), .isr_out(isr_out));

initial begin
    isr_in = 128'h733e7fd2760cd973104b94689bd929fc;
    #10;
    $display("InvShiftRows Çıkışı: %h", isr_out);
end

endmodule
