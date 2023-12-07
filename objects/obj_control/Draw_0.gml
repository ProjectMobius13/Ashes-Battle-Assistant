/// @description Insert description here
// You can write your code in this editor

#region Variables
	var _xx = x;
	var _yy = y + 96 * instance_number(obj_fighter);
	
	_top_camera_y = camera_get_view_y(view_camera[0]);
	_camera_height = camera_get_view_height(view_camera[0]);
	_bottom_camera_y = _top_camera_y + _camera_height;
	_scroll_area_start_y = _top_camera_y + 60;
	_scroll_area_height = (_bottom_camera_y - 66) - (_top_camera_y + 60);
	_scroll_bar_height = (_camera_height / _total_region_size) * _scroll_area_height;
	_scroll_bar_relative_y = (_top_camera_y / _total_region_size) * _scroll_area_height;
	_scroll_bar_y = _scroll_area_start_y + _scroll_bar_relative_y;
	_scroll_bar_y = clamp(_scroll_bar_y, _scroll_area_start_y, _scroll_area_start_y + _scroll_area_height - _scroll_bar_height);
#endregion

#region UI Buttons
	if (_update_available) {
		_yy = _top_camera_y + _camera_height/2 - 46;
		draw_sprite_stretched(spr_box_nine_slice, GREEN, _xx, _yy, room_width-64, 92);
		
		_xx = room_width/2;
		_yy += 20;
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(font_ui);
		draw_set_color(#3BFD3B);
		draw_text(_xx, _yy, "An update is available!");
		_yy += 20;
		draw_text(_xx, _yy, "Open download link?");
		_yy += 30;
		_xx = room_width/4 + 32;
		draw_sprite_stretched_ext(spr_name_field, GREEN, _xx - string_width("Yes")/2 - 2, _yy - string_height("Yes")/2 - 2, string_width("Yes") + 4, string_height("Yes") + 4, c_white, 0.5 + _update_yes_hover);
		draw_text(_xx, _yy, "Yes");
		_xx = 3*room_width/4 - 32;
		draw_sprite_stretched_ext(spr_name_field, GREEN, _xx - string_width("Yes")/2 - 2, _yy - string_height("Yes")/2 - 2, string_width("Yes") + 4, string_height("Yes") + 4, c_white, 0.5 + _update_no_hover);
		draw_text(_xx, _yy, "No");
	} else {
		draw_sprite(spr_add_fighter_button, add_hover, room_width/2, _yy);
		
		draw_set_alpha(scroll_toggle);
			draw_sprite(spr_up_button, 6+up_hover, room_width - 32, _top_camera_y + 30);
			draw_sprite_stretched(spr_scroll_bar_nine_slice, scroll_hover, room_width - 30, _scroll_bar_y, 28, _scroll_bar_height);
			draw_sprite(spr_down_button, 6+down_hover, room_width - 32, _bottom_camera_y - 66);
		draw_set_alpha(1);
	}
#endregion