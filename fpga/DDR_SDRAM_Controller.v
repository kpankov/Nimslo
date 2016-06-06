`timescale 100ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        KSP-Labs
// Engineer:       K. Pankov
// 
// Create Date:    23:04:40 05/24/2016 
// Design Name:    DDR SDRAM Controller Module
// Module Name:    DDR_SDRAM_Controller 
// Project Name:   Nimslo
// Target Devices: xc3s1600e-5fg320
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
module DDR_SDRAM_Controller(
	output reg [12:0] IC_A,
	output reg [1:0] IC_BA,
	inout [15:0] IC_DQ,
	output IC_CK_P,
	output IC_CK_N,
	output reg IC_CKE,
	output reg IC_CS,
	output reg IC_LDM,
	output reg IC_UDM,
	output reg IC_RAS,
	output reg IC_CAS,
	output reg IC_WE,
	inout IC_LDQS,
	inout IC_UDQS,
	//input CLK_200MHz,
	//input WrStart,
	output reg WrReady = 0,
	//input [1:0] WrBank,
	//input [22:0] WrAddr,
	//input [15:0] WrData,
	input RdStart,
	output reg RdReady = 0,
	input [1:0] RdBank,
	input [22:0] RdAddr,
	input [15:0] RdData,
	output reg DevReady = 0
    );

	reg CLK_100MHz = 0;
	
	// Test bench
	reg [1:0] WrBank;
	reg [22:0] WrAddr;
	reg [15:0] WrData;
	reg WrStart = 0;
	reg CLK_200MHz;	
	initial begin
		CLK_200MHz = 1;
		WrBank = 2'b00;
		WrData = 16'hBABE;
	end
	always #25 CLK_200MHz = ~CLK_200MHz;
	always @(posedge DevReady) WriteStage = 1;
	// End of test bench
	
	always @(posedge CLK_200MHz)  CLK_100MHz = ~CLK_100MHz;

	buf(IC_CK_P, CLK_100MHz);
	not(IC_CK_N, CLK_100MHz);
	
	reg IsOutputs = 0;
	reg IC_LDQS_BUF;
	reg IC_UDQS_BUF;
	reg [15:0] IC_DQ_BUF;
	OBUFT BUF_LDQS (.I(IC_LDQS_BUF), .T(IsOutputs), .O(IC_LDQS));
	OBUFT BUF_UDQS (.I(IC_UDQS_BUF), .T(IsOutputs), .O(IC_UDQS));
	OBUFT BUF0 (.I(IC_DQ_BUF[0]), .T(IsOutputs), .O(IC_DQ[0]));
	OBUFT BUF1 (.I(IC_DQ_BUF[1]), .T(IsOutputs), .O(IC_DQ[1]));
	OBUFT BUF2 (.I(IC_DQ_BUF[2]), .T(IsOutputs), .O(IC_DQ[2]));
	OBUFT BUF3 (.I(IC_DQ_BUF[3]), .T(IsOutputs), .O(IC_DQ[3]));
	OBUFT BUF4 (.I(IC_DQ_BUF[4]), .T(IsOutputs), .O(IC_DQ[4]));
	OBUFT BUF5 (.I(IC_DQ_BUF[5]), .T(IsOutputs), .O(IC_DQ[5]));
	OBUFT BUF6 (.I(IC_DQ_BUF[6]), .T(IsOutputs), .O(IC_DQ[6]));
	OBUFT BUF7 (.I(IC_DQ_BUF[7]), .T(IsOutputs), .O(IC_DQ[7]));
	OBUFT BUF8 (.I(IC_DQ_BUF[8]), .T(IsOutputs), .O(IC_DQ[8]));
	OBUFT BUF9 (.I(IC_DQ_BUF[9]), .T(IsOutputs), .O(IC_DQ[9]));
	OBUFT BUF10 (.I(IC_DQ_BUF[10]), .T(IsOutputs), .O(IC_DQ[10]));
	OBUFT BUF11 (.I(IC_DQ_BUF[11]), .T(IsOutputs), .O(IC_DQ[11]));
	OBUFT BUF12 (.I(IC_DQ_BUF[12]), .T(IsOutputs), .O(IC_DQ[12]));
	OBUFT BUF13 (.I(IC_DQ_BUF[13]), .T(IsOutputs), .O(IC_DQ[13]));
	OBUFT BUF14 (.I(IC_DQ_BUF[14]), .T(IsOutputs), .O(IC_DQ[14]));
	OBUFT BUF15 (.I(IC_DQ_BUF[15]), .T(IsOutputs), .O(IC_DQ[15]));
	
	reg [5:0] InitStage = 0;
	reg [31:0] Counter = 0;
	
	reg [5:0] WriteStage = 0;
	reg [5:0] ReadStage = 0;

	always @(posedge WrStart) WriteStage = 1;
	always @(posedge RdStart) ReadStage = 1;

// NEGEDGE 2xCLK
	always @(negedge CLK_200MHz) begin
		case (WriteStage)
		9 : begin
				IC_LDM = 1;
				IC_UDM = 1;
				WriteStage = 10;
			end
		endcase
	end

// POSEDGE CLK
	always @(posedge CLK_100MHz) begin
		if (DevReady == 1) begin
			case (WriteStage)
			2 : WriteStage = 3;
			4 : WriteStage = 5;
			6 : WriteStage = 7;
			8 : begin
					IsOutputs = 1;
					IC_LDQS_BUF = 1;
					IC_UDQS_BUF = 1;
					WriteStage = 9;
				end
			11 : begin
					IsOutputs = 1;
					IC_LDQS_BUF = 1;
					IC_UDQS_BUF = 1;
					WriteStage = 12;
				end
			12 : WriteStage = 13;
			15 : begin
					WrReady = 1;
					WriteStage = 16;
				end
			endcase
		end
	end

// NEGEDGE CLK
	always @(negedge CLK_100MHz) begin
		if (DevReady == 1) begin
			case (WriteStage)
			1 : begin
					// ACT command
					IC_CS = 0;
					IC_RAS = 0;
					IC_CAS = 1;
					IC_WE = 1;
					IC_A[12:0] = WrAddr[22:10];
					WriteStage = 2;
				end
			3 : begin
					// NOP command
					IC_CS = 0;
					IC_RAS = 1;
					IC_CAS = 1;
					IC_WE = 1;
					WriteStage = 4;
				end
			5 : begin
					// WRITE command
					IC_CS = 0;
					IC_RAS = 1;
					IC_CAS = 0;
					IC_WE = 0;
					IC_BA = WrBank;
					IC_A[9:0] = WrAddr[9:0];
					IC_A[10] = 0;
					WriteStage = 6;
				end
			7 : begin
					// NOP command
					IC_CS = 0;
					IC_RAS = 1;
					IC_CAS = 1;
					IC_WE = 1;
					
					// Data
					IsOutputs = 1;
					IC_LDQS_BUF = 0;
					IC_UDQS_BUF = 0;
					IC_LDM = 0;
					IC_UDM = 0;
					IC_DQ_BUF = WrData;
					
					WriteStage = 8;
				end
			10 : begin
					IsOutputs = 1;
					IC_LDQS_BUF = 0;
					IC_UDQS_BUF = 0;
					
					WriteStage = 11;
				end
			13 : begin
					// PRE ALL command
					IC_CS = 0;
					IC_RAS = 0;
					IC_CAS = 1;
					IC_WE = 1;
					IC_A[10] = 1;
					
					WriteStage = 14;
				end
			14 : begin
					// NOP command
					IC_CS = 0;
					IC_RAS = 1;
					IC_CAS = 1;
					IC_WE = 1;
					Counter <= Counter + 1;
					if (Counter == 3) begin // Wait 30ns > 20ns (tRD)
						Counter <= 0;
						WriteStage = 15;
					end
				end
			16: begin
					WrReady = 0;
					WriteStage = 0;
			end
			endcase
		end
		else if (DevReady == 0) begin
			case (InitStage)
			0 : begin
					IC_CS = 1;
					IC_CKE = 0;
					InitStage = 1;
				end
			1 : begin
					Counter <= Counter + 1;
					if (Counter > 30000) begin // Wait > 200us
						Counter <= 0;
						InitStage = 2;
					end
				end
			2 : begin
					IC_CKE = 1;
					Counter <= Counter + 1;
					if (Counter > 10) begin
						Counter <= 0;
						InitStage = 3;
					end
				end
			3 : begin
					// PRE ALL command
					IC_CS = 0;
					IC_RAS = 0;
					IC_CAS = 1;
					IC_WE = 1;
					IC_A[10] = 1;
					InitStage = 4;
				end
			4 : begin
					// NOP command
					IC_CS = 0;
					IC_RAS = 1;
					IC_CAS = 1;
					IC_WE = 1;
					Counter <= Counter + 1;
					if (Counter == 3) begin // Wait 30ns > 20ns (tRD)
						Counter <= 0;
						InitStage = 5;
					end
				end
			5 : begin
					// LMR command
					IC_CS = 0;
					IC_RAS = 0;
					IC_CAS = 0;
					IC_WE = 0;
					IC_BA = 2'b01;
					IC_A = 13'b0000000101001; // Extended mode register, see datasheet:57
					InitStage = 6;
				end
			6 : begin
					// NOP command
					IC_CS = 0;
					IC_RAS = 1;
					IC_CAS = 1;
					IC_WE = 1;
					Counter <= Counter + 1;
					if (Counter == 2) begin // Wait 20ns > 15ns (tMRD)
						Counter <= 0;
						InitStage = 7;
					end
				end
			7 : begin
					// LMR command
					IC_CS = 0;
					IC_RAS = 0;
					IC_CAS = 0;
					IC_WE = 0;
					IC_BA = 2'b00;
					IC_A = 13'b0000100000001; // Enable DLL, Reset DLL, see datasheet:61
					InitStage = 8;
				end
			8 : begin
					// NOP command
					IC_CS = 0;
					IC_RAS = 1;
					IC_CAS = 1;
					IC_WE = 1;
					Counter <= Counter + 1;
					if (Counter == 2) begin // Wait 20ns > 15ns (tMRD)
						Counter <= 0;
						InitStage = 9;
					end
				end
			9 : begin
					// PRE ALL command
					IC_CS = 0;
					IC_RAS = 0;
					IC_CAS = 1;
					IC_WE = 1;
					IC_A[10] = 1;
					InitStage = 10;
				end
			10 : begin
					// NOP command
					IC_CS = 0;
					IC_RAS = 1;
					IC_CAS = 1;
					IC_WE = 1;
					Counter <= Counter + 1;
					if (Counter == 3) begin // Wait 30ns > 20ns (tRD)
						Counter <= 0;
						InitStage = 11;
					end
				end
			11 : begin
					// Auto Refresh command
					IC_CS = 0;
					IC_RAS = 0;
					IC_CAS = 0;
					IC_WE = 1;
					InitStage = 12;
				end
			12 : begin
					// NOP command
					IC_CS = 0;
					IC_RAS = 1;
					IC_CAS = 1;
					IC_WE = 1;
					Counter <= Counter + 1;
					if (Counter == 8) begin // Wait 80ns > 75ns (tRFC)
						Counter <= 0;
						InitStage = 13;
					end
				end
			13 : begin
					// Auto Refresh command
					IC_CS = 0;
					IC_RAS = 0;
					IC_CAS = 0;
					IC_WE = 1;
					InitStage = 14;
				end
			14 : begin
					// NOP command
					IC_CS = 0;
					IC_RAS = 1;
					IC_CAS = 1;
					IC_WE = 1;
					Counter <= Counter + 1;
					if (Counter == 8) begin // Wait 80ns > 75ns (tRFC)
						Counter <= 0;
						InitStage = 15;
					end
				end
			15 : begin
					// LMR command
					IC_CS = 0;
					IC_RAS = 0;
					IC_CAS = 0;
					IC_WE = 0;
					IC_BA = 2'b00;
					IC_A = 13'b0000000000001; // Clear A8 bit, see datasheet:61
					InitStage = 16;
				end
			16 : begin
					// NOP command
					IC_CS = 0;
					IC_RAS = 1;
					IC_CAS = 1;
					IC_WE = 1;
					Counter <= Counter + 1;
					if (Counter == 2) begin // Wait 20ns > 15ns (tMRD)
						Counter <= 0;
						InitStage = 17;
					end
				end
			17 : begin
					Counter <= Counter + 1;
					if (Counter > 200) begin // Wait > 200 clocks
						Counter <= 0;
						InitStage = 18;
					end
				end
			18 : begin
					DevReady = 1;
				end
			endcase
		end
	end
	
endmodule
