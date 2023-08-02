`ifndef CALC1_INTER
`define CALC1_INTER

// class interface: 
interface calc_inter(input bit c_clk,a_clk,b_clk);
	// Inputs and Outputs of the DUT: 
	logic [0:3]  req1_cmd_in,req2_cmd_in,req3_cmd_in,req4_cmd_in;
	logic [0:1]  req1_tag_in,req2_tag_in,req3_tag_in,req4_tag_in;
	logic [0:31] req1_dataa_in,req2_dataa_in,req3_dataa_in,req4_dataa_in;
	bit [0:31] out_data1,out_data2,out_data3,out_data4;
	bit [0:1]  out_resp1,out_resp2,out_resp3,out_resp4;
	bit [0:1]  out_tag1,out_tag2,out_tag3,out_tag4;
	logic reset;
	reg	scan_in;
	reg scan_out;

	// Clocking block - Driver: 
	clocking driver_cb @(negedge c_clk);
		// Input to DUT from driver- Request command:
		output req1_cmd_in;
		output req2_cmd_in;
		output req3_cmd_in;
		output req4_cmd_in;
		// Input to DUT from driver- Data: 
		output req1_dataa_in;
		output req2_dataa_in;
		output req3_dataa_in;
		output req4_dataa_in;
		// Input to DUT from Driver- Input Tag:
		output req1_tag_in;
		output req2_tag_in;
		output req3_tag_in;
		output req4_tag_in;
		// Input to DUT from driver- Reset: 
		output reset;
	endclocking

	// Clocking block - Monitor:
	clocking monitor_cb @(negedge c_clk);
		// Output from DUT to Monitor- Output Response:
		input out_resp1;
		input out_resp2;
		input out_resp3;
		input out_resp4;
		// Output from DUT to Monitor- Output Data:
		input out_data1;
		input out_data2;
		input out_data3;
		input out_data4;
		// Output from DUT to Monitor - Output Tag:
		input out_tag1;
		input out_tag2;
		input out_tag3;
		input out_tag4;
	endclocking

	// Modports for driver, monitor and Driver: 
	modport Master1 (clocking driver_cb);     //driver
	modport Master2 (clocking monitor_cb);   //monitor
	modport Slave (input req1_cmd_in,req2_cmd_in,req3_cmd_in,req4_cmd_in,req1_dataa_in,req2_dataa_in,req3_dataa_in,req4_dataa_in,req1_tag_in,req2_tag_in,req3_tag_in,req4_tag_in,reset, a_clk, b_clk, c_clk, scan_in,
             output out_resp1,out_resp2,out_resp3,out_resp4,out_data1,out_data2,out_data3,out_data4,out_tag1,out_tag2,out_tag3,out_tag4,scan_out);  //DUT


endinterface
`endif
