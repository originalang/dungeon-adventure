event_inherited()

switch state {
	case "normal":
		sprite_index = s_heavy_bandit_idle;
		break;
		
	case "chase":
		sprite_index = s_heavy_bandit_run;
		break;
		
	case "attack":
		sprite_index = s_heavy_bandit_attack;
		break;
}