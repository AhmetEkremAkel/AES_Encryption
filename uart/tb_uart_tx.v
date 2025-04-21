`timescale 1ns / 1ps

module uart_tx_tb;

    // Testbench sinyalleri
    reg clk;
    reg [7:0] din_i;
    reg tx_start_i;
    wire tx_o;
    wire tx_done_tick_o;

    // Clock üretimi (100 MHz)
    initial clk = 0;
    always #5 clk = ~clk;  // 10 ns periyod = 100 MHz
    
    // UART_TX modülünün çağrılması
    uart_tx uut (
        .clk(clk),
        .din_i(din_i),
        .tx_start_i(tx_start_i),
        .tx_o(tx_o),
        .tx_done_tick_o(tx_done_tick_o)
    );

    initial begin
        // Başlangıç durumları
        din_i = 8'b0;
        tx_start_i = 0;

        // Başlangıç için bekle
        #100;

        // İlk veri gönderimi
        din_i = 8'hA5; // 10100101
        tx_start_i = 1;
        #10;
        tx_start_i = 0;

        // Gönderim tamamlanmasını bekle
        wait (tx_done_tick_o);
        #100;

        // İkinci veri gönderimi
        din_i = 8'h3C; // 00111100
        tx_start_i = 1;
        #10;
        tx_start_i = 0;

        wait (tx_done_tick_o);
        #200;

        // Simülasyonu bitir
        $finish;
    end
    
    initial begin
        $monitor("Zaman:%0t | din_i:%h | tx_start_i:%b | tx_o:%b | done:%b", $time, din_i, tx_start_i, tx_o, tx_done_tick_o);
    end

endmodule
