`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2025 22:36:10
// Design Name: 
// Module Name: ShiftRows
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
//4x4 her blok 1 byte matriste kaydırmalar şu şekildedir:
//Satır 0: Kaydırılmaz
//Satır 1: 1 byte sola kaydırılır.
//Satır 2: 2 byte sola kaydırılır.
//Satır 3: 3 byte sola kaydırılır.

module shiftrows(
    input  wire [127:0] state_in,
    output wire [127:0] state_out
);

// ShiftRows işlemini doğrudan kombinasyonel atama ile yap
assign state_out[127:120] = state_in[127:120]; // Satır 0, 0 byte shift
assign state_out[119:112] = state_in[87:80];   // Satır 1, 1 byte shift
assign state_out[111:104] = state_in[47:40];   // Satır 2, 2 byte shift
assign state_out[103:96]  = state_in[7:0];     // Satır 3, 3 byte shift

assign state_out[95:88]   = state_in[95:88];   // Satır 0, 0 byte shift
assign state_out[87:80]   = state_in[55:48];   // Satır 1, 1 byte shift
assign state_out[79:72]   = state_in[15:8];    // Satır 2, 2 byte shift
assign state_out[71:64]   = state_in[103:96];  // Satır 3, 3 byte shift

assign state_out[63:56]   = state_in[63:56];   // Satır 0, 0 byte shift
assign state_out[55:48]   = state_in[23:16];   // Satır 1, 1 byte shift
assign state_out[47:40]   = state_in[111:104]; // Satır 2, 2 byte shift
assign state_out[39:32]   = state_in[71:64];   // Satır 3, 3 byte shift

assign state_out[31:24]   = state_in[31:24];   // Satır 0, 0 byte shift
assign state_out[23:16]   = state_in[119:112]; // Satır 1, 1 byte shift
assign state_out[15:8]    = state_in[79:72];   // Satır 2, 2 byte shift
assign state_out[7:0]     = state_in[39:32];   // Satır 3, 3 byte shift

endmodule

