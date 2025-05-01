`timescale 1ns/1ps

module aes_core_tb;

    reg         clk;
    reg         reset;
    reg         start;
    reg  [127:0] data_in;   // Plaintext
    reg  [127:0] key_in;    // AES key
    reg key_expansion_done;
    wire [127:0] data_out;  // Ciphertext
    wire        done;

    AES_Core dut(
        .clk       (clk),
        .reset       (reset),
        .start     (start),
        .data_in   (data_in),
        .key_expansion_done(key_expansion_done),
        .desired_round(desired_round),
        .key_in    (key_in),
        .data_out  (data_out),
        .done      (done)
    );


    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns period
    end

    initial begin
        reset      = 1'b1;
        start    = 1'b0;
        data_in  = 128'h0;
        key_in   = 128'h0;

        #20;
        reset      = 1'b0;

        // Bir clock 
        #10;

        // Test edilecek plaintext ve key atayalÄ±m
        data_in  = 128'h00112233445566778899AABBCCDDEEFF;
        key_in   = 128'h000102030405060708090A0B0C0D0E0F;

        // start sinyalini tetikleyelim
        start    = 1'b1;
        #10;
        start    = 1'b0;  // Tek clock "start"Ä± aktif
        key_expansion_done = 1'b1;
        #16
        key_in   = 128'hd6aa74fdd2af72fadaa678f1d6ab76fe;
        #10
        key_in   = 128'hb692cf0b643dbdf1be9bc5006830b3fe;
        #10
        key_in   = 128'hb6ff744ed2c2c9bf6c590cbf0469bf41;
        #10
        key_in   = 128'h47f7f7bc95353e03f96c32bcfd058dfd;
        #10
        key_in   = 128'h3caaa3e8a99f9deb50f3af57adf622aa;
        #10
        key_in   = 128'h5e390f7df7a69296a7553dc10aa31f6b;
        #10
        key_in   = 128'h14f9701ae35fe28c440adf4d4ea9c026;
        #10
        key_in   = 128'h47438735a41c65b9e016baf4aebf7ad2;
        #10
        key_in   = 128'h549932d1f08557681093ed9cbe2c974e;
        #10
        key_in   = 128'h13111d7fe3944a17f307a78b4d2b30c5;
        #10
        wait (done == 1'b1);
        #10; // done olduktan sonra bir kaÃ§ ns bekle

        $display("Time=%t, Ciphertext = %h", $time, data_out);


        $stop;

    end

endmodule
