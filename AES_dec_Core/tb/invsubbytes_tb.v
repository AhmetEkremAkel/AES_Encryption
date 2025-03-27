`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2025 16:08:02
// Design Name: 
// Module Name: invsubbytes_tb
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

module invsubbytes_tb();

reg [127:0] isb_in;
wire [127:0] isb_out;

invsubbytes uut(.isb_in(isb_in), .isb_out(isb_out));

initial begin
    isb_in = 128'h73d99473763e2968100c7ffc9b4bd9d2; // Örnek AES cipher durumu
    #10;
    $display("InvSubBytes Çıkışı: %h", isb_out);
end

endmodule
