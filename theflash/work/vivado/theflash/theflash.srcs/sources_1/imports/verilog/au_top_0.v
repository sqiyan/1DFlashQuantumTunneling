/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    output reg [23:0] io_led,
    input [4:0] io_button,
    input usb_rx,
    output reg usb_tx,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_edge_dt_btn_up_out;
  reg [1-1:0] M_edge_dt_btn_up_in;
  edge_detector_2 edge_dt_btn_up (
    .clk(clk),
    .in(M_edge_dt_btn_up_in),
    .out(M_edge_dt_btn_up_out)
  );
  wire [1-1:0] M_edge_dt_btn_down_out;
  reg [1-1:0] M_edge_dt_btn_down_in;
  edge_detector_2 edge_dt_btn_down (
    .clk(clk),
    .in(M_edge_dt_btn_down_in),
    .out(M_edge_dt_btn_down_out)
  );
  wire [1-1:0] M_edge_dt_btn_mid_out;
  reg [1-1:0] M_edge_dt_btn_mid_in;
  edge_detector_2 edge_dt_btn_mid (
    .clk(clk),
    .in(M_edge_dt_btn_mid_in),
    .out(M_edge_dt_btn_mid_out)
  );
  wire [1-1:0] M_btn_cond_up_out;
  reg [1-1:0] M_btn_cond_up_in;
  button_conditioner_3 btn_cond_up (
    .clk(clk),
    .in(M_btn_cond_up_in),
    .out(M_btn_cond_up_out)
  );
  wire [1-1:0] M_btn_cond_down_out;
  reg [1-1:0] M_btn_cond_down_in;
  button_conditioner_3 btn_cond_down (
    .clk(clk),
    .in(M_btn_cond_down_in),
    .out(M_btn_cond_down_out)
  );
  wire [1-1:0] M_btn_cond_mid_out;
  reg [1-1:0] M_btn_cond_mid_in;
  button_conditioner_3 btn_cond_mid (
    .clk(clk),
    .in(M_btn_cond_mid_in),
    .out(M_btn_cond_mid_out)
  );
  wire [16-1:0] M_gameMachine_lives;
  wire [16-1:0] M_gameMachine_playerposition;
  wire [16-1:0] M_gameMachine_slow_counter_time;
  wire [1-1:0] M_gameMachine_state_number;
  reg [1-1:0] M_gameMachine_up_button;
  reg [1-1:0] M_gameMachine_down_button;
  reg [1-1:0] M_gameMachine_middle_button;
  game_customBeta_4 gameMachine (
    .clk(clk),
    .rst(rst),
    .up_button(M_gameMachine_up_button),
    .down_button(M_gameMachine_down_button),
    .middle_button(M_gameMachine_middle_button),
    .lives(M_gameMachine_lives),
    .playerposition(M_gameMachine_playerposition),
    .slow_counter_time(M_gameMachine_slow_counter_time),
    .state_number(M_gameMachine_state_number)
  );
  wire [7-1:0] M_test_display_seg;
  wire [4-1:0] M_test_display_sel;
  reg [16-1:0] M_test_display_values;
  multi_seven_seg_5 test_display (
    .clk(clk),
    .rst(rst),
    .values(M_test_display_values),
    .seg(M_test_display_seg),
    .sel(M_test_display_sel)
  );
  
  wire [16-1:0] M_converter_out;
  reg [16-1:0] M_converter_pp;
  converter_6 converter (
    .pp(M_converter_pp),
    .out(M_converter_out)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    io_seg = 8'hff;
    io_sel = 4'hf;
    usb_tx = usb_rx;
    io_led = 24'h000000;
    io_led[0+7-:8] = {1'h0, M_gameMachine_state_number};
    M_btn_cond_up_in = io_button[0+0-:1];
    M_btn_cond_down_in = io_button[2+0-:1];
    M_btn_cond_mid_in = io_button[1+0-:1];
    M_edge_dt_btn_up_in = M_btn_cond_up_out;
    M_edge_dt_btn_down_in = M_btn_cond_down_out;
    M_edge_dt_btn_mid_in = M_btn_cond_mid_out;
    M_gameMachine_up_button = M_edge_dt_btn_up_out;
    M_gameMachine_down_button = M_edge_dt_btn_down_out;
    M_gameMachine_middle_button = M_edge_dt_btn_mid_out;
    io_seg = ~M_test_display_seg;
    M_converter_pp = M_gameMachine_playerposition;
    M_test_display_values = M_converter_out;
    io_sel = ~M_test_display_sel;
  end
endmodule