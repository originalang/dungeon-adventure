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
		
		if animation_hit_frame(4) {
			create_hitbox(x, y, self, s_heavy_bandit_attack_damage, 4, 4, 2, image_xscale);
		}
		break;
}