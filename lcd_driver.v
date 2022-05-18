module lcd_driver_4 ( alarm_time_ms_hr,
                      alarm_time_ls_hr,
                      alarm_time_ms_min,
                      alarm_time_ls_min,
                      current_time_ms_hr,
                      current_time_ls_hr,
                      current_time_ms_min,
                      current_time_ls_min,
                      key_ms_hr,
                      key_ls_hr,
                      key_ms_min,
                      key_ls_min,
                      show_a,
                      show_current_time,
                      display_ms_hr,
                      display_ls_hr,
                      display_ms_min,
                      display_ls_min,
                      sound_a);
							             
input show_a,
      show_current_time;
		
input [3:0] alarm_time_ms_hr,
            alarm_time_ls_hr,
            alarm_time_ms_min,
            alarm_time_ls_min,
            current_time_ms_hr,
            current_time_ls_hr,
            current_time_ms_min,
            current_time_ls_min,
            key_ms_hr,
            key_ls_hr,
            key_ms_min,
            key_ls_min;
				
output [7:0]  display_ms_hr,
                      display_ls_hr,
                      display_ms_min,
                      display_ls_min;
							 
							
output sound_a;

wire sound_alarm1,sound_alarm2,sound_alarm3,sound_alarm4;

assign sound_a = sound_alarm1 & sound_alarm2 & sound_alarm3 & sound_alarm4;


aclk_lcd_driver MS_HR (.Alarm_time(alarm_time_ms_hr), 
                  .Current_time(current_time_ms_hr),
                  .Key(key_ms_hr),
                  .show_a(show_a),
                  .Show_new_time(show_current_time),
                  .Displaytime(display_ms_hr),
                  .Sound(sound_alarm1));
						
aclk_lcd_driver LS_HR (.Alarm_time(alarm_time_ls_hr), 
                  .Current_time(current_time_ls_hr),
                  .Key(key_ls_hr),
                  .show_a(show_a),
                  .Show_new_time(show_current_time),
                  .Displaytime(display_ls_hr),
                  .Sound(sound_alarm2));
						
aclk_lcd_driver MS_MIN (.Alarm_time(alarm_time_ms_min), 
                  .Current_time(current_time_ms_min),
                  .Key(key_ms_min),
                  .show_a(show_a),
                  .Show_new_time(show_current_time),
                  .Displaytime(display_ms_min),
                  .Sound(sound_alarm3));						
						
aclk_lcd_driver LS_MIN (.Alarm_time(alarm_time_ls_min), 
                  .Current_time(current_time_ls_min),
                  .Key(key_ls_min),
                  .show_a(show_a),
                  .Show_new_time(show_current_time),
                  .Displaytime(display_ls_min),
                  .Sound(sound_alarm4));
endmodule
