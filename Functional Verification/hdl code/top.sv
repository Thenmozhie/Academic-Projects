module top;

	parameter clock_cycle = 100; 
    bit a_clk, b_clk, c_clk;
	// for every 50 time units toggle the clock. 
	always #(clock_cycle/2) 
	begin 
		a_clk = ~a_clk;	
		b_clk = ~b_clk;
		c_clk = ~c_clk;
	end
 
	calc_inter cacul_2(a_clk, b_clk, c_clk); 	// Handle for interface 
	test t1(cacul_2);  					// Testbench program
	calc2_top   c1( cacul_2.out_data1, cacul_2.out_data2, cacul_2.out_data3, cacul_2.out_data4, cacul_2.out_resp1, cacul_2.out_resp2, cacul_2.out_resp3, cacul_2.out_resp4, cacul_2.out_tag1, cacul_2.out_tag2, cacul_2.out_tag3, cacul_2.out_tag4, cacul_2.scan_out, cacul_2.a_clk, cacul_2.b_clk, cacul_2.c_clk, cacul_2.req1_cmd_in, cacul_2.req1_dataa_in, cacul_2.req1_tag_in, cacul_2.req2_cmd_in, cacul_2.req2_dataa_in, cacul_2.req2_tag_in, cacul_2.req3_cmd_in, cacul_2.req3_dataa_in, cacul_2.req3_tag_in, cacul_2.req4_cmd_in, cacul_2.req4_dataa_in, cacul_2.req4_tag_in, cacul_2.reset, cacul_2.scan_in);
endmodule 
