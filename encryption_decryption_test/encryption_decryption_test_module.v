`timescale 1ns / 1ps


module top_module(
 input  wire         clk,
 input         reset,
 input         start,        // encrypt etmeye basla
 input [127:0]data_in,      // 128-bit plaintext
 input [127:0]key_in,        // 128-bit AES anahtarÄ±
 input [127:0]nonce 
 );
 
wire [127:0]encrypt_out;
reg start_2 = 0;
integer timer = 0;

top_encryption top_encryption(
.clk(clk),
.reset(reset),
.start(start),        
.data_in(data_in),      
.key_in(key_in),
.nonce(nonce),     
.data_out(encrypt_out),    
.done(done)          
);


top_decryption top_decryption(
.clk(clk),
.reset(reset),
.start(start_2),        
.data_in(encrypt_out),      
.key_in(key_in),
.nonce(nonce),     
.data_out(decrypt_out),    
.done(done_2)          
);


always @(posedge clk or posedge reset)begin
    if(reset)begin
        start_2 <= 0;
    end else begin
        if(timer == 10)begin
            start_2 <= 1;
        end else begin
            timer = timer + 1;
        end
    end
    
end

endmodule
