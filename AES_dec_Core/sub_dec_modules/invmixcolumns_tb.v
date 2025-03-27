`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2025 16:08:02
// Design Name: 
// Module Name: invmixcolumns_tb
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

module invmixcolumns_tb();

reg [127:0] imc_in;
wire [127:0] imc_out;

invmixcolumns uut(.imc_in(imc_in), .imc_out(imc_out));

initial begin
    imc_in = 128'h3e313f6d85acf52d61fad88ba4aaac3e; // AES örnek cipher state
    #10;
    $display("InvMixColumns Çıkışı: %h", imc_out);
end

endmodule

