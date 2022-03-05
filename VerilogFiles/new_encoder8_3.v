`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Mixed Signal Design Hacakthon
//
// (Organized by FOSSEE IIT Bombay, VSD Corp. Pvt. Ltd.)
// 
// Design Name: 		8:3 Encoder
// Designer :	 		Akash Arun Ambekar
// Module Name:    	encoder8_3 
//
//////////////////////////////////////////////////////////////////////////////////
module new_encoder8_3(in,out);
  input [7:0] in;
  output reg [2:0] out;
  
  always @(*)
    begin
      case(in)
        8'b00000000 : out = 3'b000;
        8'b00000010 : out = 3'b001;
        8'b00000110 : out = 3'b010;
        8'b00001110 : out = 3'b011;
        8'b00011110 : out = 3'b100;
        8'b00111110 : out = 3'b101;
        8'b01111110 : out = 3'b110;
        8'b11111110 : out = 3'b111;
        default  : out = 3'b000; 
      endcase
    end
endmodule
