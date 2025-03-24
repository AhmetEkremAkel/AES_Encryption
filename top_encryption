`timescale 1ns / 1ps


module top_encryption(
    input  wire         clk,
    input  wire         reset,

    input  wire         start,        // encrypt etmeye basla
    input  wire [127:0] data_in,      // 128-bit plaintext
    input  wire [127:0] key_in,        // 128-bit AES anahtarÄ±
    output wire  [127:0] data_out,      // 128-bit ciphertext
    output wire          done           // encryption bitti
    );
    
wire [3:0]desired_round;
wire [127:0]expanded_key;

AES_Core Core(
.clk(clk),
.reset(reset),
.start(start),        
.data_in(data_in),      
.key_expansion_done(key_expansion_done),
.desired_round(desired_round[3:0]),
.key_in(expanded_key),       
.data_out(data_out),    
.done(done)          
);

key_expansion key_expansion(
.clk(clk),
.reset(reset),
.start(start),        
.initial_key(key_in),  
.desired_round(desired_round[3:0]),
.expanded_key(expanded_key), 
.done(key_expansion_done)          
);



endmodule
