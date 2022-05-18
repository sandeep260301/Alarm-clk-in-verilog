module aclk_lcd_driver (show_a,Show_new_time,Alarm_time,Current_time,Key,Sound,Displaytime);
input Show_new_time,show_a; 
input  [3:0] Alarm_time,Current_time,Key;
output reg Sound;
output reg [7:0] Displaytime;
reg [3:0]display_value ;
parameter ZERO   = 8'h30;
parameter ONE    = 8'h31;
parameter TWO    = 8'h32;
parameter THREE  = 8'h33;
parameter FOUR   = 8'h34;
parameter FIVE   = 8'h35;
parameter SIX    = 8'h36;
parameter SEVEN  = 8'h37;
parameter EIGHT  = 8'h38;
parameter NINE   = 8'h39;
parameter ERROR  = 8'h3A;

always @(Alarm_time or Current_time or Key or show_a or Show_new_time)
begin
if(show_a && ~Show_new_time) 
display_value = Alarm_time ;
else if(~show_a && ~Show_new_time)
display_value = Current_time ;
else if(~show_a && Show_new_time)
display_value = Key;

if(Current_time==Alarm_time)
Sound=1;
else
Sound=0;
end

always @(display_value)
begin 
    case (display_value)
          4'd0 : Displaytime = ZERO;
          4'd1 : Displaytime = ONE;
          4'd2 : Displaytime = TWO;
          4'd3 : Displaytime = THREE;
          4'd4 : Displaytime = FOUR;
          4'd5 : Displaytime = FIVE;
          4'd6 : Displaytime = SIX;
          4'd7 : Displaytime = SEVEN;
          4'd8 : Displaytime = EIGHT;
          4'd9 : Displaytime = NINE;
       default : Displaytime = ERROR;
endcase 
end
endmodule







