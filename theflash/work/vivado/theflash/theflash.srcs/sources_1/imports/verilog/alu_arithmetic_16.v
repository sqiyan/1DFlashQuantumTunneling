/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_arithmetic_16 (
    input [15:0] a,
    input [15:0] b,
    input [3:0] alufn,
    output reg z,
    output reg v,
    output reg n,
    output reg [15:0] out
  );
  
  
  
  reg [15:0] s;
  
  always @* begin
    
    case (alufn)
      4'h0: begin
        s = a + b;
      end
      4'h1: begin
        s = a - b;
      end
      4'h2: begin
        s = (a * b);
      end
      4'h7: begin
        if (b != 1'h0) begin
          s = a - ((a / b) * b);
        end else begin
          s = a;
        end
      end
      default: begin
        s = 1'h0;
      end
    endcase
    z = s == 1'h0;
    v = (a[15+0-:1] & (b[15+0-:1] ^ alufn[0+0-:1]) & ~s[15+0-:1]) | (~a[15+0-:1] & ~(b[15+0-:1] ^ alufn[0+0-:1]) & s[15+0-:1]);
    n = s[15+0-:1];
    out = s;
  end
endmodule
