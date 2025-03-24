`timescale 1ns / 1ps

module AES_Core (
    input  wire         clk,
    input  wire         reset,

    input  wire         start,        // encrypt etmeye basla
    input  wire [127:0] data_in,      // 128-bit plaintext

    input  wire         key_expansion_done,  // key expansion bitti sinyali
    output reg  [3:0]   desired_round, // istenilen round anahtarÄ± numarasÄ±
    input  wire [127:0] key_in,        // 128-bit AES anahtarÄ±

    output wire  [127:0] data_out,      // 128-bit ciphertext
    output reg          done           // encryption bitti
);

// ------------------------------------------
// Parametreler
// ------------------------------------------

localparam IDLE                = 3'd0;
localparam WAIT_KEY_EXPANSION  = 3'd1;
localparam INIT_ADDKEY         = 3'd2;
localparam ROUND               = 3'd3;
localparam DONE_STATE          = 3'd4;

reg [2:0]   state;         
reg [3:0]   round_cnt;     
reg [127:0] state_reg;     
reg [127:0] last_state_reg; // Final tur verisini tutmak iÃ§in register
reg [127:0] data_out_reg;

// ------------------------------------------
// Alt ModÃ¼l Sinyalleri
// ------------------------------------------
wire [127:0] sb_out;      // SubBytes
wire [127:0] sr_out;      // ShiftRows
wire [127:0] mc_out;      // MixColumns
wire [127:0] ark_out;     // AddRoundKey
wire [127:0] sb_out_2;    // SubBytes
wire [127:0] sr_out_2;    // ShiftRows
wire [127:0] last_ark_out;

// ------------------------------------------
// Alt ModÃ¼ller (instantiation)
// ------------------------------------------
// Normal tur:
subbytes   u_subbytes   (.state_in(state_reg), .state_out(sb_out));
shiftrows  u_shiftrows  (.state_in(sb_out),    .state_out(sr_out));
mixcolumns u_mixcolumns (.state_in(sr_out),    .state_out(mc_out));
addroundkey u_addroundkey(.state_in(mc_out), .round_key(key_in), .state_out(ark_out));
// Final tur
subbytes   u_subbytes_2  (.state_in(last_state_reg), .state_out(sb_out_2));
shiftrows  u_shiftrows_2 (.state_in(sb_out_2),       .state_out(sr_out_2));
addroundkey u_addroundkey_2(.state_in(sr_out_2), .round_key(key_in), .state_out(last_ark_out));

// ------------------------------------------
// FSM
// ------------------------------------------
assign data_out = data_out_reg;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state          <= IDLE;
        round_cnt      <= 4'd0;
        state_reg      <= 128'd0;
        last_state_reg <= 128'd0;
        done           <= 1'b0;
        desired_round  <= 4'd0;
        data_out_reg   <= 128'd0;
    end else begin
        done <= 1'b0;
        if(round_cnt < 11)begin
            desired_round <= round_cnt;
        end
        
        case (state)
            IDLE: begin
                // start = 1 ise encryptionâ€™a baÅŸla
                if (start) begin
                    state_reg  <= data_in;   // plaintextâ€™i state_regâ€™e al
                    round_cnt  <= 4'd0;
                    state      <= WAIT_KEY_EXPANSION;
                    
                end
            end

            WAIT_KEY_EXPANSION: begin
                if (key_expansion_done) begin
                    round_cnt  <= round_cnt + 1;
                    if(round_cnt == 1)begin
                        state <= INIT_ADDKEY;
                    end
                end
            end

            INIT_ADDKEY: begin
                // round_cnt=0 => ilk turun anahtarÄ± key_in
                state_reg  <= state_reg ^ key_in;  // plaintext XOR anahtar
                round_cnt  <= round_cnt + 1;       
                state      <= ROUND;
            end
            //----------------------------------
            ROUND: begin
                // Normal tur: SubBytes->ShiftRows->MixColumns->AddRoundKey (ark_out)
                state_reg <= ark_out;  
                
                if (round_cnt == 4'd11) begin
                    last_state_reg <= ark_out;
                    state <= DONE_STATE;
                    round_cnt <= 4'd0;
                end else begin
                    state <= ROUND;
                    round_cnt <= round_cnt + 1;
                end
            end

            DONE_STATE: begin
                done     <= 1'b1;
                state    <= IDLE;
                data_out_reg <= last_ark_out;
            end

        endcase
    end
end
endmodule
