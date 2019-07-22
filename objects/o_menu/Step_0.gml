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
		menu_committed = selected;
		menu_control = false;
	}
}

if menu_committed != -1 {
	switch menu[menu_committed] {
		case "Start": default:			
			transition(TRANSITIONS.NEXT);
			break;

		case "Exit":
			game_end();
			break;
	}
}