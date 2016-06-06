`timescale 100ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        KSP-Labs
// Engineer:       K. Pankov
// 
// Create Date:    12:04:40 06/06/2016 
// Design Name:    DDR SDRAM Controller Module Testbanch
// Module Name:    DDR_SDRAM_Controller_TB
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
module DDR_SDRAM_Controller_TB;

  reg [12:0] IC_A;
  reg [1:0] IC_BA;
  wire [15:0] IC_DQ;
  reg IC_CK_P;
  reg IC_CK_N;
  reg IC_CKE;
  reg IC_CS;
  reg IC_LDM;
  reg IC_UDM;
  reg IC_RAS;
  reg IC_CAS;
  reg IC_WE;
  wire IC_LDQS;
  wire IC_UDQS;
  reg CLK_200MHz;
  reg WrStart;
  reg WrReady;
  reg [1:0] WrBank;
  reg [22:0] WrAddr;
  reg [15:0] WrData;
  reg RdStart;
  reg RdReady;
  reg [1:0] RdBank;
  reg [22:0] RdAddr;
  reg [15:0] RdData;
  reg DevReady;
  
  DDR_SDRAM_Controller DDR (
    .IC_A(IC_A),
    .IC_BA(IC_BA),
    .IC_DQ(IC_DQ),
    .IC_CK_P(IC_CK_P),
    .IC_CK_N(IC_CK_N),
    .IC_CKE(IC_CKE),
    .IC_CS(IC_CS),
    .IC_LDM(IC_LDM),
    .IC_UDM(IC_UDM),
    .IC_RAS(IC_RAS),
    .IC_CAS(IC_CAS),
    .IC_WE(IC_WE),
    .IC_LDQS(IC_LDQS),
    .IC_UDQS(IC_UDQS),
    .CLK_200MHz(CLK_200MHz),
    .WrStart(WrStart),
    .WrReady(WrReady),
    .WrBank(WrBank),
    .WrAddr(WrAddr),
    .WrData(WrData),
    .RdStart(RdStart),
    .RdReady(RdReady),
    .RdBank(RdBank),
    .RdAddr(RdAddr),
    .RdData(RdData),
    .DevReady(DevReady)
  );
    
  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1, DDR_SDRAM_Controller_TB);
    
    CLK_200MHz = 0;
//    clk_write = 0;
//    clk_read = 0;
//    write_enable = 0;
//    address_read = 5'h1B;
//    address_write = address_read;

    $display("Read initial data.");
//    toggle_clk_read;
//    $display("data[%0h]: %0h",
//      address_read, data_read);
    
    $display("Write new data.");
//    write_enable = 1;
//    data_write = 8'hC5;
//    toggle_clk_write;
//    write_enable = 0;
    
    $display("Read new data.");
//    toggle_clk_read;
//    $display("data[%0h]: %0h",
//      address_read, data_read);
  end
  
  always #25 CLK_200MHz = ~CLK_200MHz;
  
//  task toggle_clk;
//    begin
//      #10 CLK_200MHz = ~CLK_200MHz;
//      #10 CLK_200MHz = ~CLK_200MHz;
//    end
//  endtask

endmodule
