switch state {
	case "closed":
		sprite_index = s_chest_closed;
		break;
		
	case "try":
		sprite_index = s_chest_try;
		
		if animation_end() {
			state = "closed";
		}
		break;
		
	case "opened":
		sprite_index = s_chest_open;
		
		if animation_end() {
			image_speed = 0;
			var game_over = instance_create_layer(0, 0, "Player", o_game_over);
			game_over.txt = "YOU WON!!";
		}
		break;
}