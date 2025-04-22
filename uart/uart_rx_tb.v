`timescale 1ns/1ps
/* -----------------------------------------------------------
 * uart_rx  ‑  Testbench
 * Sistem saati  : 100 MHz  (10 ns periyot)
 * UART hızı     : 115 200 baud  (≈ 868 clk/bit)
 * ----------------------------------------------------------- */
module uart_rx_tb;

    // -------------------------------------------------------
    // Parametreler
    // -------------------------------------------------------
    localparam integer CLK_FREQ        = 100_000_000;   // Hz
    localparam integer BAUDRATE        = 115_200;
    localparam integer CLK_PERIOD_NS   = 10;            // 1 / 100 MHz
    localparam integer BIT_PERIOD_CLKS = CLK_FREQ / BAUDRATE; // ≈ 868

    // -------------------------------------------------------
    // Sinyaller
    // -------------------------------------------------------
    reg  clk     = 1'b0;
    reg  data_rx = 1'b1;        // Hat idle = ‘1’

    wire [7:0] data_out;
    wire       data_out_done;

    // DUT (Device Under Test)
    uart_rx #(
        .CLK_FREQ       (CLK_FREQ),
        .BAUDRATE       (BAUDRATE),
        .DATA_BIT_LENGTH(8)
    ) dut (
        .clk          (clk),
        .data_rx      (data_rx),
        .data_out     (data_out),
        .data_out_done(data_out_done)
    );

    // -------------------------------------------------------
    // 100 MHz sistem saati
    // -------------------------------------------------------
    always #(CLK_PERIOD_NS/2)  clk = ~clk;

    // -------------------------------------------------------
    // Bir baytı UART formatında gönderme (LSB‑önce)
    // -------------------------------------------------------
    task automatic send_byte (input [7:0] byte);
        integer i;
        begin
            // Start bit (0)
            data_rx <= 1'b0;
            repeat (BIT_PERIOD_CLKS) @(posedge clk);

            // Veri bitleri
            for (i = 0; i < 8; i = i + 1) begin
                data_rx <= byte[i];
                repeat (BIT_PERIOD_CLKS) @(posedge clk);
            end

            // Stop bit (1)
            data_rx <= 1'b1;
            repeat (BIT_PERIOD_CLKS) @(posedge clk);

            // En az 1 bit daha idle bekle
            repeat (BIT_PERIOD_CLKS) @(posedge clk);
        end
    endtask

    // -------------------------------------------------------
    // Test senaryosu
    // -------------------------------------------------------
    initial begin
        // Dalgaformu kaydı (İsteğe bağlı)
        $dumpfile("uart_rx_tb.vcd");
        $dumpvars(0, uart_rx_tb);

        // Simülasyonu başlatmadan önce kısa bekle
        repeat (20) @(posedge clk);

        // İki bayt gönder
        send_byte(8'h55);   // 0101_0101
        send_byte(8'hA3);   // 1010_0011

        // Tüm bitler işlensin
        repeat (2000) @(posedge clk);
        $display("Test tamamlandı.");
        $finish;
    end

    // -------------------------------------------------------
    // İzleme
    // -------------------------------------------------------
    always @(posedge clk) begin
        if (data_out_done)
            $display("Zaman %t : Alınan bayt = 0x%02h", $time, data_out);
    end
endmodule
