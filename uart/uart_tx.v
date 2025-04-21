`timescale 1ns / 1ps
// 2. DENEME

module uart_tx #(
    parameter CLOCK_FREQ = 100_000_000,
              BAUD_RATE = 115_200,
              BIT_COUNT = 8
)(
    input       clk,
    input [BIT_COUNT-1:0] din_i,
    input       tx_start_i,
    output reg  tx_o,
    output reg  tx_done_tick_o
    
    );
    
        // state register values
    localparam bittimer = CLOCK_FREQ/BAUD_RATE;
    localparam S_IDLE      = 2'd0,
               S_START     = 2'd1,
               S_DATA      = 2'd2,
               S_STOP      = 2'd3;

    // registers
    integer timercount = 0;
    reg timertick,timerrun;
    reg [1:0] state;
    reg [BIT_COUNT-1:0] shreg;
    reg [$clog2(BIT_COUNT)-1:0] bitcounter;


    always @(posedge clk) begin
    case(state)
        S_IDLE: begin
            tx_o                 <= 1;
            tx_done_tick_o       <= 0;

            if (tx_start_i == 1) begin
                shreg            <= din_i; 
                state            <= S_START;
            end
        end

        S_START: begin
                tx_o             <= 0;
                timerrun         <= 1;
                bitcounter       <= 0;
                if(timertick == 1)begin
                shreg            <= din_i;
                state            <= S_DATA;
                timerrun <= 1;
                end
        end

        S_DATA: begin
            tx_o <= shreg[bitcounter];
            if (bitcounter < BIT_COUNT) begin
                
                if(timertick == 1)begin
                shreg[BIT_COUNT-2:0] <= shreg[BIT_COUNT-1:1];
                bitcounter  <= bitcounter + 1;
                timerrun    <= 1;
                timertick   <= 0;
                end
            end
            else if(bitcounter == BIT_COUNT-1)begin
                state <= S_STOP;
            end
        end

        S_STOP: begin
            tx_o <= 1;
            timerrun <= 1;
            if(timerrun == 1)begin
            tx_done_tick_o <= 1;
            state <= S_IDLE;
            end
        end
        default: state <= S_IDLE;
    endcase
    if(timerrun == 1) begin
    timertick       <= 0;
    timercount      <= 0;
      if(timercount == bittimer)begin
        timerrun    <= 0;
        timercount  <= 0;
        timertick   <= 1;
      end
      else timercount <= timercount + 1;
      end
end


    
    

endmodule
