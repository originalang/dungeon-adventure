event_inherited()

switch state {
	case "normal":
		sprite_index = s_light_bandit_idle;
		break;
		
	case "chase":
		sprite_index = s_light_bandit_run;
		break;
		
	case "attack":
		sprite_index = s_light_bandit_attack;
		
		if animation_hit_frame(1) {
			create_hitbox(x, y, self, s_heavy_bandit_attack_damage, 4, 4, 4, image_xscale);
		}
		break;
}