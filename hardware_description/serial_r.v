module serial_r #( parameter CLK_PER_BIT = 50)
   (
    input        clk,
    input        rst,
    input        rx,
    output [7:0] data,
    output       done
    );

   // clog2 is 'ceiling of log base 2' which gives you the number of bits needed to store a value
   parameter CNT_SIZE = $clog2(CLK_PER_BIT);

   localparam STATE_SIZE = 2;
   localparam
     IDLE = 2'd0,
     WAIT_HALF = 2'd1,
     WAIT_FULL = 2'd2,
     WAIT_HIGH = 2'd3;

   reg [CNT_SIZE - 1 : 0] cnt_d, cnt_q;
   reg [2:0]              bit_cnt_d, bit_cnt_q;
   reg [7:0]              data_d, data_q;
   reg                    done_d, done_q;
   reg [STATE_SIZE - 1 : 0] state_d, state_q = IDLE;
   reg                      rx_d, rx_q;

   assign done = done_q;
   assign data = data_q;

   always @(*) begin
      rx_d = rx;
      state_d = state_q;
      cnt_d = cnt_q;
      bit_cnt_d = bit_cnt_q;
      data_d = data_q;
      done_d = 1'b0;

      case (state_q)
        IDLE: begin
           bit_cnt_d = 3'b0;
           cnt_d = 1'b0;
           if (rx_q == 1'b0) begin
              state_d = WAIT_HALF;
           end
        end
        WAIT_HALF: begin
           cnt_d = cnt_q + 1'b1;
           if (cnt_q == (CLK_PER_BIT >> 1)) begin
              cnt_d = 1'b0;
              state_d = WAIT_FULL;
           end
        end
        WAIT_FULL: begin
           cnt_d = cnt_q + 1'b1;
           if (cnt_q == CLK_PER_BIT - 1) begin
              data_d = {rx_q, data_q[7:1]};
              bit_cnt_d = bit_cnt_q + 1'b1;
              cnt_d = 1'b0;
              if (bit_cnt_q == 3'd7) begin
                 state_d = WAIT_HIGH;
                 done_d = 1'b1;
              end
           end
        end
        WAIT_HIGH: begin
           if (rx_q == 1'b1) begin
              state_d = IDLE;
           end
        end
        default: begin
           state_d = IDLE;
        end
      endcase

   end

   always @(posedge clk) begin
      if (rst) begin
         cnt_q <= 1'b0;
         bit_cnt_q <= 3'b0;
         done_q <= 1'b0;
         state_q <= IDLE;
      end else begin
         cnt_q <= cnt_d;
         bit_cnt_q <= bit_cnt_d;
         done_q <= done_d;
         state_q <= state_d;
      end

      rx_q <= rx_d;
      data_q <= data_d;
   end

endmodule
