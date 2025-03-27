`timescale 1ns / 1ps


module top_encryption(
    input  wire         clk,
    input  wire         reset,

    input  wire         start,        // encrypt etmeye basla
    input  wire [127:0] data_in,      // 128-bit plaintext
    input  wire [127:0] key_in,        // 128-bit AES anahtarÄ±
    input  wire [127:0] nonce,         //nonce sayÄ±sÄ± (gÃ¼venlik iÃ§in hiÃ§bir zaman aynÄ± nonce yi tekrar kullanmayÄ±n ! )
    
    output wire  [127:0] data_out,      // 128-bit ciphertext
    output wire          done           // encryption bitti
    );

localparam IDLE                = 3'd0;
localparam RUN                 = 3'd1;

wire [3:0]desired_round;
wire [127:0]expanded_key;
wire [127:0]encrypt_out;
reg [127:0]nonce_reg;
reg state;


AES_Core Core(
.clk(clk),
.reset(reset),
.start(start),        
.data_in(nonce_reg),      
.key_expansion_done(key_expansion_done),
.desired_round(desired_round[3:0]),
.key_in(expanded_key),       
.data_out(encrypt_out),    
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

always @(posedge clk or posedge reset) begin
    if(reset)begin
        nonce_reg <= 128'd0;
        state <= IDLE;
    end else begin

        case(state)

            IDLE:begin
                if(start)begin
                    state <= RUN;
                    nonce_reg <= nonce;
                end
            end

            RUN:begin
                if(done)begin
                    nonce_reg = nonce_reg + 1;
                end
            end
        endcase
    end
end

assign data_out = encrypt_out ^ data_in;


endmodule

