`timescale 1ns / 1ps



module uart_rx #(
    parameter integer CLK_FREQ        = 100_000_000 ,   // Sistem saat frekansÄ±Â (Hz)
    parameter integer BAUDRATE        = 115_200     
)(
    input  wire        clk       ,   // Sistem saati
    input  wire        data_rx   ,   // Seri RX hattÄ±
    output reg  [7:0]  data_out  ,   // Okunan bayt
    output reg         data_out_done  // â€œ1â€� olduÄŸunda data_out geÃ§erlidir
);

localparam [1:0]       S_IDLE  = 2'd0,
                       S_START = 2'd1,
                       S_DATA  = 2'd2,
                       S_STOP  = 2'd3;

reg  [1:0]  state = S_IDLE;
reg               timer_run  = 1'b0;
integer           timerlim   = CLK_FREQ / BAUDRATE;     // DeÄŸiÅŸtirilebilir eÅŸik
integer           timer      = 0;
reg               timerthic  = 1'b0;

 localparam integer BITCOUNTER_LIM = 8;    // Sabit limit
integer           bitcounter = 0;
// -------------------------------------------------------
// GeÃ§ici veri kaydÄ±
// -------------------------------------------------------
reg [7:0]  data_out_2 = 8'd0;

 always @(posedge clk) begin
        case (state)
        // -------------------- S_IDLE -----------------------
        S_IDLE : begin
            data_out_done <= 1'b0;
            if (data_rx == 1'b0) begin               // Start bitâ€™ini yakala
                timerlim  <= CLK_FREQ / (BAUDRATE*2); // Start ortasÄ± iÃ§in Â½ bit sÃ¼resi
                timer_run <= 1'b1;
                state     <= S_START;
            end
        end

        // -------------------- S_START ----------------------
        S_START : begin
            if (timerthic) begin
                timerlim  <= CLK_FREQ / BAUDRATE;    // ArtÄ±k tam bit sÃ¼resi
                timer_run <= 1'b1;
                timerthic <= 1'b0;
                state     <= S_DATA;
            end
        end

        // -------------------- S_DATA -----------------------
        S_DATA : begin
            if (bitcounter == BITCOUNTER_LIM) begin
                // TÃ¼m veriler alÄ±ndÄ± â†’ stop bitine geÃ§
                state      <= S_STOP;
                timer_run  <= 1'b1;
                timerthic  <= 1'b0;
                bitcounter <= 0;
            end
            else if (timerthic) begin
                // Bit Ã¶rnekle
                data_out_2 <= {data_rx, data_out_2[7:1]}; // KaydÄ±r ve MSBâ€™ye yaz
                timer_run  <= 1'b1;
                timerthic  <= 1'b0;
                bitcounter <= bitcounter + 1;
            end
        end

        // -------------------- S_STOP -----------------------
        S_STOP : begin
            if (timerthic) begin
                state         <= S_IDLE;
                data_out_done <= 1'b1;
                timerthic     <= 1'b0;
                data_out      <= data_out_2;          // BaytÄ± dÄ±ÅŸarÄ± ver
            end
        end
        endcase

        // ---------------------------------------------------
        // Bit sÃ¼resi sayacÄ±
        // ---------------------------------------------------
        if (timer_run) begin
            if (timer == timerlim) begin
                timerthic <= 1'b1;      // â€œBit ortasÄ±â€� tetik iÅŸareti
                timer     <= 0;
                timer_run <= 1'b0;
            end
            else begin
                timer <= timer + 1;
            end
        end
    end
    
endmodule
