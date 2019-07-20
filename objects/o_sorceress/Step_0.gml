switch state {
	case "pace":
		#region Pace State
		sprite_index = s_sorceress_idle;
		
		// this function makes the sprite pace and 
		// returns the new direction based on collisions
		pace_direction = pace(pace_direction);
		
		#endregion
		break;
	
	case "attack":
		#region Attack State
		sprite_index = s_sorceress_attack;
		
		image_xscale = scale * sign(o_player.x - x);
		image_yscale = scale;
		#endregion
		break;
}