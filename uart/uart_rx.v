`timescale 1ns / 1ps



module uart_rx #(
    parameter integer CLK_FREQ        = 100_000_000 ,   // Sistem saat frekansı (Hz)
    parameter integer BAUDRATE        = 115_200     ,   // UART baud hızı
    parameter integer DATA_BIT_LENGTH = 8               // Veri bit sayısı
)(
    input  wire        clk       ,   // Sistem saati
    input  wire        data_rx   ,   // Seri RX hattı
    output reg  [7:0]  data_out  ,   // Okunan bayt
    output reg         data_out_done  // “1” olduğunda data_out geçerlidir
);

localparam [1:0]       S_IDLE  = 2'd0,
                       S_START = 2'd1,
                       S_DATA  = 2'd2,
                       S_STOP  = 2'd3;

reg  [1:0]  state = S_IDLE;
reg               timer_run  = 1'b0;
integer           timerlim   = CLK_FREQ / BAUDRATE;     // Değiştirilebilir eşik
integer           timer      = 0;
reg               timerthic  = 1'b0;

 localparam integer BITCOUNTER_LIM = DATA_BIT_LENGTH;    // Sabit limit
integer           bitcounter = 0;
// -------------------------------------------------------
// Geçici veri kaydı
// -------------------------------------------------------
reg [7:0]  data_out_2 = 8'd0;

 always @(posedge clk) begin
        case (state)
        // -------------------- S_IDLE -----------------------
        S_IDLE : begin
            data_out_done <= 1'b0;
            if (data_rx == 1'b0) begin               // Start bit’ini yakala
                timerlim  <= CLK_FREQ / (BAUDRATE*2); // Start ortası için ½ bit süresi
                timer_run <= 1'b1;
                state     <= S_START;
            end
        end

        // -------------------- S_START ----------------------
        S_START : begin
            if (timerthic) begin
                timerlim  <= CLK_FREQ / BAUDRATE;    // Artık tam bit süresi
                timer_run <= 1'b1;
                timerthic <= 1'b0;
                state     <= S_DATA;
            end
        end

        // -------------------- S_DATA -----------------------
        S_DATA : begin
            if (bitcounter == BITCOUNTER_LIM) begin
                // Tüm veriler alındı → stop bitine geç
                state      <= S_STOP;
                timer_run  <= 1'b1;
                timerthic  <= 1'b0;
                bitcounter <= 0;
            end
            else if (timerthic) begin
                // Bit örnekle
                data_out_2 <= {data_rx, data_out_2[7:1]}; // Kaydır ve MSB’ye yaz
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
                data_out      <= data_out_2;          // Baytı dışarı ver
            end
        end
        endcase

        // ---------------------------------------------------
        // Bit süresi sayacı
        // ---------------------------------------------------
        if (timer_run) begin
            if (timer == timerlim) begin
                timerthic <= 1'b1;      // “Bit ortası” tetik işareti
                timer     <= 0;
                timer_run <= 1'b0;
            end
            else begin
                timer <= timer + 1;
            end
        end
    end
    
endmodule
