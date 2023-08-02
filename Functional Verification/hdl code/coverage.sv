package PA;
class coverage;
  logic [0:3] req1_cmd_in,req2_cmd_in,req3_cmd_in,req4_cmd_in;
  logic [0:31] req1_dataa_in, req1_datab_in, req2_dataa_in, req2_datab_in,req3_dataa_in, req3_datab_in,req4_dataa_in, req4_datab_in;
 
 covergroup covgr;
   coverpoint req1_cmd_in {bins cmd_a={1,2,5,6};}
   coverpoint req2_cmd_in {bins cmd_b={1,2,5,6};}
   coverpoint req3_cmd_in {bins cmd_c={1,2,5,6};}
   coverpoint req4_cmd_in {bins cmd_d={1,2,5,6};}
   coverpoint req1_dataa_in {bins data_a_1 = {[32'h00000000 : 32'hFFFFFFFF]};}
   coverpoint req1_datab_in {bins data_b_2 = {[32'h00000000 : 32'hFFFFFFFF]};}
   coverpoint req2_dataa_in {bins data_a_1 = {[32'h00000000 : 32'hFFFFFFFF]};}
   coverpoint req2_datab_in {bins data_b_2 = {[32'h00000000 : 32'hFFFFFFFF]};}
   coverpoint req3_dataa_in {bins data_a_1 = {[32'h00000000 : 32'hFFFFFFFF]};}
   coverpoint req3_datab_in {bins data_b_2 = {[32'h00000000 : 32'hFFFFFFFF]};}
   coverpoint req4_dataa_in {bins data_a_1 = {[32'h00000000 : 32'hFFFFFFFF]};}
   coverpoint req4_datab_in {bins data_b_2 = {[32'h00000000 : 32'hFFFFFFFF]};}
   
 endgroup 
 
  function new();
    covgr=new;
endfunction : new

function void funcov( req1_cmd_in,req2_cmd_in,req3_cmd_in,req4_cmd_in, req1_dataa_in, req1_datab_in, req2_dataa_in, req2_datab_in,req3_dataa_in, req3_datab_in,req4_dataa_in, req4_datab_in);
    $display (" Coverage");
    this.req1_cmd_in=req1_cmd_in;
    this.req2_cmd_in=req2_cmd_in;
    this.req3_cmd_in=req3_cmd_in;
    this.req4_cmd_in=req4_cmd_in;
    this.req1_dataa_in=req1_dataa_in;
    this.req1_datab_in=req1_datab_in;
    this.req2_dataa_in=req2_dataa_in;
    this.req2_datab_in=req2_datab_in;
    this.req3_dataa_in=req3_dataa_in;
    this.req3_datab_in=req3_datab_in;
    this.req4_dataa_in=req4_dataa_in;
    this.req4_datab_in=req4_datab_in;  
  covgr.sample;
 endfunction 
endclass
endpackage