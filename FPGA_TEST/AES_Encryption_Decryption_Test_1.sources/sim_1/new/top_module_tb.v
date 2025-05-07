`timescale 1ns / 1ps
module top_module_tb(   //bu testbenchi çalıştırmak için top modulde img_mem i [31:0] cipher_text ve plain_texti [1:0] indexlerine ayarlayın
    );
 reg          clk;
 reg         reset;
 reg         data_rx;
 wire         tx;
wire            done;

top_test_module_verilog dut(
.clk             (clk),
.reset           (reset),
.rx              (data_rx),
.tx              (tx),
.done(done)
);

    localparam integer CLK_FREQ        = 50_000_000;   // Hz   
    localparam integer BAUDRATE        = 115_200;
    localparam integer CLK_PERIOD_NS   = 20;            // 1 / 100 MHz
    localparam integer BIT_PERIOD_CLS = CLK_FREQ / BAUDRATE; // ≈ 868

    initial begin
        clk = 0;
        forever #10 clk = ~clk; // 10 ns period
    end
    reg [7:0] tx_data [0:15];
    integer j, k;

    integer BIT_PERIOD  = 8681;
    initial begin
        reset      = 1'b1;
        #30;
        reset      = 1'b0;
        #20;
        // Define a 16-byte matrix with the data you want to send
        

        // Initialize the data matrix (change these values as needed)
        
        tx_data[0] = 8'b10000011;
tx_data[1] = 8'b01111010;
tx_data[2] = 8'b01111010;
tx_data[3] = 8'b01111010;
tx_data[4] = 8'b01111010;
tx_data[5] = 8'b10011011;
tx_data[6] = 8'b10011011;
tx_data[7] = 8'b10011011;
tx_data[8] = 8'b10000110;
tx_data[9] = 8'b11010010;
tx_data[10] = 8'b11010010;
tx_data[11] = 8'b01111010;
tx_data[12] = 8'b01111010;
tx_data[13] = 8'b01111011;
tx_data[14] = 8'b01111010;
tx_data[15] = 8'b10000110;

        // Loop over each of the 16 bytes
        for (j = 0; j < 16; j = j + 1) begin
            // Transmit Start bit
            data_rx = 1'b0;
            #BIT_PERIOD;

            // Transmit 8 data bits (LSB first)
            for (k = 0; k < 8; k = k + 1) begin
            data_rx = tx_data[j][k];
            #BIT_PERIOD;
            end

            // Transmit Stop bit
            data_rx = 1'b1;
            #BIT_PERIOD;
            
            // Optional inter-byte delay
            #10;
        end

                // Initialize the data matrix (change these values as needed)

        tx_data[0]  =  8'b01111010;
tx_data[1]  =  8'b11011101;
tx_data[2]  =  8'b11011101;
tx_data[3]  =  8'b10010011;
tx_data[4]  =  8'b01111010;
tx_data[5]  =  8'b01111011;
tx_data[6]  =  8'b01111010;
tx_data[7]  =  8'b01111010;
tx_data[8]  =  8'b01111010;
tx_data[9]  =  8'b10010011;
tx_data[10]  =  8'b10010011;
tx_data[11]  =  8'b01111010;
tx_data[12]  =  8'b01111101;
tx_data[13]  =  8'b01111011;
tx_data[14]  =  8'b01111011;
tx_data[15]  =  8'b01111010;

        // Loop over each of the 16 bytes
        for (j = 0; j < 16; j = j + 1) begin
            // Transmit Start bit
            data_rx = 1'b0;
            #BIT_PERIOD;

            // Transmit 8 data bits (LSB first)
            for (k = 0; k < 8; k = k + 1) begin
            data_rx = tx_data[j][k];
            #BIT_PERIOD;
            end

            // Transmit Stop bit
            data_rx = 1'b1;
            #BIT_PERIOD;
            
            // Optional inter-byte delay
            #10;
        end

                // Initialize the data matrix (change these values as needed)
        
        tx_data[0] = 8'b10001011;
tx_data[1] = 8'b01111010;
tx_data[2] = 8'b10001011;
tx_data[3] = 8'b10000010;
tx_data[4] = 8'b10010011;
tx_data[5] = 8'b01111011;
tx_data[6] = 8'b01111010;
tx_data[7] = 8'b01111010;
tx_data[8] = 8'b10101100;
tx_data[9] = 8'b10000010;
tx_data[10] = 8'b01111010;
tx_data[11] = 8'b01111010;
tx_data[12] = 8'b10000010;
tx_data[13] = 8'b00101011;
tx_data[14] = 8'b10001011;
tx_data[15] = 8'b01111010;


        // Loop over each of the 16 bytes
        for (j = 0; j < 16; j = j + 1) begin
            // Transmit Start bit
            data_rx = 1'b0;
            #BIT_PERIOD;

            // Transmit 8 data bits (LSB first)
            for (k = 0; k < 8; k = k + 1) begin
            data_rx = tx_data[j][k];
            #BIT_PERIOD;
            end

            // Transmit Stop bit
            data_rx = 1'b1;
            #BIT_PERIOD;
            
            // Optional inter-byte delay
            #10;
        end

                // Initialize the data matrix (change these values as needed)

        

        tx_data[0] = 8'b10000110;
tx_data[1] = 8'b10001001;
tx_data[2] = 8'b10001001;
tx_data[3] = 8'b10001001;
tx_data[4] = 8'b10001001;
tx_data[5] = 8'b00110111;
tx_data[6] = 8'b10100111;
tx_data[7] = 8'b10001010;
tx_data[8] = 8'b10001001;
tx_data[9] = 8'b10001001;
tx_data[10] = 8'b10001001;
tx_data[11] = 8'b10001001;
tx_data[12] = 8'b10001001;
tx_data[13] = 8'b10001001;
tx_data[14] = 8'b10001001;
tx_data[15] = 8'b10001000;


        // Loop over each of the 16 bytes
        for (j = 0; j < 16; j = j + 1) begin
            // Transmit Start bit
            data_rx = 1'b0;
            #BIT_PERIOD;

            // Transmit 8 data bits (LSB first)
            for (k = 0; k < 8; k = k + 1) begin
            data_rx = tx_data[j][k];
            #BIT_PERIOD;
            end

            // Transmit Stop bit
            data_rx = 1'b1;
            #BIT_PERIOD;
            
            // Optional inter-byte delay
            #10;
        end

    wait(done);

        tx_data[0]  = 8'b10000011;
        tx_data[1]  = 8'b01111010;
        tx_data[2]  = 8'b01111010;
        tx_data[3]  = 8'b01111010;
        tx_data[4]  = 8'b01111010;
        tx_data[5]  = 8'b10011011;
        tx_data[6]  = 8'b10011011;
        tx_data[7]  = 8'b10011011;
        tx_data[8]  = 8'b10000110;
        tx_data[9]  = 8'b11010010;
        tx_data[10]  = 8'b11010010;
        tx_data[11]  = 8'b01111010;
        tx_data[12]   = 8'b01111010;
        tx_data[13]   = 8'b01111011;
        tx_data[14]   = 8'b01111010;
        tx_data[15]   = 8'b10000110;

        // Loop over each of the 16 bytes
        for (j = 0; j < 16; j = j + 1) begin
            // Transmit Start bit
            data_rx = 1'b0;
            #BIT_PERIOD;

            // Transmit 8 data bits (LSB first)
            for (k = 0; k < 8; k = k + 1) begin
            data_rx = tx_data[j][k];
            #BIT_PERIOD;
            end

            // Transmit Stop bit
            data_rx = 1'b1;
            #BIT_PERIOD;
            
            // Optional inter-byte delay
            #10;
        end

                // Initialize the data matrix (change these values as needed)

        tx_data[0] = 8'b01111010;
        tx_data[1] = 8'b11011101;
        tx_data[2] = 8'b11011101;
        tx_data[3] = 8'b10010011;
        tx_data[4] = 8'b01111010;
        tx_data[5] = 8'b01111011;
        tx_data[6] = 8'b01111010;
        tx_data[7] = 8'b01111010;
        tx_data[8] = 8'b01111010;
        tx_data[9] = 8'b10010011;
        tx_data[10] = 8'b10010011;
        tx_data[11] = 8'b01111010;
        tx_data[12] = 8'b01111101;
        tx_data[13] = 8'b01111011;
        tx_data[14] = 8'b01111011;
        tx_data[15] = 8'b01111010;

        // Loop over each of the 16 bytes
        for (j = 0; j < 16; j = j + 1) begin
            // Transmit Start bit
            data_rx = 1'b0;
            #BIT_PERIOD;

            // Transmit 8 data bits (LSB first)
            for (k = 0; k < 8; k = k + 1) begin
            data_rx = tx_data[j][k];
            #BIT_PERIOD;
            end

            // Transmit Stop bit
            data_rx = 1'b1;
            #BIT_PERIOD;
            
            // Optional inter-byte delay
            #10;
        end

                // Initialize the data matrix (change these values as needed)
        
        tx_data[0]   =   8'b10001011;
        tx_data[1]   =   8'b01111010;
        tx_data[2]   =   8'b10001011;
        tx_data[3]   =   8'b10000010;
        tx_data[4]   =   8'b10010011;
        tx_data[5]   =   8'b01111011;
        tx_data[6]   =   8'b01111010;
        tx_data[7]   =   8'b01111010;
        tx_data[8]   =   8'b10101100;
        tx_data[9]   =   8'b10000010;
        tx_data[10]   =   8'b01111010;
        tx_data[11]   =   8'b01111010;
        tx_data[12]   =   8'b10000010;
        tx_data[13]   =   8'b00101011;
        tx_data[14]   =   8'b10001011;
        tx_data[15]   =   8'b01111010;


        // Loop over each of the 16 bytes
        for (j = 0; j < 16; j = j + 1) begin
            // Transmit Start bit
            data_rx = 1'b0;
            #BIT_PERIOD;

            // Transmit 8 data bits (LSB first)
            for (k = 0; k < 8; k = k + 1) begin
            data_rx = tx_data[j][k];
            #BIT_PERIOD;
            end

            // Transmit Stop bit
            data_rx = 1'b1;
            #BIT_PERIOD;
            
            // Optional inter-byte delay
            #10;
        end

                // Initialize the data matrix (change these values as needed)
        

        tx_data[0]      = 8'b10000110;
        tx_data[1]      = 8'b10001001;
        tx_data[2]      = 8'b10001001;
        tx_data[3]      = 8'b10001001;
        tx_data[4]      = 8'b10001001;
        tx_data[5]      = 8'b00110111;
        tx_data[6]      = 8'b10100111;
        tx_data[7]      = 8'b10001010;
        tx_data[8]      = 8'b10001001;
        tx_data[9]      = 8'b10001001;
        tx_data[10]      = 8'b10001001;
        tx_data[11]      = 8'b10001001;
        tx_data[12]      = 8'b10001001;
        tx_data[13]      = 8'b10001001;
        tx_data[14]      = 8'b10001000;
        tx_data[15]      = 8'b10001000;

        // Loop over each of the 16 bytes
        for (j = 0; j < 16; j = j + 1) begin
            // Transmit Start bit
            data_rx = 1'b0;
            #BIT_PERIOD;

            // Transmit 8 data bits (LSB first)
            for (k = 0; k < 8; k = k + 1) begin
            data_rx = tx_data[j][k];
            #BIT_PERIOD;
            end

            // Transmit Stop bit
            data_rx = 1'b1;
            #BIT_PERIOD;
            
            // Optional inter-byte delay
            #10;
        end
    end
endmodule
