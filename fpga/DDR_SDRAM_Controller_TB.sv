// Testbench
module DDR_SDRAM_Controller_TB;

  reg [12:0] IC_A;
  reg [1:0] IC_BA;
  reg [15:0] IC_DQ;
  reg IC_CK_P;
  reg IC_CK_N;
  reg IC_CKE;
  reg IC_CS;
  reg IC_LDM;
  reg IC_UDM;
  reg IC_RAS;
  reg IC_CAS;
  reg IC_WE;
  reg IC_LDQS;
  reg IC_UDQS;
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
  
  // Instantiate design under test
  // D_WIDTH = 8
  // A_WIDTH = 5
  // A_MAX = 2^A_WIDTH = 32
  
  DDR_SDRAM_Controller DDR (
    .IC_A(),
	.IC_BA(),
	.IC_DQ(),
	.IC_CK_P(),
	.IC_CK_N(),
	.IC_CKE(),
	.IC_CS(),
	.IC_LDM(),
	.IC_UDM(),
	.IC_RAS(),
	.IC_CAS(),
	.IC_WE(),
	.IC_LDQS(),
	.IC_UDQS(),
	.CLK_200MHz(),
	.WrStart(),
	.WrReady(),
	.WrBank(),
	.WrAddr(),
	.WrData(),
	.RdStart(),
	.RdReady(),
	.RdBank(),
	.RdAddr(),
	.RdData(),
    .DevReady()
    );
  
  );
    
  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1, test);
    
    clk_write = 0;
    clk_read = 0;
    write_enable = 0;
    address_read = 5'h1B;
    address_write = address_read;

    $display("Read initial data.");
    toggle_clk_read;
    $display("data[%0h]: %0h",
      address_read, data_read);
    
    $display("Write new data.");
    write_enable = 1;
    data_write = 8'hC5;
    toggle_clk_write;
    write_enable = 0;
    
    $display("Read new data.");
    toggle_clk_read;
    $display("data[%0h]: %0h",
      address_read, data_read);
  end
  
  task toggle_clk_write;
    begin
      #10 clk_write = ~clk_write;
      #10 clk_write = ~clk_write;
    end
  endtask

  task toggle_clk_read;
    begin
      #10 clk_read = ~clk_read;
      #10 clk_read = ~clk_read;
    end
  endtask

endmodule
