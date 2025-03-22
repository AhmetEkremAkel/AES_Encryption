`timescale 1ns / 1ps
//branch deneme
module AES_Core (
    input  wire         clk,
    input  wire         reset,

    input  wire         start,        // encrypt etmeye başla
    input  wire [127:0] data_in,      // 128-bit plaintext

    input  wire  key_expansion_done,  //key expansion bittiginde done olur.
    output reg [3:0] desired_round,  // istenilen anahtarın numarası
    input  wire [127:0] key_in,       // 128-bit AES anahtarı

    output reg  [127:0] data_out,     // 128-bit ciphertext
    output reg          done          // encryption bitti
);
    // ------------------------------------------
    // Parametreler & Durum (FSM için)
    // ------------------------------------------
    localparam IDLE                = 3'd0;
    localparam WAIT_KEY_EXPANSION  = 3'd1;
    localparam INIT_ADDKEY         = 3'd2;
    localparam ROUND               = 3'd3;  // (SubBytes -> ShiftRows -> MixColumns -> AddRoundKey)
    localparam FINAL_ROUND         = 3'd4;  // (SubBytes -> ShiftRows -> AddRoundKey) (MixColumns yok)
    localparam DONE_STATE          = 3'd5;

    reg [2:0]  state, next_state;
    reg [3:0]  round_cnt, next_round_cnt; // 0..10 arasında sayabilir (AES-128 için)
    reg [127:0] state_reg, next_state_reg;

    // ------------------------------------------
    // Alt Modül Sinyalleri
    // ------------------------------------------
    wire [127:0] sb_out;   // SubBytes çıkışı
    wire [127:0] sr_out;   // ShiftRows çıkışı
    wire [127:0] sb_out_2;   // SubBytes çıkışı
    wire [127:0] sr_out_2;   // ShiftRows çıkışı
    wire [127:0] mc_out;   // MixColumns çıkışı
    wire [127:0] ark_out;  // AddRoundKey çıkışı
    reg [127:0] last_state_reg;
    wire [127:0] last_ark_out;
    // ------------------------------------------
    // Alt Modülleri Instantiate Edelim
    // ------------------------------------------
    // 1) SubBytes
    subbytes u_subbytes(
        .state_in (state_reg),
        .state_out(sb_out)
    );

    // 2) ShiftRows
    shiftrows u_shiftrows(
        .state_in (sb_out),
        .state_out(sr_out)
    );

    // 3) MixColumns
    mixcolumns u_mixcolumns(
        .state_in (sr_out),
        .state_out(mc_out)
    );

    // 4) AddRoundKey
    addroundkey u_addroundkey(
        .state_in    (mc_out),
        .round_key   (key_in),
        .state_out   (ark_out)
    );
////////////////////////////////////////////////////////////////////
    subbytes u_subbytes_2(
        .state_in (last_state_reg),
        .state_out(sb_out_2)
    );

    shiftrows u_shiftrows_2(
        .state_in (sb_out_2),
        .state_out(sr_out_2)
    );

    addroundkey u_addroundkey_2(
        .state_in    (sr_out_2),
        .round_key   (key_in),
        .state_out   (last_ark_out)
    );

    // ------------------------------------------
    // FSM - State Register
    // ------------------------------------------
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state       <= IDLE;
            round_cnt   <= 4'd0;
            state_reg   <= 128'd0;
            data_out    <= 128'd0;
            done        <= 1'b0;
            desired_round <=4'b0;
        end else begin
            state       <= next_state;
            round_cnt   <= next_round_cnt;
            state_reg   <= next_state_reg;
            desired_round <= round_cnt; //BURADA BİR HATA VAR
        end
    end

    // ------------------------------------------
    // FSM - Next State ve Çıkış Mantığı
    // ------------------------------------------
    always @(*) begin
        next_state     = state;
        next_round_cnt = round_cnt;
        next_state_reg = state_reg;
        done           = 1'b0;

        case (state)
            IDLE: begin
                if (start) begin
                    // Başlangıçta plaintext'i state_reg'e at
                    next_state_reg = data_in;
                    next_round_cnt = 4'd0;
                    next_state     = WAIT_KEY_EXPANSION;
                end
            end

            WAIT_KEY_EXPANSION: begin
                if (key_expansion_done) begin
                    // Başlangıçta plaintext'i state_reg'e at
                    next_state_reg = data_in;
                    next_state     = INIT_ADDKEY;
                end
            end

            //----------------------------------
            // Initial Round -> AddRoundKey
            INIT_ADDKEY: begin
                // Bu adımda normalde: state_reg XOR key_in
                // round_cnt = 0 => round_key = key_in (ya da key_expansion'dan round=0)
                next_state_reg = state_reg ^ key_in;  // ilk turun anahtarı
                next_round_cnt = round_cnt + 1;       // sıradaki tura geç
                next_state     = ROUND;               // Ara roundlara geç
            end

            //----------------------------------
            // Ara Round (9 defa)
            ROUND: begin

                next_state_reg = ark_out;  // 1 clock sonunda elde edilen sonuç

                if (round_cnt == 4'd9) begin
                    // 9. tur bitti, final round'a geç
                    next_state     = FINAL_ROUND;
                    last_state_reg = ark_out;
                end else begin
                    // 9. tur henüz bitmediyse sonraki tura geç
                    next_state     = ROUND;
                end
                next_round_cnt = round_cnt + 1;
            end

            FINAL_ROUND: begin

                data_out = last_ark_out;
                next_state     = DONE_STATE;
            end

            //----------------------------------
            DONE_STATE: begin
                done        = 1'b1;
                next_state  = IDLE;  
                // Şifrelenmiş metni output'a veriyoruz
                // next_state_reg = ??? (gerek yok)
            end

        endcase
    end

endmodule
