`timescale 1ns / 1ps

module tb_key_expansion();
    // Testbench sinyalleri
    reg         clk;
    reg         reset;
    reg         start;
    reg [127:0] initial_key;
    reg [3:0]   desired_round;
    wire [127:0] expanded_key;
    wire         done;

    // DUT (Device Under Test) instantiation
    key_expansion dut (
        .clk          (clk),
        .reset        (reset),
        .start        (start),
        .initial_key  (initial_key),
        .desired_round(desired_round),
        .expanded_key (expanded_key),
        .done         (done)
    );

    // Saat üretimi: 10ns periyotta 50MHz clock
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    // Test senaryosu
    integer r;
    initial begin
        // Başlangıç değerleri
        reset         = 1'b1;
        start         = 1'b0;
        desired_round = 4'd0;
        initial_key   = 128'h000102030405060708090A0B0C0D0E0F; 
        // Yukarıda, AES test vektörlerinden birini örnek aldık
        // Her bayt: 0x00, 0x01, 0x02, ...
        
        // Bir süre bekle sonra reset'i bırak
        #20;
        reset = 1'b0;

        // Bir süre bekle, sonra start'ı aktifleştir
        #20;
        start = 1'b1;
        #20;
        // Bir clock sonra start'ı sıfırla (edge alignment'a dikkat)
        @(posedge clk);
        start = 1'b0;

        // Key expansion'ın done olmasını bekle
        wait(done == 1'b1);
     
        for (r = 0; r <= 10; r=r+1) begin
            desired_round = r[3:0];
            #10;
            $display("Round %0d key = %h", r, expanded_key);
        end

        // Testi bitir
        #20;
        $display("Test finished.");
        $stop; // Simülasyonu durdur
    end

endmodule
