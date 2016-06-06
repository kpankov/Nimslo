`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:45:19 05/26/2016 
// Design Name: 
// Module Name:    StateMachine 
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
module StateMachine(
	input clk,
	input UART_Rx_Data_Ready,
	input [7:0] UART_Rx_Data
    );

reg [7:0] Command;

always @(posedge UART_Rx_Data_Ready)
begin
	Command <= UART_Rx_Data;
end

endmodule
