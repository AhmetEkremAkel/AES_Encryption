`timescale 1ns / 1ps
module top_module_tb(
    );
 reg          clk;
 reg         reset;
 reg         data_rx;
 wire         tx;
 wire          done;

top_test_module_verilog dut(
.clk             (clk),
.reset           (reset),
.rx              (data_rx),
.tx              (tx),
.done            (done)
);

    localparam integer CLK_FREQ        = 50_000_000;   // Hz   
    localparam integer BAUDRATE        = 115_200;
    localparam integer CLK_PERIOD_NS   = 20;            // 1 / 100 MHz
    localparam integer BIT_PERIOD_CLS = CLK_FREQ / BAUDRATE; // ≈ 868

    initial begin
        clk = 0;
        forever #10 clk = ~clk; // 10 ns period
    end
    integer BIT_PERIOD  = 8681;
    initial begin
        reset      = 1'b1;
        #60;
        reset      = 1'b0;
        #30;
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
        #20;
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b1; #BIT_PERIOD; // bit0
        data_rx = 1'b1; #BIT_PERIOD; // bit1
        data_rx = 1'b1; #BIT_PERIOD; // bit2
        data_rx = 1'b1; #BIT_PERIOD; // bit3
        data_rx = 1'b1; #BIT_PERIOD; // bit4
        data_rx = 1'b1; #BIT_PERIOD; // bit5
        data_rx = 1'b1; #BIT_PERIOD; // bit6
        data_rx = 1'b1; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b1; #BIT_PERIOD; // bit0
        data_rx = 1'b1; #BIT_PERIOD; // bit1
        data_rx = 1'b1; #BIT_PERIOD; // bit2
        data_rx = 1'b1; #BIT_PERIOD; // bit3
        data_rx = 1'b1; #BIT_PERIOD; // bit4
        data_rx = 1'b1; #BIT_PERIOD; // bit5
        data_rx = 1'b1; #BIT_PERIOD; // bit6
        data_rx = 1'b1; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b1; #BIT_PERIOD; // bit0
        data_rx = 1'b1; #BIT_PERIOD; // bit1
        data_rx = 1'b1; #BIT_PERIOD; // bit2
        data_rx = 1'b1; #BIT_PERIOD; // bit3
        data_rx = 1'b1; #BIT_PERIOD; // bit4
        data_rx = 1'b1; #BIT_PERIOD; // bit5
        data_rx = 1'b1; #BIT_PERIOD; // bit6
        data_rx = 1'b1; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b1; #BIT_PERIOD; // bit0
        data_rx = 1'b1; #BIT_PERIOD; // bit1
        data_rx = 1'b1; #BIT_PERIOD; // bit2
        data_rx = 1'b1; #BIT_PERIOD; // bit3
        data_rx = 1'b1; #BIT_PERIOD; // bit4
        data_rx = 1'b1; #BIT_PERIOD; // bit5
        data_rx = 1'b1; #BIT_PERIOD; // bit6
        data_rx = 1'b1; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        //DATA 22222222222222222222222222222222222222222222222222222222222222222222222222222222222

        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b1; #BIT_PERIOD; // bit0
        data_rx = 1'b1; #BIT_PERIOD; // bit1
        data_rx = 1'b1; #BIT_PERIOD; // bit2
        data_rx = 1'b1; #BIT_PERIOD; // bit3
        data_rx = 1'b1; #BIT_PERIOD; // bit4
        data_rx = 1'b1; #BIT_PERIOD; // bit5
        data_rx = 1'b1; #BIT_PERIOD; // bit6
        data_rx = 1'b1; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD;    

        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b1; #BIT_PERIOD; // bit0
        data_rx = 1'b1; #BIT_PERIOD; // bit1
        data_rx = 1'b1; #BIT_PERIOD; // bit2
        data_rx = 1'b1; #BIT_PERIOD; // bit3
        data_rx = 1'b1; #BIT_PERIOD; // bit4
        data_rx = 1'b1; #BIT_PERIOD; // bit5
        data_rx = 1'b1; #BIT_PERIOD; // bit6
        data_rx = 1'b1; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b1; #BIT_PERIOD; // bit0
        data_rx = 1'b1; #BIT_PERIOD; // bit1
        data_rx = 1'b1; #BIT_PERIOD; // bit2
        data_rx = 1'b1; #BIT_PERIOD; // bit3
        data_rx = 1'b1; #BIT_PERIOD; // bit4
        data_rx = 1'b1; #BIT_PERIOD; // bit5
        data_rx = 1'b1; #BIT_PERIOD; // bit6
        data_rx = 1'b1; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b1; #BIT_PERIOD; // bit0
        data_rx = 1'b1; #BIT_PERIOD; // bit1
        data_rx = 1'b1; #BIT_PERIOD; // bit2
        data_rx = 1'b1; #BIT_PERIOD; // bit3
        data_rx = 1'b1; #BIT_PERIOD; // bit4
        data_rx = 1'b1; #BIT_PERIOD; // bit5
        data_rx = 1'b1; #BIT_PERIOD; // bit6
        data_rx = 1'b1; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b1; #BIT_PERIOD; // bit0
        data_rx = 1'b1; #BIT_PERIOD; // bit1
        data_rx = 1'b1; #BIT_PERIOD; // bit2
        data_rx = 1'b1; #BIT_PERIOD; // bit3
        data_rx = 1'b1; #BIT_PERIOD; // bit4
        data_rx = 1'b1; #BIT_PERIOD; // bit5
        data_rx = 1'b1; #BIT_PERIOD; // bit6
        data_rx = 1'b1; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD;
        
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
        #20;
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b1; #BIT_PERIOD; // bit0
        data_rx = 1'b1; #BIT_PERIOD; // bit1
        data_rx = 1'b1; #BIT_PERIOD; // bit2
        data_rx = 1'b1; #BIT_PERIOD; // bit3
        data_rx = 1'b1; #BIT_PERIOD; // bit4
        data_rx = 1'b1; #BIT_PERIOD; // bit5
        data_rx = 1'b1; #BIT_PERIOD; // bit6
        data_rx = 1'b1; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b1; #BIT_PERIOD; // bit0
        data_rx = 1'b1; #BIT_PERIOD; // bit1
        data_rx = 1'b1; #BIT_PERIOD; // bit2
        data_rx = 1'b1; #BIT_PERIOD; // bit3
        data_rx = 1'b1; #BIT_PERIOD; // bit4
        data_rx = 1'b1; #BIT_PERIOD; // bit5
        data_rx = 1'b1; #BIT_PERIOD; // bit6
        data_rx = 1'b1; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b1; #BIT_PERIOD; // bit0
        data_rx = 1'b1; #BIT_PERIOD; // bit1
        data_rx = 1'b1; #BIT_PERIOD; // bit2
        data_rx = 1'b1; #BIT_PERIOD; // bit3
        data_rx = 1'b1; #BIT_PERIOD; // bit4
        data_rx = 1'b1; #BIT_PERIOD; // bit5
        data_rx = 1'b1; #BIT_PERIOD; // bit6
        data_rx = 1'b1; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b1; #BIT_PERIOD; // bit0
        data_rx = 1'b1; #BIT_PERIOD; // bit1
        data_rx = 1'b1; #BIT_PERIOD; // bit2
        data_rx = 1'b1; #BIT_PERIOD; // bit3
        data_rx = 1'b1; #BIT_PERIOD; // bit4
        data_rx = 1'b1; #BIT_PERIOD; // bit5
        data_rx = 1'b1; #BIT_PERIOD; // bit6
        data_rx = 1'b1; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        //DATA 22222222222222222222222222222222222222222222222222222222222222222222222222222222222

        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b1; #BIT_PERIOD; // bit0
        data_rx = 1'b1; #BIT_PERIOD; // bit1
        data_rx = 1'b1; #BIT_PERIOD; // bit2
        data_rx = 1'b1; #BIT_PERIOD; // bit3
        data_rx = 1'b1; #BIT_PERIOD; // bit4
        data_rx = 1'b1; #BIT_PERIOD; // bit5
        data_rx = 1'b1; #BIT_PERIOD; // bit6
        data_rx = 1'b1; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD;    

        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b1; #BIT_PERIOD; // bit0
        data_rx = 1'b1; #BIT_PERIOD; // bit1
        data_rx = 1'b1; #BIT_PERIOD; // bit2
        data_rx = 1'b1; #BIT_PERIOD; // bit3
        data_rx = 1'b1; #BIT_PERIOD; // bit4
        data_rx = 1'b1; #BIT_PERIOD; // bit5
        data_rx = 1'b1; #BIT_PERIOD; // bit6
        data_rx = 1'b1; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b1; #BIT_PERIOD; // bit0
        data_rx = 1'b1; #BIT_PERIOD; // bit1
        data_rx = 1'b1; #BIT_PERIOD; // bit2
        data_rx = 1'b1; #BIT_PERIOD; // bit3
        data_rx = 1'b1; #BIT_PERIOD; // bit4
        data_rx = 1'b1; #BIT_PERIOD; // bit5
        data_rx = 1'b1; #BIT_PERIOD; // bit6
        data_rx = 1'b1; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b1; #BIT_PERIOD; // bit0
        data_rx = 1'b1; #BIT_PERIOD; // bit1
        data_rx = 1'b1; #BIT_PERIOD; // bit2
        data_rx = 1'b1; #BIT_PERIOD; // bit3
        data_rx = 1'b1; #BIT_PERIOD; // bit4
        data_rx = 1'b1; #BIT_PERIOD; // bit5
        data_rx = 1'b1; #BIT_PERIOD; // bit6
        data_rx = 1'b1; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b0; #BIT_PERIOD; // bit0
        data_rx = 1'b0; #BIT_PERIOD; // bit1
        data_rx = 1'b0; #BIT_PERIOD; // bit2
        data_rx = 1'b0; #BIT_PERIOD; // bit3
        data_rx = 1'b0; #BIT_PERIOD; // bit4
        data_rx = 1'b0; #BIT_PERIOD; // bit5
        data_rx = 1'b0; #BIT_PERIOD; // bit6
        data_rx = 1'b0; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD; 

        
        data_rx = 1'b0; #BIT_PERIOD; // Start
        data_rx = 1'b1; #BIT_PERIOD; // bit0
        data_rx = 1'b1; #BIT_PERIOD; // bit1
        data_rx = 1'b1; #BIT_PERIOD; // bit2
        data_rx = 1'b1; #BIT_PERIOD; // bit3
        data_rx = 1'b1; #BIT_PERIOD; // bit4
        data_rx = 1'b1; #BIT_PERIOD; // bit5
        data_rx = 1'b1; #BIT_PERIOD; // bit6
        data_rx = 1'b1; #BIT_PERIOD; // bit7
        data_rx = 1'b1; #BIT_PERIOD;  
        
        wait(done); 
        
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
            #20;
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b1; #BIT_PERIOD; // bit0
            data_rx = 1'b1; #BIT_PERIOD; // bit1
            data_rx = 1'b1; #BIT_PERIOD; // bit2
            data_rx = 1'b1; #BIT_PERIOD; // bit3
            data_rx = 1'b1; #BIT_PERIOD; // bit4
            data_rx = 1'b1; #BIT_PERIOD; // bit5
            data_rx = 1'b1; #BIT_PERIOD; // bit6
            data_rx = 1'b1; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b1; #BIT_PERIOD; // bit0
            data_rx = 1'b1; #BIT_PERIOD; // bit1
            data_rx = 1'b1; #BIT_PERIOD; // bit2
            data_rx = 1'b1; #BIT_PERIOD; // bit3
            data_rx = 1'b1; #BIT_PERIOD; // bit4
            data_rx = 1'b1; #BIT_PERIOD; // bit5
            data_rx = 1'b1; #BIT_PERIOD; // bit6
            data_rx = 1'b1; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b1; #BIT_PERIOD; // bit0
            data_rx = 1'b1; #BIT_PERIOD; // bit1
            data_rx = 1'b1; #BIT_PERIOD; // bit2
            data_rx = 1'b1; #BIT_PERIOD; // bit3
            data_rx = 1'b1; #BIT_PERIOD; // bit4
            data_rx = 1'b1; #BIT_PERIOD; // bit5
            data_rx = 1'b1; #BIT_PERIOD; // bit6
            data_rx = 1'b1; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b1; #BIT_PERIOD; // bit0
            data_rx = 1'b1; #BIT_PERIOD; // bit1
            data_rx = 1'b1; #BIT_PERIOD; // bit2
            data_rx = 1'b1; #BIT_PERIOD; // bit3
            data_rx = 1'b1; #BIT_PERIOD; // bit4
            data_rx = 1'b1; #BIT_PERIOD; // bit5
            data_rx = 1'b1; #BIT_PERIOD; // bit6
            data_rx = 1'b1; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            //DATA 22222222222222222222222222222222222222222222222222222222222222222222222222222222222
    
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b1; #BIT_PERIOD; // bit0
            data_rx = 1'b1; #BIT_PERIOD; // bit1
            data_rx = 1'b1; #BIT_PERIOD; // bit2
            data_rx = 1'b1; #BIT_PERIOD; // bit3
            data_rx = 1'b1; #BIT_PERIOD; // bit4
            data_rx = 1'b1; #BIT_PERIOD; // bit5
            data_rx = 1'b1; #BIT_PERIOD; // bit6
            data_rx = 1'b1; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD;    
    
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b1; #BIT_PERIOD; // bit0
            data_rx = 1'b1; #BIT_PERIOD; // bit1
            data_rx = 1'b1; #BIT_PERIOD; // bit2
            data_rx = 1'b1; #BIT_PERIOD; // bit3
            data_rx = 1'b1; #BIT_PERIOD; // bit4
            data_rx = 1'b1; #BIT_PERIOD; // bit5
            data_rx = 1'b1; #BIT_PERIOD; // bit6
            data_rx = 1'b1; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b1; #BIT_PERIOD; // bit0
            data_rx = 1'b1; #BIT_PERIOD; // bit1
            data_rx = 1'b1; #BIT_PERIOD; // bit2
            data_rx = 1'b1; #BIT_PERIOD; // bit3
            data_rx = 1'b1; #BIT_PERIOD; // bit4
            data_rx = 1'b1; #BIT_PERIOD; // bit5
            data_rx = 1'b1; #BIT_PERIOD; // bit6
            data_rx = 1'b1; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b1; #BIT_PERIOD; // bit0
            data_rx = 1'b1; #BIT_PERIOD; // bit1
            data_rx = 1'b1; #BIT_PERIOD; // bit2
            data_rx = 1'b1; #BIT_PERIOD; // bit3
            data_rx = 1'b1; #BIT_PERIOD; // bit4
            data_rx = 1'b1; #BIT_PERIOD; // bit5
            data_rx = 1'b1; #BIT_PERIOD; // bit6
            data_rx = 1'b1; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b1; #BIT_PERIOD; // bit0
            data_rx = 1'b1; #BIT_PERIOD; // bit1
            data_rx = 1'b1; #BIT_PERIOD; // bit2
            data_rx = 1'b1; #BIT_PERIOD; // bit3
            data_rx = 1'b1; #BIT_PERIOD; // bit4
            data_rx = 1'b1; #BIT_PERIOD; // bit5
            data_rx = 1'b1; #BIT_PERIOD; // bit6
            data_rx = 1'b1; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD;
            
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
            #20;
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b1; #BIT_PERIOD; // bit0
            data_rx = 1'b1; #BIT_PERIOD; // bit1
            data_rx = 1'b1; #BIT_PERIOD; // bit2
            data_rx = 1'b1; #BIT_PERIOD; // bit3
            data_rx = 1'b1; #BIT_PERIOD; // bit4
            data_rx = 1'b1; #BIT_PERIOD; // bit5
            data_rx = 1'b1; #BIT_PERIOD; // bit6
            data_rx = 1'b1; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b1; #BIT_PERIOD; // bit0
            data_rx = 1'b1; #BIT_PERIOD; // bit1
            data_rx = 1'b1; #BIT_PERIOD; // bit2
            data_rx = 1'b1; #BIT_PERIOD; // bit3
            data_rx = 1'b1; #BIT_PERIOD; // bit4
            data_rx = 1'b1; #BIT_PERIOD; // bit5
            data_rx = 1'b1; #BIT_PERIOD; // bit6
            data_rx = 1'b1; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b1; #BIT_PERIOD; // bit0
            data_rx = 1'b1; #BIT_PERIOD; // bit1
            data_rx = 1'b1; #BIT_PERIOD; // bit2
            data_rx = 1'b1; #BIT_PERIOD; // bit3
            data_rx = 1'b1; #BIT_PERIOD; // bit4
            data_rx = 1'b1; #BIT_PERIOD; // bit5
            data_rx = 1'b1; #BIT_PERIOD; // bit6
            data_rx = 1'b1; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b1; #BIT_PERIOD; // bit0
            data_rx = 1'b1; #BIT_PERIOD; // bit1
            data_rx = 1'b1; #BIT_PERIOD; // bit2
            data_rx = 1'b1; #BIT_PERIOD; // bit3
            data_rx = 1'b1; #BIT_PERIOD; // bit4
            data_rx = 1'b1; #BIT_PERIOD; // bit5
            data_rx = 1'b1; #BIT_PERIOD; // bit6
            data_rx = 1'b1; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            //DATA 22222222222222222222222222222222222222222222222222222222222222222222222222222222222
    
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b1; #BIT_PERIOD; // bit0
            data_rx = 1'b1; #BIT_PERIOD; // bit1
            data_rx = 1'b1; #BIT_PERIOD; // bit2
            data_rx = 1'b1; #BIT_PERIOD; // bit3
            data_rx = 1'b1; #BIT_PERIOD; // bit4
            data_rx = 1'b1; #BIT_PERIOD; // bit5
            data_rx = 1'b1; #BIT_PERIOD; // bit6
            data_rx = 1'b1; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD;    
    
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b1; #BIT_PERIOD; // bit0
            data_rx = 1'b1; #BIT_PERIOD; // bit1
            data_rx = 1'b1; #BIT_PERIOD; // bit2
            data_rx = 1'b1; #BIT_PERIOD; // bit3
            data_rx = 1'b1; #BIT_PERIOD; // bit4
            data_rx = 1'b1; #BIT_PERIOD; // bit5
            data_rx = 1'b1; #BIT_PERIOD; // bit6
            data_rx = 1'b1; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b1; #BIT_PERIOD; // bit0
            data_rx = 1'b1; #BIT_PERIOD; // bit1
            data_rx = 1'b1; #BIT_PERIOD; // bit2
            data_rx = 1'b1; #BIT_PERIOD; // bit3
            data_rx = 1'b1; #BIT_PERIOD; // bit4
            data_rx = 1'b1; #BIT_PERIOD; // bit5
            data_rx = 1'b1; #BIT_PERIOD; // bit6
            data_rx = 1'b1; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b1; #BIT_PERIOD; // bit0
            data_rx = 1'b1; #BIT_PERIOD; // bit1
            data_rx = 1'b1; #BIT_PERIOD; // bit2
            data_rx = 1'b1; #BIT_PERIOD; // bit3
            data_rx = 1'b1; #BIT_PERIOD; // bit4
            data_rx = 1'b1; #BIT_PERIOD; // bit5
            data_rx = 1'b1; #BIT_PERIOD; // bit6
            data_rx = 1'b1; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b0; #BIT_PERIOD; // bit0
            data_rx = 1'b0; #BIT_PERIOD; // bit1
            data_rx = 1'b0; #BIT_PERIOD; // bit2
            data_rx = 1'b0; #BIT_PERIOD; // bit3
            data_rx = 1'b0; #BIT_PERIOD; // bit4
            data_rx = 1'b0; #BIT_PERIOD; // bit5
            data_rx = 1'b0; #BIT_PERIOD; // bit6
            data_rx = 1'b0; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD; 
    
            
            data_rx = 1'b0; #BIT_PERIOD; // Start
            data_rx = 1'b1; #BIT_PERIOD; // bit0
            data_rx = 1'b1; #BIT_PERIOD; // bit1
            data_rx = 1'b1; #BIT_PERIOD; // bit2
            data_rx = 1'b1; #BIT_PERIOD; // bit3
            data_rx = 1'b1; #BIT_PERIOD; // bit4
            data_rx = 1'b1; #BIT_PERIOD; // bit5
            data_rx = 1'b1; #BIT_PERIOD; // bit6
            data_rx = 1'b1; #BIT_PERIOD; // bit7
            data_rx = 1'b1; #BIT_PERIOD;  

    end

endmodule
