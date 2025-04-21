`timescale 1ns / 1ps
module top_module_tb(
    );
 reg          clk;
 reg         reset;
 reg         start ;      // encrypt etmeye basla
 reg [127:0]data_in ;     // 128-bit plaintext
 reg [127:0]key_in   ;     // 128-bit AES anahtarÃ„Â±
 reg [127:0]nonce ;

top_module dut(
.clk              (clk      ),
.reset            (reset    ),
.start            (start    ),
.data_in          (data_in  ),
.key_in            (key_in   ),
.nonce             (nonce)
);

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns period
    end

    initial begin
        reset      = 1'b1;
        start        = 1'b0;
        data_in      = 128'h0;
        key_in      = 128'h0;
        nonce =     128'd0;

        #20;
        reset      = 1'b0;

        // Bir clock 
        #10;
        start    = 1'b1;
        // Test edilecek plaintext ve key atayalÄ±m
        data_in  = 128'h10112233445566778899AABBCCDDEEFF;
        key_in   = 128'h000102030405060708090A0B0C0D0E0F;
        nonce    = 128'h00000000111111110000000000000000;
        #370
        // start sinyalini tetikleyelim
        data_in  = 128'h20112233445566778899AABBCCDDEEFF;
        #140
        data_in  = 128'h30112233445566778899AABBCCDDEEFF;
        #140
        data_in  = 128'h40112233445566778899AABBCCDDEEFF;
        #140
        data_in  = 128'h50112233445566778899AABBCCDDEEFF;
        #140
        data_in  = 128'h60112233445566778899AABBCCDDEEFF;
        #140
        data_in  = 128'h70112233445566778899AABBCCDDEEFF;
        #140
        data_in  = 128'h80112233445566778899AABBCCDDEEFF;
    end

endmodule
