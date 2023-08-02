`ifndef DUT_AA
`define DUT_AA
class dut_out_ALL; 
    bit [0:1] out_resp1;
    bit [0:1] out_tag1;
    bit [0:31] out_data1;
	 
	 bit [0:1] out_resp2;
    bit [0:1] out_tag2;
    bit [0:31] out_data2;
	
	bit [0:1] out_resp3;
    bit [0:1] out_tag3;
    bit [0:31] out_data3;
	
	bit [0:1] out_resp4;
    bit [0:1] out_tag4;
    bit [0:31] out_data4;
     
	function void print_responseA(string DUT_A);
		$display ("\n",$time," : %s PORTA response : %h  out-data1 : %h out-tag1 : %h",DUT_A, this.out_resp1, this.out_data1, this.out_tag1);
		$display ("\n",$time," : %s PORTB response : %h  out-data1 : %h out-tag1 : %h",DUT_A, this.out_resp2, this.out_data2, this.out_tag2);
		$display ("\n",$time," : %s PORTC response : %h  out-data1 : %h out-tag1 : %h",DUT_A, this.out_resp3, this.out_data3, this.out_tag3);
		$display ("\n",$time," : %s PORTD response : %h  out-data1 : %h out-tag1 : %h",DUT_A, this.out_resp4, this.out_data4, this.out_tag4);

endfunction 

 endclass
`endif 