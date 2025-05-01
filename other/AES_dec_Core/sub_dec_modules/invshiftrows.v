`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2025 15:57:53
// Design Name: 
// Module Name: invshiftrows
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

module invshiftrows(
    input wire [127:0] state_in,
    output wire [127:0] state_out
);

assign state_out = {
    state_in[127:120], state_in[23:16], state_in[47:40], state_in[71:64],
    state_in[95:88],   state_in[119:112], state_in[15:8],  state_in[39:32],
    state_in[63:56],   state_in[87:80],   state_in[111:104], state_in[7:0],
    state_in[31:24],   state_in[55:48],   state_in[79:72], state_in[103:96]
};

endmodule

