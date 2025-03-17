`timescale 1ns / 1ps

module key_expansion(
    input  wire         clk,
    input  wire         reset,
    input  wire         start,          // 1 -> Key Expansion start
    input  wire [127:0] initial_key,    // 128 bit initial key
    input  wire [3:0]   desired_round,  // requested keys round
    output reg  [127:0] expanded_key,   // requested key
    output reg          done            // 1 -> key expanding is complete
);

    // -------------------------------------------------------
    //  AES-128 RCON TABLE
    // -------------------------------------------------------
    reg [7:0] RCON [1:10];
    initial begin
        RCON[1] = 8'h01; RCON[2] = 8'h02; RCON[3] = 8'h04; RCON[4] = 8'h08;
        RCON[5] = 8'h10; RCON[6] = 8'h20; RCON[7] = 8'h40; RCON[8] = 8'h80;
        RCON[9] = 8'h1B; RCON[10] = 8'h36;
    end

    // -------------------------------------------------------
    //  w[0..43] 44 Words (AES-128)
    //  round_keys[i] matrix of rounded keys
    // -------------------------------------------------------
    reg [31:0] w [0:43];
    reg [127:0] round_keys [0:10];

    integer i;

    // -------------------------------------------------------
    //  S-Box (4) -> for SubWord
    // -------------------------------------------------------
    reg  [7:0] sbox_in0, sbox_in1, sbox_in2, sbox_in3;
    wire [7:0] sbox_out0, sbox_out1, sbox_out2, sbox_out3;

    sbox_module sbox0(.in_byte(sbox_in0), .out_byte(sbox_out0));
    sbox_module sbox1(.in_byte(sbox_in1), .out_byte(sbox_out1));
    sbox_module sbox2(.in_byte(sbox_in2), .out_byte(sbox_out2));
    sbox_module sbox3(.in_byte(sbox_in3), .out_byte(sbox_out3));

// -------------------------------------------------------
//  FSM States
// -------------------------------------------------------
// State Parameters
parameter IDLE       = 2'd0;
parameter LOAD       = 2'd1;
parameter CALC       = 2'd2;
parameter WAIT_SBOX  = 2'd3;
parameter DONE_STATE = 3'd4;
reg [2:0] state, next_state;

reg [3:0] round; // 1..10

// -------------------------------------------------------
//  FSM
// -------------------------------------------------------
reg [31:0] temp;
reg [31:0] subword;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state         <= IDLE;
        round         <= 4'd0;
        done          <= 1'b0;
        expanded_key  <= 128'd0;
    end
    else begin
        case (state)
        // ---------------------------
        // IDLE: wait for start
        // ---------------------------
        IDLE: begin
            done <= 1'b0;
            if (start)
                state <= LOAD;
            else
                state <= IDLE;
        end
        // ---------------------------
        // LOAD: Start key (round 0) w[0..3] olarak yükle
        // ---------------------------
        LOAD: begin
            // big-endian: k0 = [127:96], k1 = [95:64], ...
            w[0] <= initial_key[127:96];
            w[1] <= initial_key[95:64];
            w[2] <= initial_key[63:32];
            w[3] <= initial_key[31:0];
            
            // Round 0 key -> round_keys[0]
            round_keys[0] <= initial_key;
            round <= 4'd1; // ilk hesaplayacağımız round = 1
            state <= CALC;
        end
        // ---------------------------
        // CALC: RotWord ve S-Box girişlerini ayarla
        // ---------------------------
        CALC: begin
            
            temp = w[4*(round-1)+3];   // Son kelime
            // RotWord: byte kaydırma
            temp = {temp[23:0], temp[31:24]};
            // S-Box girişlerini ayarla
            sbox_in0 <= temp[31:24];
            sbox_in1 <= temp[23:16];
            sbox_in2 <= temp[15:8];
            sbox_in3 <= temp[7:0];
            state <= WAIT_SBOX;  // S-Box çıktılarının hazır olmasını bekle
        end
        // ---------------------------
        // WAIT_SBOX: S-Box çıkışlarını al, SubWord ve w hesaplamalarını yap
        // ---------------------------
        WAIT_SBOX: begin
            
            subword = {
                sbox_out0 ^ RCON[round],  // İlk byte'da RCON XOR
                sbox_out1,
                sbox_out2,
                sbox_out3
            };
            w[4*round]     = w[4*(round-1)]     ^ subword;
            w[4*round + 1] = w[4*round]         ^ w[4*(round-1)+1];
            w[4*round + 2] = w[4*round + 1]     ^ w[4*(round-1)+2];
            w[4*round + 3] = w[4*round + 2]     ^ w[4*(round-1)+3];
            // 128 bit round key oluştur ve sakla
            round_keys[round] = {
                w[4*round],
                w[4*round + 1],
                w[4*round + 2],
                w[4*round + 3]
            };
            if (round == 10)
                state <= DONE_STATE; // Tüm round'lar hesaplandı
            else begin
                round <= round + 1;
                state <= CALC;
            end
        end
        // ---------------------------
        // DONE_STATE: Tüm anahtarlar hesaplandı
        // ---------------------------
        DONE_STATE: begin
            done <= 1'b1;
            // İstenen round key, desired_round girişine göre çıkışa aktarılır
            expanded_key <= round_keys[desired_round];
            // Yeni key expansion istenirse start kontrolü
            if (start)
                state <= LOAD;
            else
                state <= DONE_STATE;
        end
        endcase
    end
end

endmodule
