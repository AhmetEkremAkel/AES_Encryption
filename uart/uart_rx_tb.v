`timescale 1ns/1ps

module uart_rx_tb;


    localparam integer CLK_FREQ        = 100_000_000;   // Hz
    localparam integer BAUDRATE        = 115_200;
    localparam integer CLK_PERIOD_NS   = 10;            // 1 / 100 MHz
    localparam integer BIT_PERIOD_CLKS = CLK_FREQ / BAUDRATE; // ≈ 868

    reg  clk     = 1'b0;
    reg  data_rx = 1'b1;       

    wire [7:0] data_out;
    wire       data_out_done;


    uart_rx #(
        .CLK_FREQ       (CLK_FREQ),
        .BAUDRATE       (BAUDRATE),
        .DATA_BIT_LENGTH(8)
    ) dut (
        .clk          (clk),
        .data_rx      (data_rx),
        .data_out     (data_out),
        .data_out_done(data_out_done)
    );

    integer BIT_PERIOD  = 8681;
    
    always #(CLK_PERIOD_NS/2)  clk = ~clk;

    initial begin
        #100
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b1; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b1; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b1; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b1; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD;    
        #BIT_PERIOD;                                 // Boşluk

        // ------------------------------------------------
        // 2) 0xA3 (1010_0011)
        // ------------------------------------------------
        data_rx = 1'b0; #BIT_PERIOD;                 // Start
        data_rx = 1'b1; #BIT_PERIOD; // b0
        data_rx = 1'b1; #BIT_PERIOD; // b1
        data_rx = 1'b0; #BIT_PERIOD; // b2
        data_rx = 1'b0; #BIT_PERIOD; // b3
        data_rx = 1'b0; #BIT_PERIOD; // b4
        data_rx = 1'b1; #BIT_PERIOD; // b5
        data_rx = 1'b0; #BIT_PERIOD; // b6
        data_rx = 1'b1; #BIT_PERIOD; // b7
        data_rx = 1'b1; #BIT_PERIOD;                 // Stop
        #1000
        $finish;
    end

endmodule

