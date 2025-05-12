`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2025 22:36:10
// Design Name: 
// Module Name: MixColumns
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

module mixcolumns(
    input  wire [127:0] state_in,
    output wire [127:0] state_out
);

// 4 sütun için ayrı ayrı çağrılır:
genvar i;
generate
    for(i = 0; i < 4; i = i + 1) begin : MIX_COL
        mix_single_column col_inst(
            .col_in (state_in [127 - i*32 : 96 - i*32]),
            .col_out(state_out[127 - i*32 : 96 - i*32])
        );
    end
endgenerate

endmodule


// Tek sütun MixColumns işlemi
module mix_single_column(
    input  wire [31:0] col_in,
    output wire [31:0] col_out
);

wire [7:0] s0, s1, s2, s3;

assign s0 = col_in[31:24];
assign s1 = col_in[23:16];
assign s2 = col_in[15:8];
assign s3 = col_in[7:0];

// GF(2^8) çarpımları XOR işlemleriyle:
assign col_out[31:24] = gmul2(s0) ^ gmul3(s1) ^ s2 ^ s3;
assign col_out[23:16] = s0 ^ gmul2(s1) ^ gmul3(s2) ^ s3;
assign col_out[15:8]  = s0 ^ s1 ^ gmul2(s2) ^ gmul3(s3);
assign col_out[7:0]   = gmul3(s0) ^ s1 ^ s2 ^ gmul2(s3);

// GF(2^8) çarpımı x2
function [7:0] gmul2;
    input [7:0] b;
    begin
        gmul2 = (b << 1) ^ (8'h1b & {8{b[7]}});
    end
endfunction

// GF(2^8) çarpımı x3 = (x2) XOR orijinal byte
function [7:0] gmul3;
    input [7:0] b;
    begin
        gmul3 = gmul2(b) ^ b;
    end
endfunction

endmodule

