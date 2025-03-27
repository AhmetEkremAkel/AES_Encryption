`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2025 15:57:53
// Design Name: 
// Module Name: invmixcolumns
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

module invmixcolumns(
    input wire [127:0] state_in,
    output wire [127:0] state_out
);

genvar i;
generate
    for(i=0; i<4; i=i+1) begin : INV_MIX
        inv_mix_single_column col_inst(
            .col_in(state_in[127 - i*32 : 96 - i*32]),
            .col_out(state_out[127 - i*32 : 96 - i*32])
        );
    end
endgenerate

endmodule

module inv_mix_single_column(
    input wire [31:0] col_in,
    output wire [31:0] col_out
);

wire [7:0] s0,s1,s2,s3;

assign s0 = col_in[31:24];
assign s1 = col_in[23:16];
assign s2 = col_in[15:8];
assign s3 = col_in[7:0];

assign col_out[31:24] = gmulE(s0)^gmulB(s1)^gmulD(s2)^gmul9(s3);
assign col_out[23:16] = gmul9(s0)^gmulE(s1)^gmulB(s2)^gmulD(s3);
assign col_out[15:8]  = gmulD(s0)^gmul9(s1)^gmulE(s2)^gmulB(s3);
assign col_out[7:0]   = gmulB(s0)^gmulD(s1)^gmul9(s2)^gmulE(s3);

// GF(2^8) AES standard multiplication functions
function [7:0] gmul9;
input [7:0] b; begin gmul9 = gmul2(gmul2(gmul2(b))) ^ b; end endfunction

function [7:0] gmulB;
input [7:0] b; begin gmulB = gmul2(gmul2(gmul2(b))) ^ gmul2(b) ^ b; end endfunction

function [7:0] gmulD;
input [7:0] b; begin gmulD = gmul2(gmul2(gmul2(b))) ^ gmul2(gmul2(b)) ^ b; end endfunction

function [7:0] gmulE;
input [7:0] b; begin gmulE = gmul2(gmul2(gmul2(b))) ^ gmul2(gmul2(b)) ^ gmul2(b); end endfunction

function [7:0] gmul2;
input [7:0] b; begin gmul2 = (b << 1) ^ (8'h1b & {8{b[7]}}); end endfunction

endmodule
