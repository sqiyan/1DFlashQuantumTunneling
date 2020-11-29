/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module entities_handler_8 (
    input [15:0] playerposition,
    input [15:0] e6position,
    input [15:0] e11position,
    input [15:0] e16position,
    input [15:0] playerwon,
    input [15:0] lives_left,
    output reg [767:0] out
  );
  
  
  
  always @* begin
    out = 768'h000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    if (e16position[15+0-:1] == 1'h1) begin
      out[72+23-:24] = 24'h00ff00;
      out[96+23-:24] = 24'h00ff00;
      out[408+23-:24] = 24'h00ff00;
      out[432+23-:24] = 24'h00ff00;
      out[576+23-:24] = 24'h00ff00;
    end
    if (e11position[15+0-:1] == 1'h1) begin
      out[168+23-:24] = 24'h00ff00;
      out[192+23-:24] = 24'h00ff00;
      out[360+23-:24] = 24'h00ff00;
      out[504+23-:24] = 24'h00ff00;
      out[528+23-:24] = 24'h00ff00;
    end
    if (e6position[15+0-:1] == 1'h1) begin
      out[264+23-:24] = 24'h00ff00;
      out[288+23-:24] = 24'h00ff00;
      out[312+23-:24] = 24'h00ff00;
      out[624+23-:24] = 24'h00ff00;
      out[696+23-:24] = 24'h00ff00;
      out[720+23-:24] = 24'h00ff00;
    end
    out[(playerposition[0+4-:5])*24+23-:24] = 24'hff0000;
    if (playerwon[0+0-:1] == 1'h1) begin
      if (lives_left[0+1-:2] != 2'h0) begin
        out = 768'h0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff;
      end else begin
        out = 768'h00ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff00;
        out[(playerposition[0+4-:5])*24+23-:24] = 24'hff0000;
      end
    end
  end
endmodule
