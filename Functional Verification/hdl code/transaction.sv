`ifndef tran_DEFINE
`define tran_DEFINE
class Transaction;
 
	//  user defined Data types for request command and input data: 
	typedef logic [0:3] command;
	typedef logic [0:1] tag;
	typedef logic [0:31] data;
 
	// Randomize the request command: 
	rand command req1_cmd_in;
	rand command req2_cmd_in;
	rand command req3_cmd_in;
	rand command req4_cmd_in;
	
	// Randomize the request tag: 
	randc tag req1_tag_in;
	randc tag req2_tag_in;
	randc tag req3_tag_in;
	randc tag req4_tag_in;	
	
	// Request command can have any one of the values: 0,1,2,5,6:
	constraint reqcmd1 {req1_cmd_in inside {1,2,5,6};}
	constraint reqcmd2 {req2_cmd_in inside {1,2,5,6};}
	constraint reqcmd3 {req3_cmd_in inside {1,2,5,6};}
	constraint reqcmd4 {req4_cmd_in inside {1,2,5,6};}
	
	//command req1_cmd_in=1;
	//command req2_cmd_in=1;
	//command req3_cmd_in=1;
	//command req4_cmd_in=1;
	
	// Request tag can have any one of the values: 0,1,2,3:
	constraint reqtag_a_1 {req1_tag_in inside {0,1,2,3};}
	constraint reqtag_b_2 {req2_tag_in inside {0,1,2,3};}
	constraint reqtag_c_3 {req3_tag_in inside {0,1,2,3};}
	constraint reqtag_d_4 {req4_tag_in inside {0,1,2,3};}	
	
	// Randomize the Input Data_a and Input Data_b on all the ports  
	rand data req1_dataa_in, req1_datab_in;
	rand data req2_dataa_in, req2_datab_in;  
	rand data req3_dataa_in, req3_datab_in;
	rand data req4_dataa_in, req4_datab_in;
	
	//data req1_dataa_in=2846251534;
	//data req1_datab_in=3037645036;

	// Reset 
	bit reset = 0;
 int ALU_count=0, Shift_count=0, nop_count=0;
	


	// Function to print the data generated and randomized
	function void print_trans(string name);
   		$display ($time," : %s PORTA operation is : %d  dataa : %h datab : %h	tag: %h ALU_count: %d Shift_count: %d nop_count: %d",name, this.req1_cmd_in, this.req1_dataa_in, this.req1_datab_in, this.req1_tag_in, this.ALU_count, this.Shift_count, this.nop_count);
		$display ($time," : %s PORTB operation is : %d  dataa : %h datab : %h	tag: %h ALU_count: %d Shift_count: %d nop_count: %d",name, this.req2_cmd_in, this.req2_dataa_in, this.req2_datab_in, this.req2_tag_in, this.ALU_count, this.Shift_count, this.nop_count);
		$display ($time," : %s PORTC operation is : %d  dataa : %h datab : %h	tag: %h ALU_count: %d Shift_count: %d nop_count: %d",name, this.req3_cmd_in, this.req3_dataa_in, this.req3_datab_in, this.req3_tag_in, this.ALU_count, this.Shift_count, this.nop_count);
		$display ($time," : %s PORTD operation is : %d  dataa : %h datab : %h	tag: %h ALU_count: %d Shift_count: %d nop_count: %d",name, this.req4_cmd_in, this.req4_dataa_in, this.req4_datab_in, this.req4_tag_in, this.ALU_count, this.Shift_count, this.nop_count);
	endfunction: print_trans
 
	//function to count alu and shift operation
	function void counting_operations(req1_cmd_in,req2_cmd_in,req3_cmd_in,req4_cmd_in);		
		if (this.req1_cmd_in == 1 || this.req1_cmd_in == 2)
			this.ALU_count++;
		if (this.req2_cmd_in == 1 || this.req2_cmd_in == 2)
			this.ALU_count++;
		if (this.req3_cmd_in == 1 || this.req3_cmd_in == 2)
			this.ALU_count++;
		if (this.req4_cmd_in == 1 || this.req4_cmd_in == 2)
			this.ALU_count++;			
		if (this.req1_cmd_in == 5 || this.req1_cmd_in == 6)
			this.Shift_count++;
		if (this.req2_cmd_in == 5 || this.req2_cmd_in == 6)
			this.Shift_count++;
		if (this.req3_cmd_in == 5 || this.req3_cmd_in == 6)
			this.Shift_count++;
		if (this.req4_cmd_in == 5 || this.req4_cmd_in == 6)
			this.Shift_count++;
		if (this.req1_cmd_in == 0)
			this.nop_count++;
		if (this.req2_cmd_in == 0)
			this.nop_count++;
		if (this.req3_cmd_in == 0)
			this.nop_count++;
		if (this.req4_cmd_in == 0)
			this.nop_count++;
	$display ($time," ALU_count: %d Shift_count: %d nop_count: %d",this.ALU_count, this.Shift_count, this.nop_count);
endfunction


endclass: Transaction
`endif 

