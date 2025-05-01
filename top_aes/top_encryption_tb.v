`timescale 1ns / 1ps


module top_encryption_tb(
    );
reg clk;
reg reset;
reg start;
reg[127:0] data_in;
reg [127:0]key_in;
reg[127:0]nonce;
wire [127:0]data_out;
wire done     ;

top_encryption dut(
.clk              (clk      ),
.reset            (reset    ),
.start            (start    ),
.data_in          (data_in  ),
.key_in            (key_in   ),
.nonce             (nonce),
.data_out         (data_out ),
.done              (done     )
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
        nonce =     128'd1;

        #20;
        reset      = 1'b0;

        // Bir clock 
        #10;
        start    = 1'b1;
        // Test edilecek plaintext ve key atayalım
        data_in  = 128'h00112233445566778899AABBCCDDEEFF;
        key_in   = 128'h000102030405060708090A0B0C0D0E0F;
        nonce    = 128'h00000000111111110000000000000000;
        #350
        // start sinyalini tetikleyelim
        data_in  = 128'h00112233445566778899AABBCCDDEEF1;
        
        if(done)begin
            $stop;
        end

    end


endmodule
