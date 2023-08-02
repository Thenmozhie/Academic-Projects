------------TAP CONTROLLER------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tap_controller is
  Port (
        tms, rst, clk: in std_logic;
        sel, dr_clk, ir_clk, dr_capture, dr_shift, dr_update: out std_logic;
        ir_shift, ir_update,ir_capture : out std_logic
   );
end tap_controller;


architecture structural of tap_controller is
type state_type is (tl_reset,rt_idle, sel_dr_scan, cap_dr, shift_dr,exit1_dr, pau_dr,exit2_dr, update_dr, sel_ir_scan, cap_ir, shift_ir,exit1_ir, pau_ir,exit2_ir, update_ir);
signal current_state, next_state: state_type;
constant clk_period: time :=10ns;

signal clk_ir,cld_dr: std_logic;


begin
  


process
    begin
        clk_ir <= '0';
        wait for clk_period/2;
        clk_ir <= '1';
        wait for clk_period/2; 
    end process;  
process
    begin
        cld_dr <= '1';
        wait for clk_period/2;
        cld_dr <= '0';
        wait for clk_period/2; 
    end process;  
  
  
process (clk, rst)
begin
    if (rst ='1') then
        current_state <=tl_reset;
    elsif (clk'event and clk ='0')then
        current_state <= next_state;    
   end if;
   end process;
   
process(current_state,tms,clk_ir,cld_dr)
begin
   next_state <= current_state;  -- Defualt value
   --tl_reset_on <= '0';
   --dr_capture<='0';
   --dr_shift<='0'; 
   --dr_update <='0';
   --ir_capture <= '0'; 
   --ir_shift<='0'; 
   --ir_update <='0';
   --sel <='0';
	--dr_clk <='0';
	--ir_clk <='0';
   
     case current_state is
        when tl_reset => 
            --tl_reset_on <= '1';  -- tl_reset
            if (tms ='0')then 
                next_state <= rt_idle;
      else 
        next_state <= tl_reset;
           
             end if;
        when rt_idle =>
            if (tms ='1') then
                next_state <= sel_dr_scan;
      else
        next_state <= rt_idle;
           
            end if;
        when sel_dr_scan => 
			sel <='0';
            if (tms= '1') then
                next_state <= sel_ir_scan;
            else
                next_state <= cap_dr;
            end if;
        when sel_ir_scan => 
			sel <='1';
            if (tms ='1') then 
                next_state <= tl_reset;
            else
                next_state <= cap_ir;
            end if;  


		when cap_dr =>
		
            --dr_clk <= '1' and clk;
			dr_clk <= clk_ir;
			--wait for clk_period/10;
			--dr_clk <= '1';
			
			dr_capture <= '1';
			--dr_shift<='0';----------------out of curiocity-----
			                 -----------------out of curiocity-----
			sel <='0';
            if (tms ='1') then 
                next_state <= exit1_dr;
            else
                next_state <= shift_dr;
            end if;
                   
        when shift_dr =>
            dr_shift <= '1';
			
			
			dr_clk <= clk_ir;
			--wait for clk_period/10;
			--dr_clk <= '1';
			
			
			
			sel <='0';
            if(tms ='1') then 
                next_state <= exit1_dr;
            else
                next_state <= shift_dr;
            end if;
        when exit1_dr =>
			sel <='0';
            if (tms='1') then 
        next_state <= update_dr;
            else
                next_state <= pau_dr;
            end if;
        when pau_dr =>
			sel <='0';
            if (tms ='1') then 
                next_state <= exit2_dr;
            else
        next_state <= pau_dr;
            end if;
        when exit2_dr =>
			sel <='0';
            if (tms ='1') then 
                next_state <= update_dr;
            else 
                next_state <= shift_dr;
            end if;
		when update_dr =>
		
            --dr_update <= '1' and clk;
			dr_update <= cld_dr;
			----wait for clk_period/2;
			----dr_update <= '0';
			
			
			
			sel <='0';
            if (tms ='1') then 
                next_state <= sel_dr_scan;
            else
                next_state <= rt_idle;
            end if;  	
		when cap_ir => 
            ir_capture <= '1';
			--ir_shift<='0';   ----------------out of curiocity----------
			                     ----------------out of curiocity----------
			
			ir_clk <= clk_ir;
			
			--ir_clk <= '0';
			--wait for clk_period/10;
			--ir_clk <= '1';
			
			
			sel <='1';
            if (tms ='1') then
                next_state <= exit1_ir;
            else
                next_state <= shift_ir;
            end if;
		when shift_ir => 
			sel <='1';
			
			ir_clk <= clk_ir; ------------------------
			--ir_update <= cld_dr;
			
            ir_shift <= '1';
            if(tms='1') then 
                next_state <= exit1_ir;
            else 
			next_state <= shift_ir;
            end if;
		when exit1_ir =>
		  --ir_update <= clk_ir;
			sel <='1';
            if(tms ='1') then 
                next_state <= update_ir;
            else 
                next_state <= pau_ir;
            end if ;
		when pau_ir => 
			sel <='1';
            if(tms ='1') then 
                next_state <= exit2_ir;
			else 
                next_state <= pau_ir;
           end if;                           
		when exit2_ir =>
			sel <='1';
			--ir_update <= cld_dr;
			if (tms='1') then 
            next_state <= update_ir;
			else
            next_state <= shift_ir;
			end if;
		when update_ir =>
			sel <='1';
			
			---ir_update <= '1' and clk;
			ir_update <= cld_dr;
			----wait for clk_period/2;
			-----ir_update <= '0';
            
			
			if(tms ='1') then 
                next_state <= sel_dr_scan;
            else 
                next_state <= rt_idle;
            end if;

                             
        end case;
        end process;
end structural;
