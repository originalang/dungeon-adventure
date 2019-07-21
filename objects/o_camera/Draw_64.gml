if instance_exists(o_player) {
	if o_player.life < o_player.max_life {
		for (var i = 1; i <= o_player.max_life; i++) {
			draw_sprite(s_empty_heart, -1, hud_x * i, hud_y);
		}
	}
	
	for (var i = 1; i <= o_player.life; i++) {
		if i == o_player.life and o_player.hp <= (o_player.max_hp / 2) {
			draw_sprite(s_half_heart, -1, hud_x * i, hud_y);
		} else {
			draw_sprite(s_full_heart, -1, hud_x * i, hud_y);
		}
	}
}