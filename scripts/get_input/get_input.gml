// if the player has control of the player sprite
// set the instance variables to the appropriate key check events
// otherwise set all the variables to not receive keyboard input

//if instance_exists(o_player) {
//	if o_player.hascontrol {
		right = keyboard_check(vk_right);
		left = keyboard_check(vk_left);
		down = keyboard_check(vk_down);
		space = keyboard_check_pressed(vk_space);
		ctrl = keyboard_check_pressed(vk_control);
		shift = keyboard_check_pressed(vk_shift);

		char_z = keyboard_check_pressed(ord("Z"));
		char_x = keyboard_check_pressed(ord("X"));
//	} else {
//		right = 0;
//		left = 0;
//		down = 0;
//		space = 0;
//		ctrl = 0;
//		shift = 0;

//		char_z = 0;
//		char_x = 0;
//	}
//}