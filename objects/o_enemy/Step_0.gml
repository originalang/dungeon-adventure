if not instance_exists(o_player) {
	state = "normal";
	exit;
}

switch state {
	case "normal":
		#region Normal State
		//sprite_index = s_heavy_bandit_idle;
		
		// make the enemy stand on floor
		vsp += grv;
		apply_gravity(vsp);
		
		if distance_to_object(o_player) <= chase_range and x_distance_to_player() != 0 {
			if y_distance_to_player() < chase_y_dist state = "chase";
		}
		#endregion
		break;
		
	case "chase":
		#region Chase State
		//sprite_index = s_heavy_bandit_run;
		
		// make the enemy stand on floor
		vsp += grv;
		apply_gravity(vsp);
		
		// calculate direction and speed
		// make the enemy move and collide with the room accordingly
		var dir = sign(x - o_player.x);
		image_xscale = dir == 0 ? 1 : dir;
		hsp = chase_speed * -dir;
		move_horizontal(hsp);
		
		if distance_to_object(o_player) > chase_range or x_distance_to_player() == 0 {
			state = "normal";
		}
		
		if distance_to_object(o_player) < attack_range {
			state = "attack";
		}
		#endregion
		break;
		
	case "attack":
		#region Attack State
		//sprite_index = s_heavy_bandit_attack;
		
		if distance_to_object(o_player) > attack_range {
			state = "chase";
		}
		
		if abs(x - o_player.x) == 0 {
			state = "normal";
		}
		#endregion
		break;
		
	case "knockback":
		#region Knockback State
		x += lerp(knockback * image_xscale, 0, 0.2);
		
		if animation_end() {
			state = "normal";
		}		
		#endregion
		break;
		
	default:
		show_debug_message("The state " + state + " does not exist");
		state = "normal";
		break;
}