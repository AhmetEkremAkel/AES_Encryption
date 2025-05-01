`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2025 15:57:53
// Design Name: 
// Module Name: invsubbytes
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

module invsubbytes(
    input  wire [127:0] state_in,
    output wire [127:0] state_out
);

genvar i;
generate
    for (i=0; i<16; i=i+1) begin : INV_SBOX_LOOP
        inv_sbox_module sbox_inst(
            .in_byte(state_in[i*8 +: 8]),
            .out_byte(state_out[i*8 +: 8])
        );
    end
endgenerate

endmodule
