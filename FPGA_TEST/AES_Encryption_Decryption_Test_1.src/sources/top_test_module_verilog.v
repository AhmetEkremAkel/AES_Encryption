`timescale 1ns / 1ps

module top_test_module_verilog #(
    parameter IMAGE_WIDTH = 8,
              IMAGE_LENGHT = 8
)(
    input  wire        clk,
    input  wire        reset,      // active‑high asynchronous reset
    input              rx,
    output wire        tx,
    output reg        done,
    output reg        [7:0]led,
    input  wire       [7:0]sw
);

    top_encryption encrypt_inst (
        .clk   (clk),
        .reset (reset),
        .start (start_encryption),
        .data_in  (data_in),
        .key_in   (128'h0001_0203_0405_0607_0809_0A0B_0C0D_0E0F),
        .nonce    (128'h0000_0000_1111_1111_0000_0000_0000_0000),
        .data_out (connection[127:0]),
        .done_2     (done_encryption)
    );

    top_decryption decrypt_inst (
        .clk   (clk),
        .reset (reset),
        .start (start_decryption),
        .data_in  (connection_2[127:0]),
        .key_in   (128'h0001_0203_0405_0607_0809_0A0B_0C0D_0E0F),
        .nonce    (128'h0000_0000_1111_1111_0000_0000_0000_0000),
        .data_out (data_out_reg[127:0]),
        .done_2     (done_decryption)
    );

    uart_rx_mba #(
        .c_clkfreq(100_000_000),
        .c_baudrate(115_200)
    )uart_rx_inst(
        .clk            (clk),
        .rx_i           (rx),
        .dout_o         (uart_rx_data[7:0]),
        .rx_done_tick_o (uart_rx_done)
    );

    uart_tx_mba #(
        .c_clkfreq(100_000_000),
        .c_baudrate(115_200),
        .c_stopbit(1)
    ) uart_tx_inst (
        .clk            (clk),
        .din_i          (uart_tx_data),
        .tx_start_i     (uart_tx_start),
        .tx_o           (tx),
        .tx_done_tick_o (uart_tx_done)
    );

    integer BYTE_NUMBER = IMAGE_WIDTH * IMAGE_LENGHT;
    integer BLOCK_NUMBER = IMAGE_WIDTH * IMAGE_LENGHT / 16;

    reg [7:0] img_mem [IMAGE_WIDTH * IMAGE_LENGHT -1:0];
    reg [127:0]cipher_text[(IMAGE_WIDTH * IMAGE_LENGHT / 16)-1:0]; 
    reg [127:0]plain_text[(IMAGE_WIDTH * IMAGE_LENGHT / 16)-1:0];

    integer index;
    integer index_2;
    integer initial_start;
    integer index_3;


    reg start_encryption = 0;
    reg start_decryption = 0;
    reg [127:0]data_in = 0;
    reg uart_tx_start = 0;
    reg [7:0]uart_tx_data;

    wire [7:0]uart_rx_data;
    wire [127:0]connection;
    reg [127:0]connection_2 = 0;
    wire [127:0]data_out_reg;

    reg [2:0]state;
    localparam S_IDLE = 3'd0,
               S_RX_DONE = 3'd1,
               S_TX_START = 3'd2,
               S_TX_DONE = 3'd3,
               S_TX_LAST = 3'd4,
               S_DONE   = 3'd5;


    // ------------------------------------------------------------------------
    //  FSM + bellek yazımı
    // ------------------------------------------------------------------------
    always @(posedge clk) begin

        if (reset) begin
            state               <= S_IDLE;
            index               <= 0;
            done                <= 1'b0;
            start_decryption    <= 0;
            start_encryption    <= 0;
            data_in             <= 0;
            uart_tx_start       <= 0;
            uart_tx_data        <= 0;
            data_in             <= 0;
            connection_2        <= 0;


        end
        else begin
            case (state)
            // ---------------------------------------------------- IDLE -------
            S_IDLE: begin
                done <= 0;
                
                index_3 <= sw[7:0];
                led[7:0] <= img_mem[index_3];

                if (uart_rx_done) begin
                    img_mem[index] <= uart_rx_data[7:0];
                    index <= index + 1;
                end
                else if (index == BYTE_NUMBER) begin

                        index   <= 0;
                        start_encryption <= 1;
                        state <= S_RX_DONE;
                end
            end


            // ----------------------------------------------------- DONE -------
            S_RX_DONE: begin    //BU STATEDE ENCRYPTION YAPILIYOR
                  data_in <=     { img_mem[index * 16 + 15], img_mem[index * 16 + 14],
                                   img_mem[index * 16 + 13], img_mem[index * 16 + 12],
                                   img_mem[index * 16 + 11], img_mem[index * 16 + 10],
                                   img_mem[index * 16 + 9], img_mem[index * 16 +  8],
                                   img_mem[index * 16 + 7], img_mem[index * 16 +  6],
                                   img_mem[index * 16 + 5], img_mem[index * 16 +  4],
                                   img_mem[index * 16 + 3], img_mem[index * 16 +  2],
                                   img_mem[index *16 +  1], img_mem[index * 16]      };

                  if (done_encryption) begin
                      cipher_text[index] = connection[127:0];
                      index = index + 1;
                      if (index == BLOCK_NUMBER) begin
                          index = 0;
                          index_2 = 0;
                          initial_start = 1;
                          start_encryption <= 0;
                          state <= S_TX_START;
                      end
                  end
            end
            // ----------------------------------------------------- TX ------- //BURAYA SWITCH ATABİLİRSİN
            S_TX_START : begin
                uart_tx_start <= 0;
                if ((index_2 <= 15 && uart_tx_done) || initial_start == 1) begin
                uart_tx_data <= (cipher_text[index] >> (index_2 * 8)) & 8'hFF;
                uart_tx_start <= 1;
                index_2 = index_2 + 1;
                initial_start <= 0;
                end
                else if (index_2 == 16 && index < BLOCK_NUMBER - 1) begin
                    index = index + 1;
                    index_2 = 0;
                end
                else if (index_2 == 16 && index == BLOCK_NUMBER - 1 && uart_tx_done) begin
                    
                    index <=  0;
                    index_2 <= 0;
                    start_decryption <= 1;
                    
                    state <= S_TX_DONE;
                end
            end
            S_TX_DONE : begin   //BU STATEDE DECRYPTION YAPILIYOR
                connection_2 <= cipher_text[index];
                if (done_decryption == 1 && index < BLOCK_NUMBER - 1 ) begin
                    plain_text[index] <= data_out_reg[127:0];
                    index = index + 1;
                end
                else if (done_decryption == 1 && index == BLOCK_NUMBER - 1) begin
                    plain_text[index] <= data_out_reg[127:0];
                    index =  0;
                    index_2 = 0;
                    state <= S_TX_LAST;
                    start_decryption <= 0;
                    initial_start = 1;
                end
            end
            // ----------------------------------------------------- TX -------
            S_TX_LAST : begin
                uart_tx_start <= 0;
                if ((index_2 <= 15 && uart_tx_done) || initial_start == 1) begin
                uart_tx_data <= (plain_text[index] >> (index_2 * 8)) & 8'hFF;
                uart_tx_start <= 1;
                index_2 = index_2 + 1;
                initial_start <= 0;
                end
                else if (index_2 == 16 && index < BLOCK_NUMBER - 1) begin
                    index = index + 1;
                    index_2 = 0;
                end
                else if (index_2 == 16 && index == BLOCK_NUMBER - 1 && uart_tx_done) begin
                    state <= S_DONE;
                    index =  0;
                    index_2 = 0;
                    
                end
            end

            S_DONE : begin
                done <= 1;
                state <= S_IDLE;
            end
            endcase
        end
    end

endmodule
