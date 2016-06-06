`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:47:16 06/05/2016 
// Design Name: 
// Module Name:    DDR_Test 
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
module DDR_Test(
	input DDR_Ready,
	input DDR_WrReady,
	input DDR_RdReady,
	output reg DDR_WrStart,
	output reg DDR_RdStart,
	output reg [1:0] DDR_WrBank,
	output reg [1:0] DDR_RdBank,
	output reg [12:0] DDR_WrAddr,
	output reg [12:0] DDR_RdAddr,
	output reg [15:0] DDR_WrData,
	input [15:0] DDR_RdData,
	output reg [7:0] Status = 0
    );

	always @(posedge DDR_Ready) begin
		DDR_WrBank = 2'b00;
		DDR_WrAddr = 13'b0000000000000;
		DDR_WrData = 16'hBABE;
		DDR_WrStart = 1;
	end

	always @(posedge DDR_WrReady) begin
		DDR_RdBank = 2'b00;
		DDR_RdAddr = 13'b0000000000000;
		DDR_RdStart = 1;
	end
	
	always @(posedge DDR_RdReady) begin
		if ( DDR_WrData == DDR_RdData ) Status = 8'h0F;
	end

endmodule
