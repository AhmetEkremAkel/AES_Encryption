`timescale 1ns / 1ps

module key_expansion(
    input  wire         clk,
    input  wire         reset,
    input  wire         start,          // 1 -> Key Expansion start
    input  wire [0:127] initial_key,    // 128 bit initial key
    
    input  wire [0:3]   desired_round,  // requested keys round
    output reg  [0:127] expanded_key,   // requested key
    output reg          done            // 1 -> key expanding is complete
);

reg [0:7] RCON [1:10];

initial begin
    RCON[1] = 8'h01; RCON[2] = 8'h02; RCON[3] = 8'h04; RCON[4] = 8'h08;
    RCON[5] = 8'h10; RCON[6] = 8'h20; RCON[7] = 8'h40; RCON[8] = 8'h80;
    RCON[9] = 8'h1B; RCON[10] = 8'h36;
end

reg [0:31] w [0:7];
reg [0:127] round_keys [0:10];
reg  [0:7] sbox_in0;
wire [0:7] sbox_out_0;

sbox_module sbox0(.in_byte(sbox_in0), .out_byte(sbox_out_0));

parameter IDLE             = 4'd0;
parameter LOAD             = 4'd1;
parameter WAIT_SBOX        = 4'd2;
parameter CALC             = 4'd3;
parameter CALC_2           = 4'd4;
parameter CALC_3           = 4'd5;
parameter CALC_4           = 4'd6;
parameter CALC_5           = 4'd7;
parameter CALC_6           = 4'd8;
parameter CALC_7           = 4'd9;
parameter DONE_STATE       = 4'd10;

integer index = 0;
integer index_2 = 0;
reg [0:7]sbox_reg[0:3];

reg [0:3] state;
reg [0:3] round;
reg [0:31] temp;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state         <= IDLE;
        round         <= 4'd0;
        done          <= 1'b0;
        expanded_key  <= 128'd0;
    end
    else begin
        case (state)

        IDLE: begin
            done <= 1'b0;
            if (start)
                state <= LOAD;
            else
                state <= IDLE;
        end

        LOAD: begin
            // big-endian: k0 = [127:96], k1 = [95:64]
            w[0] <= initial_key[0:31];
            w[1] <= initial_key[32:63];
            w[2] <= initial_key[64:95];
            w[3] <= initial_key[96:127];
            
            // Round 0 key -> round_keys[0]
            round_keys[0] <= initial_key;
            temp <= initial_key;
            round <= 4'd1; // first round to calculate = 1
            state <= CALC;
            
            index <= 0;
            index_2 <= 0;
        end

        WAIT_SBOX: begin
            if(index == 4)begin
                sbox_reg[index_2] <= sbox_out_0;
                state <= CALC_2;
                index <= 0;
                index_2 <= 0;
            end else begin
                
                sbox_reg[index_2] <= sbox_out_0;
                state <= CALC;
                index_2 <= index_2 + 1;
            end
        end

        CALC: begin
            if(index <= 3) begin
                case(index)
                    0: sbox_in0 <= temp[0:7];
                    1: sbox_in0 <= temp[8:15];
                    2: sbox_in0 <= temp[16:23];
                    3: sbox_in0 <= temp[24:31];
                    default: sbox_in0 <= 8'd0;
                endcase
                state <= WAIT_SBOX;
                index <= index + 1;
            end
        end

        CALC_2 : begin
            temp <= {sbox_reg[1],sbox_reg[2],sbox_reg[3],sbox_reg[0]} ^{RCON[round],24'b0000_0000_0000_0000_0000_0000};
            state <= CALC_3;
        end
        
        CALC_3:begin
            w[4]     <= w[0]     ^ temp;
            state <= CALC_4;
        end
        
        CALC_4:begin
            w[5] <= w[4]         ^ w[1];
            state <= CALC_5;
        end

        CALC_5:begin
            w[6] <= w[5]     ^ w[2];
            state <= CALC_6;
        end

        CALC_6:begin
            w[7] <= w[6]         ^ w[3];
            state <= CALC_7;
        end

        CALC_7:begin
            round_keys[round] = {w[4],w[5],w[6],w[7]};

            if (round == 10)
                state <= DONE_STATE;
            else begin
                temp <= round_keys[round];
                w[0] <= w[4];
                w[1] <= w[5];
                w[2] <= w[6];
                w[3] <= w[7];
                round <= round + 1;
                state <= CALC;
            end
        end
        DONE_STATE: begin
            done <= 1'b1;
            expanded_key <= round_keys[desired_round];

        end
        endcase
    end
end

endmodule
