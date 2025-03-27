`timescale 1ns / 1ps

module AES_Dec_Core_tb;

    reg          clk;
    reg          reset;
    reg          start;
    reg  [127:0] data_in;             // Plaintext
    reg  [127:0] key_in;              // AES key
    reg          key_expansion_done;
    wire [127:0] data_out;            // Ciphertext
    wire         done;
    wire [3:0]   desired_round;

    AES_Dec_Core dut(
        .clk                (clk),
        .reset              (reset),
        .start              (start),
        .data_in            (data_in),
        .key_expansion_done (key_expansion_done),
        .desired_round      (desired_round),
        .key_in             (key_in),
        .data_out           (data_out),
        .done               (done)
    );

    // Clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns period
    end

    // Test Senaryosu
    initial begin
        reset               = 1'b1;
        start               = 1'b0;
        data_in             = 128'h0;
        key_in              = 128'h0;
        key_expansion_done  = 1'b0;

        #20;
        reset               = 1'b0;
        #15;

        // Test edilecek plaintext ve ilk key (round 0)
        data_in             = 128'h12ad1fabae6a5dbdcbddb54e670161e9;
        key_in              = 128'h615a997f702144e73d121dca98b80f54;

        // start sinyalini tetikle
        start               = 1'b1;
        #10;
        start               = 1'b0; 


        key_expansion_done  = 1'b1;
        #20;

        // AES Encryption için round anahtarları (round 1 -> round 10)
        key_in = 128'hfb939279117bdd984d33592da5aa129e; #10;
        key_in = 128'h0e20ffe2eae84fe15c4884b5e8994bb3; #10;
        key_in = 128'hb0aa906fe4c8b003b6a0cb54b4d1cf06; #10;
        key_in = 128'h535890185462206c52687b5702710452; #10;
        key_in = 128'ha78afb4b073ab074060a5b3b50197f05; #10;
        key_in = 128'hcabc49faa0b04b3f0130eb4f5613243e; #10;
        key_in = 128'he436eaa16a0c02c5a180a0705723cf71; #10;
        key_in = 128'hea9e96e38e3ae864cb8ca2b5f6a36f01; #10;
        key_in = 128'hfd231bc464a47e8745b64ad13d2fcdb4; #10;
        key_in = 128'h12345678998765432112345678998765; #10;


        wait (done == 1'b1);
        #10;

        $display("Time=%t, Ciphertext = %h", $time, data_out);

        $stop;
    end

endmodule
