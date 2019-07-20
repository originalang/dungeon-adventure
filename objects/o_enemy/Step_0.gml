switch state {
	case "normal":
		#region Normal State
		sprite_index = s_heavy_bandit_idle;
		
		// make the enemy stand on floor
		vsp += grv;
		apply_gravity(vsp);
		
		if distance_to_object(o_player) <= chase_range and abs(x - o_player.x) != 0 {
			state = "chase";
		}
		#endregion
		break;
		
	case "chase":
		#region Chase State
		sprite_index = s_heavy_bandit_run;
		
		// make the enemy stand on floor
		vsp += grv;
		apply_gravity(vsp);
		
		// calculate direction and speed
		// make the enemy move and collide with the room accordingly
		var dir = sign(x - o_player.x);
		image_xscale = dir == 0 ? 1 : dir;
		hsp = chase_speed * -dir;
		move_horizontal(hsp);
		
		if distance_to_object(o_player) > chase_range or abs(x - o_player.x) == 0 {
			state = "normal";
		}
		
		if distance_to_object(o_player) < attack_range {
			state = "attack";
		}
		#endregion
		break;
		
	case "attack":
		#region Attack State
		sprite_index = s_heavy_bandit_attack;
		
		if distance_to_object(o_player) > attack_range or abs(x - o_player.x) == 0 {
			state = "chase";
		}
		#endregion
		break;
}