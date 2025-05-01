`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2025 22:34:40
// Design Name: 
// Module Name: subbytes
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

module subbytes(
    input  wire [127:0] state_in,
    output wire [127:0] state_out
);

// Paralel çalışan 16 adet S-Box modülü
genvar i; // generate variable
generate // modul oluşturmaya yarıyor. For dönügsü ile aynı modulden 16x oluşturduk
    for (i = 0; i < 16; i = i + 1) begin : subbytes_loop
        sbox_module sbox_inst(
            .in_byte (state_in [i*8 +: 8]),
            .out_byte(state_out[i*8 +: 8])
        );
    end
endgenerate

endmodule













