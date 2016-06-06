`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:44:58 04/30/2016 
// Design Name: 
// Module Name:    LEDs_Driver 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module LEDs_Driver(
    input [7:0] data,
	 input wire clk,
	 input wire rst,
    output reg led0,
    output reg led1,
    output reg led2,
    output reg led3,
    output reg led4,
    output reg led5,
    output reg led6,
    output reg led7
    );
	
//always @ (posedge clk)
//begin
	//led0 <= data[0];
	//led1 <= data[1];
	//led2 <= data[2];
	//led3 <= data[3];
	//led4 <= data[4];
	//led5 <= data[5];
	//led6 <= data[6];
	//led7 <= data[7];
//end

always @ (posedge rst)
begin
	led0 <= 0;
	led1 <= 0;
	led2 <= 0;
	led3 <= 0;
	led4 <= 0;
	led5 <= 0;
	led6 <= 0;
	led7 <= 0;
end

endmodule
