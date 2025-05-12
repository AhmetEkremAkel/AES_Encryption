`timescale 1ns / 1ps


module top_decryption(
 input  wire         clk,
 input         reset,
 input         start,        // encrypt etmeye basla
 input [127:0]data_in,      // 128-bit plaintext
 input [127:0]key_in,        // 128-bit AES anahtarı
 input [127:0]nonce, 
    output reg  [127:0] data_out,      // 128-bit ciphertext
    output reg          done_2           // encryption bitti
    );
        //nonce sayısı (güvenlik için hiçbir zaman aynı nonce yi tekrar kullanmayın ! )
    
localparam IDLE                = 3'd0;
localparam RUN                 = 3'd1;
localparam STOP                = 3'd2;

wire [3:0]desired_round;
wire [127:0]expanded_key;
wire [127:0]encrypt_out;
reg [127:0]nonce_reg;
reg [1:0]state;


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
        done_2 <= 0;
        data_out <= 0;
    end else begin

        case(state)

            IDLE:begin
                if(start)begin
                    state <= RUN;
                    nonce_reg <= nonce;
                    data_out <= 0;
                end
            end

            RUN:begin
                done_2 <= 0;
                if(done)begin
                    done_2 <= 1;
                    nonce_reg = nonce_reg + 1;
                    data_out = encrypt_out ^ data_in;   //burada data_out reglendiği için bir cycle kaybı var
                end

                if(start == 0) begin
                    state <= STOP;
                end
            end

            STOP:begin
                if(start)begin
                    state <= RUN;
                end
            end
            
        endcase
    end
end



endmodule
