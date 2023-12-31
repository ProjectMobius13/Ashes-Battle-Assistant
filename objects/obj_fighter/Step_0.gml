/// @description Insert description here
// You can write your code in this editor

#region Initialize Variables
	if obj_control.scroll_hover == 1
		exit;
		
	if instance_exists(obj_SPECIAL_menu)
		exit;
	
	var _xx = x;
	var _yy = y;
	
	selected_button = 0;
#endregion

#region Move and Delete Checks
	if (_move_up == 1) {
		y -= (ENTRY_HEIGHT + 4);
		_move_up = 0;
	}
	
	if (_move_down == 1) {
		y += (ENTRY_HEIGHT + 4);
		_move_down = 0;
	}
	
	if (_delete_check == 1) {
		_move_up = 1;	
		var _fighter_at_position = instance_position(x, y + ENTRY_HEIGHT + 4, obj_fighter);
		if _fighter_at_position {
			_fighter_at_position._delete_check = 1;
		}
		_delete_check = 0;
	}
#endregion

#region Button Checks
	// Current HP
	if point_in_rectangle(mouse_x, mouse_y, _xx+92, _yy+50, _xx+108, _yy+66) {
		hp_minus_hover = 1;
		selected_button = 1;
	} else {
		hp_minus_hover = 0;
	}
		
	if point_in_rectangle(mouse_x, mouse_y, _xx+128, _yy+50, _xx+144, _yy+66) {
		hp_plus_hover = 1;
		selected_button = 2;
	} else {
		hp_plus_hover = 0;
	}
		
	// Max HP
	if point_in_rectangle(mouse_x, mouse_y, _xx+92, _yy+70, _xx+108, _yy+86) {
		max_hp_minus_hover = 1;
		selected_button = 3;
	} else {
		max_hp_minus_hover = 0;
	}
		
	if point_in_rectangle(mouse_x, mouse_y, _xx+128, _yy+70, _xx+144, _yy+86) {
		max_hp_plus_hover = 1;
		selected_button = 4;
	} else {
		max_hp_plus_hover = 0;
	}
	
	#region Color Buttons
		// Colors
		// Red
		if point_in_rectangle(mouse_x, mouse_y, _xx+160, _yy+50, _xx+160+16, _yy+50+16) {
			_colors_hover[0] = 1;
			if mouse_check_button_pressed(mb_left)
				_color = RED;
		} else {
			_colors_hover[0] = 0;
		}
		
		// Orange
		if point_in_rectangle(mouse_x, mouse_y, _xx+160+20, _yy+50, _xx+160+20+16, _yy+50+16) {
			_colors_hover[1] = 1;
			if mouse_check_button_pressed(mb_left)
				_color = ORANGE;
		} else {
			_colors_hover[1] = 0;
		}
		
		// Yellow
		if point_in_rectangle(mouse_x, mouse_y, _xx+160+20*2, _yy+50, _xx+160+20*2+16, _yy+50+16) {
			_colors_hover[2] = 1;
			if mouse_check_button_pressed(mb_left)
				_color = YELLOW;
		} else {
			_colors_hover[2] = 0;
		}
		
		// Green
		if point_in_rectangle(mouse_x, mouse_y, _xx+160+20*3, _yy+50, _xx+160+20*3+16, _yy+50+16) {
			_colors_hover[3] = 1;
			if mouse_check_button_pressed(mb_left)
				_color = GREEN;
		} else {
			_colors_hover[3] = 0;
		}
		
		// Cyan
		if point_in_rectangle(mouse_x, mouse_y, _xx+160+20*3, _yy+70, _xx+160+20*3+16, _yy+70+16) {
			_colors_hover[4] = 1;
			if mouse_check_button_pressed(mb_left)
				_color = CYAN;
		} else {
			_colors_hover[4] = 0;
		}
		
		// Blue
		if point_in_rectangle(mouse_x, mouse_y, _xx+160+20*2, _yy+70, _xx+160+20*2+16, _yy+70+16) {
			_colors_hover[5] = 1;
			if mouse_check_button_pressed(mb_left)
				_color = BLUE;
		} else {
			_colors_hover[5] = 0;
		}
		
		// Purple
		if point_in_rectangle(mouse_x, mouse_y, _xx+160+20, _yy+70, _xx+160+20+16, _yy+70+16) {
			_colors_hover[6] = 1;
			if mouse_check_button_pressed(mb_left)
				_color = PURPLE;
		} else {
			_colors_hover[6] = 0;
		}
		
		// Pink
		if point_in_rectangle(mouse_x, mouse_y, _xx+160, _yy+70, _xx+160+16, _yy+70+16) {
			_colors_hover[7] = 1;
			if mouse_check_button_pressed(mb_left)
				_color = PINK;
		} else {
			_colors_hover[7] = 0;
		}
	#endregion
		
	// Copy
	if point_in_rectangle(mouse_x, mouse_y, _xx+256, _yy+28+24, _xx+288, _yy+60+24) {
		copy_hover = 1;
		selected_button = 5;
	} else {
		copy_hover = 0;
	}
		
	// Up
	if point_in_rectangle(mouse_x, mouse_y, _xx+296, _yy+28+24, _xx+328, _yy+60+24) {
		up_hover = 1;
		selected_button = 6;
	} else {
		up_hover = 0;
	}
		
	// Down
	if point_in_rectangle(mouse_x, mouse_y, _xx+336, _yy+28+24, _xx+368, _yy+60+24) {
		down_hover = 1;
		selected_button = 7;
	} else {
		down_hover = 0;
	}
		
	// Delete
	if point_in_rectangle(mouse_x, mouse_y, _xx+376, _yy+28+24, _xx+408, _yy+60+24) {
		delete_hover = 1;
		selected_button = 8;
	} else {
		delete_hover = 0;
	}
	
	// Name Field
	if point_in_rectangle(mouse_x, mouse_y, _xx+6, _yy+6, _xx+ max(string_width("A"), string_width(_name)+4), _yy+max(string_height("A"), string_height(_name)+4)) {
		name_hover = 1;
		selected_button = 9;
	} else {
		name_hover = 0;
	}
	
	// SPECIAL
	
	if point_in_rectangle(mouse_x, mouse_y, _xx+120, _yy+92, _xx+120+176, _yy+92+40) {
		special_hover = 1;
		selected_button = 10;
	} else {
		special_hover = 0;
	}
	
#endregion

#region Mouse Clicked
	if mouse_check_button_pressed(mb_left) {
		switch (selected_button) {
			case 1:
				_hp -= 1;
				_hp = clamp(_hp, 0, _total_hp);
				break;
			case 2:
				_hp += 1;
				if (_hp > _total_hp) {
					_total_hp += 1;
					_total_hp = clamp(_total_hp, 1, 20);
				}
				_hp = clamp(_hp, 0, _total_hp);
				break;
			case 3:
				_total_hp -= 1;
				if (_hp > _total_hp) {
					_hp -= 1;
					_hp = clamp(_hp, 0, _total_hp);
				} 
				_total_hp = clamp(_total_hp, 1, 20);
				_hp = clamp(_hp, 0, _total_hp);
				break;
			case 4:
				if (_hp == _total_hp)
					_hp += 1;
				_total_hp += 1;
				_total_hp = clamp(_total_hp, 1, 20);
				_hp = clamp(_hp, 0, _total_hp);
				break;
			case 5:
				if (_hp < 1)
					result_string = str_broken_heart;
				else
					result_string = str_heart;
					
				for (count = _hp; count > 0; count--) {
					result_string += str_full_bar;
				}
				
				for (count = _total_hp - _hp; count > 0; count--) {
					result_string += str_empty_bar;
				}
				
				if os_browser == browser_not_a_browser
					clipboard_set_text(result_string);
				else
					get_string("Copy your HP: ", result_string);
				break;
			case 6:
				var _fighter_at_position = instance_position(x, y - (ENTRY_HEIGHT + 4), obj_fighter);
				if _fighter_at_position {
					_move_up = 1;	
					_fighter_at_position._move_down = 1;
				}
				break;
			case 7:
				var _fighter_at_position = instance_position(x, y + (ENTRY_HEIGHT + 4), obj_fighter);
				if _fighter_at_position {
					_move_down = 1;	
					_fighter_at_position._move_up = 1;
				}
				break;
			case 8:
				instance_destroy(self);
				break;
			case 9:
				if os_browser == browser_not_a_browser {
					_text_focus = true;
					keyboard_string = _name;
				} else {
					_name = get_string("Enter your fighter's name: ", _name);
					if string_length(_name) > 30 {
						_name = string_delete(_name, 31, string_length(_name)-30);	
					}
				}
				break;
			case 10:
				instance_deactivate_all(true);
				instance_activate_object(obj_control);
				instance_activate_object(obj_background);
				instance_create_depth(camera_get_view_x(view_camera[0]) + 32, camera_get_view_y(view_camera[0]) + 32, depth, obj_SPECIAL_menu);
				break;
			default:
				if (_text_focus == true) {
				   _text_focus = false;
				}
		}	
	}
#endregion

#region Text Input
	/*------------------------------------
		Code by Odewise on r/Gamemaker
		https://www.reddit.com/r/gamemaker/comments/50sv2v/how_to_make_easy_flexible_text_input_boxes/
	------------------------------------*/
	//check if box is focused
	if (_text_focus = true)
	{
	  //if is focused, check for user hitting enter to stop input
	  if (keyboard_check_pressed(vk_enter))
	      {
	        //stop focus on player hitting enter
	           _text_focus = false;
	      }
	  //Get input up to max characters.
		if (string_length(_name)<30) {
			if keyboard_check(vk_control) && keyboard_check_pressed(ord("V")) {
				if clipboard_has_text() {
					_name = clipboard_get_text();
					clipboard_set_text("");
					if string_length(_name) > 30 {
						_name = string_delete(_name, 31, string_length(_name)-30);	
					}
				}
				keyboard_string = _name;
			} else {
				_name = keyboard_string;
			}
		}
	   /* If they entered max characters no longer get input unless
	     it is backspace, then delete the last character and set
	    the keyboard_string to the previous characters. */
	    else if (keyboard_check_pressed(vk_backspace))
	     {
	         _name = string_delete(_name,30,1);
	         keyboard_string = _name;
	     }
	}
 #endregion