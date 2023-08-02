// Include the transaction file 
`include "transaction.sv"


import PA::coverage;
class gen;
	
	// Handle for the class transaction: 
	rand Transaction trans,trans1,trans2; 
	int trans_cnt1 = 0;
	bit start_signa;
	int max_trans_cnt;
	event ended;

	mailbox #(Transaction) gen2drv,gen2scb,gen2mon; // Mailbox to send data from generator to driver,monitor and the scoreboard. 
coverage cove;
	// Constructor: 
	function new(mailbox #(Transaction) gen2drv,mailbox #(Transaction) gen2scb,mailbox #(Transaction) gen2mon, int max_trans_cnt,
	bit start_signa = 0, int trans_cnt1 = 0);
	trans2 = new();
	cove=new();
		this.gen2drv = gen2drv;
        this.gen2scb = gen2scb;
		this.gen2mon = gen2mon;
		this.start_signa = start_signa;
		this.max_trans_cnt = max_trans_cnt;

	endfunction

	// Main Task:
	 task main();
     while(!end_test())    
     begin
     trans=re_fun();
   
			if (start_signa)
				$display($time," : generator transaction count no. %d", trans_cnt1);
			gen2drv.put(trans); 			 
      gen2scb.put(trans);     	
			gen2mon.put(trans);				
      trans.print_trans("generator to scoreboard"); 
			trans.counting_operations(trans.req1_cmd_in,trans.req2_cmd_in,trans.req3_cmd_in,trans.req4_cmd_in);
			trans_cnt1++;	
			trans.print_trans("generator");  		
    end
	-> ended;
		$display ($time," maximum transcation is %d",trans_cnt1 );
  endtask
  
  virtual function bit end_test();
		end_test = trans_cnt1>=max_trans_cnt;
	endfunction
virtual function Transaction re_fun();        ////here it is important we create a copy of the transaction function to fill it in coerage bins so that it accumulates at the same time pass the newly randomized data generated 
 Transaction trans1=new();
 if( !trans1.randomize() ) $fatal("Generator transaction randomization failed");
		// PORT-A:
		trans2.req1_cmd_in   = trans1.req1_cmd_in;
		trans2.req1_dataa_in = trans1.req1_dataa_in;
		trans2.req1_datab_in = trans1.req1_datab_in;
		trans2.req1_tag_in    = trans1.req1_tag_in;
		// PORT-B:
		trans2.req2_cmd_in = trans1.req2_cmd_in;
		trans2.req2_dataa_in = trans1.req2_dataa_in;
		trans2.req2_datab_in = trans1.req2_datab_in;
		trans2.req2_tag_in = trans1.req2_tag_in;
		// PORT-C:
		trans2.req3_cmd_in = trans1.req3_cmd_in;
		trans2.req3_dataa_in = trans1.req3_dataa_in;
		trans2.req3_datab_in = trans1.req3_datab_in;
		trans2.req3_tag_in = trans1.req3_tag_in;
		// PORT-D:
		trans2.req4_cmd_in = trans1.req4_cmd_in;
		trans2.req4_dataa_in = trans1.req4_dataa_in;
		trans2.req4_datab_in = trans1.req4_datab_in;
		trans2.req4_tag_in = trans1.req4_tag_in;
cove.funcov ( trans2.req1_cmd_in,trans2.req2_cmd_in,trans2.req3_cmd_in,trans2.req4_cmd_in, trans2.req1_dataa_in, trans2.req1_datab_in, trans2.req2_dataa_in, trans2.req2_datab_in,trans2.req3_dataa_in, trans2.req3_datab_in,trans2.req4_dataa_in, trans2.req4_datab_in);
 return trans1;
	endfunction
endclass

 