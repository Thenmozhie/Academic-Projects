// Define the Monitor interface: 
`define CALC_MONITOR_IF	calc_monitor_if.monitor_cb

// Include the transaction, dut_out and interface units
`include "transaction.sv"
`include "DUTout.sv"
`include "interface.sv"

class monitor;
	bit start_signa;
	int trans_cnt = 0;
	int total_ALU_count=0, total_shift_count=0,total_nop_count=0;
	
	int ALU_count 	=0; 
	int Shift_count 	=0; 
	int nop_count	=0; 
	
	// Handle for the class dut_out
	Transaction to_dut_count;
	dut_out_ALL obj_to_DUT_ALL;

	
	virtual calc_inter.monitor calc_monitor_if;	// Virtual interface for calc_monitor
	mailbox #(Transaction) gen2mon;				  	// mailbox to send data from gen to monitor.
    mailbox #(dut_out_ALL) mon2scb_ALL;					// mailbox to send the data from the monitor to scoreboard.
  
  
	// Constructor Function: 
	function new(virtual calc_inter.monitor calc_monitor_if,mailbox #(dut_out_ALL) mon2scb_ALL,mailbox #(Transaction) gen2mon, bit start_signa = 0); 
		this.calc_monitor_if = calc_monitor_if;
		this.mon2scb_ALL = mon2scb_ALL;
		this.gen2mon   = gen2mon;
		this.start_signa = start_signa;
	endfunction : new
  
	// Main Task:
	task main(); 
		to_dut_count = new();
		obj_to_DUT_ALL= new();
		gen2mon.get(to_dut_count);
		
		total_ALU_count= to_dut_count.ALU_count;/// to keep a count on alu and shift operations
		total_shift_count= to_dut_count.Shift_count ;
		total_nop_count= to_dut_count.nop_count;
		
		this.ALU_count 	=to_dut_count.ALU_count;         ///noting down the ALU and Shift operations
		
		this.Shift_count 	=to_dut_count.Shift_count;
		
		this.nop_count	=to_dut_count.nop_count;
	
		forever begin
		
		if (total_ALU_count > 0 || total_shift_count > 0 || total_nop_count > 0)     ///indicating that there is an operation to be done
		begin 
		fork
			begin
			@(`CALC_MONITOR_IF.out_data1 or `CALC_MONITOR_IF.out_resp1 == 0 or `CALC_MONITOR_IF.out_resp1 == 1 or `CALC_MONITOR_IF.out_resp1 == 2 or `CALC_MONITOR_IF.out_resp1 == 3);
			$display("\n",$time, "Monitor Recieving data from Dut Port -A");
			obj_to_DUT_ALL.out_resp1 = `CALC_MONITOR_IF.out_resp1;
			obj_to_DUT_ALL.out_data1 = `CALC_MONITOR_IF.out_data1;
			obj_to_DUT_ALL.out_tag1 = `CALC_MONITOR_IF.out_tag1;
			$display($time," out_resp1 %h",obj_to_DUT_ALL.out_resp1);
			$display($time," out_data1 %h",obj_to_DUT_ALL.out_data1);
			$display($time," out_tag1 %h",obj_to_DUT_ALL.out_tag1);
			end
			
			begin
			@(`CALC_MONITOR_IF.out_data2 or `CALC_MONITOR_IF.out_resp2 == 0 or `CALC_MONITOR_IF.out_resp2 == 1 or `CALC_MONITOR_IF.out_resp2 == 2 or `CALC_MONITOR_IF.out_resp2 == 3);
			$display("\n",$time, " Monitor Recieving data from Dut Port -B"); 
			obj_to_DUT_ALL.out_resp2 = `CALC_MONITOR_IF.out_resp2;
			obj_to_DUT_ALL.out_data2 = `CALC_MONITOR_IF.out_data2;
			obj_to_DUT_ALL.out_tag2 = `CALC_MONITOR_IF.out_tag2;
			$display($time," out_resp2 %h",obj_to_DUT_ALL.out_resp2);
			$display($time," out_data2 %h",obj_to_DUT_ALL.out_data2);
			$display($time," out_tag2 %h",obj_to_DUT_ALL.out_tag2);
			end
			
			begin
			@(`CALC_MONITOR_IF.out_data3 or `CALC_MONITOR_IF.out_resp3 == 0 or `CALC_MONITOR_IF.out_resp3 == 1 or `CALC_MONITOR_IF.out_resp3 == 2 or `CALC_MONITOR_IF.out_resp3 == 3);
			$display("\n",$time, "Monitor Recieving data from Dut Port-C");	
			obj_to_DUT_ALL.out_resp3 = `CALC_MONITOR_IF.out_resp3;
			obj_to_DUT_ALL.out_data3 = `CALC_MONITOR_IF.out_data3;
			obj_to_DUT_ALL.out_tag3 = `CALC_MONITOR_IF.out_tag3;
			$display($time," out_resp3 %h",obj_to_DUT_ALL.out_resp3);
			$display($time," out_data3 %h",obj_to_DUT_ALL.out_data3);
			$display($time," out_tag3 %h",obj_to_DUT_ALL.out_tag3);
			end
			
			begin
			@(`CALC_MONITOR_IF.out_data4 or `CALC_MONITOR_IF.out_resp4 == 0 or `CALC_MONITOR_IF.out_resp4 == 1 or `CALC_MONITOR_IF.out_resp4 == 2 or `CALC_MONITOR_IF.out_resp4 == 3);
			$display("\n",$time, "Monitor Recieving data from Dut Port-D");
			obj_to_DUT_ALL.out_resp4 = `CALC_MONITOR_IF.out_resp4;
			obj_to_DUT_ALL.out_data4 = `CALC_MONITOR_IF.out_data4;
			obj_to_DUT_ALL.out_tag4 = `CALC_MONITOR_IF.out_tag4;
			$display($time," out_resp4 %h",obj_to_DUT_ALL.out_resp4);
			$display($time," out_data4 %h\n",obj_to_DUT_ALL.out_data4);
			$display($time," out_tag4 %h\n",obj_to_DUT_ALL.out_tag4);
			mon2scb_ALL.put(obj_to_DUT_ALL);
			end
			join
		end
					#120;			
		if (start_signa)
		  begin
			obj_to_DUT_ALL.print_responseA("monitor");
			end
		end
	endtask

endclass 
