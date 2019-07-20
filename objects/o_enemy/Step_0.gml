switch state {
	case "normal":
		#region Normal State
		sprite_index = s_heavy_bandit_idle;
		
		if distance_to_object(o_player) <= attack_range {
			state = "chase";
		}
		#endregion
		break;
		
	case "chase":
		#region Chase State
		sprite_index = s_heavy_bandit_run;
		
		if distance_to_object(o_player) > attack_range {
			state = "normal";
		}
		#endregion
		break;
}