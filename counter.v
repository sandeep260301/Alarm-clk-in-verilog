
module counter (clk,
	        reset,
		one_minute,
		load_new_c,
		new_current_time_ms_hr,
		new_current_time_ms_min,
		new_current_time_ls_hr,
		new_current_time_ls_min,
		current_time_ms_hr,
		current_time_ms_min,
		current_time_ls_hr,
		current_time_ls_min);
		
input clk,reset,one_minute,load_new_c;
output reg [3:0] current_time_ms_hr,
		current_time_ms_min,
		current_time_ls_hr,
		current_time_ls_min;
input [3:0] new_current_time_ms_hr,
		new_current_time_ms_min,
		new_current_time_ls_hr,
		new_current_time_ls_min;

always @(posedge clk or posedge reset )
begin
if(reset)
begin
current_time_ms_hr<=0;
		current_time_ms_min<=0;
		current_time_ls_hr<=0;
		current_time_ls_min<=0;
end
else if(load_new_c)
begin
current_time_ms_hr<=new_current_time_ms_hr;
		current_time_ms_min<=new_current_time_ms_min;
		current_time_ls_hr<=new_current_time_ls_hr;
		current_time_ls_min<=new_current_time_ls_min;
end
else if(one_minute)
begin
if(current_time_ms_hr==4'h2 &&
		current_time_ms_min==4'h5 &&
		current_time_ls_hr==4'h3 &&
		current_time_ls_min==4'h9)
		begin
		current_time_ms_hr<=0;
		current_time_ms_min<=0;
		current_time_ls_hr<=0;
		current_time_ls_min<=0;
		end
else if (current_time_ms_min==4'h5 &&
		current_time_ls_hr==4'h9 &&
		current_time_ls_min==4'h9)	
		begin
		current_time_ms_hr<=current_time_ms_hr+1;
		current_time_ms_min<=0;
		current_time_ls_hr<=0;
		current_time_ls_min<=0;
		end	
else if (current_time_ms_min==4'h5 &&
		current_time_ls_min==4'h9)	
		begin
		current_time_ms_min<=0;
		current_time_ls_hr<=current_time_ls_hr+1;
		current_time_ls_min<=0;
		end		
else if(current_time_ls_min==4'h9)
begin
current_time_ls_min<=0;
current_time_ms_min<=current_time_ms_min+1;
end
else
begin
current_time_ls_min <= current_time_ls_min + 1'b1;
end
end
end
endmodule


