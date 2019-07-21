menu_x = (menu_x_target - menu_x) / menu_speed;

if menu_control {
	if keyboard_check_pressed(vk_up) {
		selected++;
		if selected >= number_of_items selected = 0;
	}
	
	if keyboard_check_pressed(vk_down) {
		selected--;
		if selected < 0 selected = number_of_items - 1;
	}
	
	if keyboard_check_pressed(vk_enter) {
		selected--;
		if selected < 0 selected = number_of_items - 1;
	}
}