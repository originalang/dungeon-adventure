// this variable handles the direction of movement
// the input variables return 1 or 0 depending on whether the key is pressed
// right pressed: 1 - 0 = 1 => move right
// left pressed: 0 - 1 = -1 => move left
// both pressed : 1 - 1 = 0 => do not move
var move = input.right - input.left;

// determine whether player is on the platform
if place_meeting(x, y + 1, o_wall) {
	on_platform = true;
}

switch state {
	case "normal":
		#region Move State

		// calculate horizontal movement based on the direction and walk speed
		hsp = move * wsp;

		// add gravity to the vertical speed
		vsp += grv;
		
		if on_platform and input.space {
			vsp -= jump_distance;
			on_platform = false;			
		}

		// manage horizontal collision
		if place_meeting(x + hsp, y, o_wall) {
			// continue moving towards a wall while 
			// there is still space greater than 1 px
			while not place_meeting(x + sign(hsp), y, o_wall) {
				x += sign(hsp);
			}
			// if a collision is detected, set horizontal speed to 0
			hsp = 0;
		}

		// manage horizontal collision
		if place_meeting(x, y + vsp, o_wall) {
			// continue moving towards the platform while 
			// there is still space greater than 1 px
			while not place_meeting(x, y + sign(vsp), o_wall) {
				y += sign(vsp);
			}
			// if a collision is detected, set horizontal speed to 0
			vsp = 0;
		}

		// move the player on the x axis
		x += hsp;

		// move the player on the y axis
		y += vsp;
		
		// animation
		if not on_platform {
			sprite_index = s_player_jump;
			image_speed = 0;
			if sign(vsp) > 0 {
				image_index = 1; 
			} else {
				image_index = 0;
			}			
		} else {
			image_speed = 1;			
			
			if hsp == 0 {
				sprite_index = s_player_idle;				
			} else if input.down {
				sprite_index = s_player_crouch;
			} else {
				sprite_index = s_player_run;				
			}
			
			if hsp != 0 image_xscale = sign(hsp);
		}
		
		// state changes			
		if on_platform and input.ctrl {
			state = "slide";
		}
		
		if on_platform and input.char_z {
			image_index = 0;
			state = "attack";
		}

		#endregion
		break;

	case "slide":
		#region Slide State
		
		// set sprite index to the slide animation
		sprite_index = s_player_slide;
		
		// add gravity to the vertical speed
		vsp += grv;
		
		// if the sprite is mid-air, make it fall
		if not on_platform {
			y += vsp;
		}
		
		// set the horizontal speed
		// get the direction based on the sprite's xscale
		hsp = sign(image_xscale) * 0.6;
		for (var i = 0; i < slide_range; i++) {
			if not place_meeting(x + hsp, y, o_wall) {
				x += hsp;
			}
		}		
		
		// when the animation has ended, go back to the normal state
		if animation_end() {
			state = "normal";
		}
		#endregion
		break;
		
	case "attack":
		#region Attack State
		sprite_index = s_player_down_strike;
		
		if animation_hit_frame(1) {
			create_hitbox(x, y, self, s_player_down_strike_damage, 4, 4, 1, image_xscale);
		}
		
		if input.shift {
			image_index = 0;
			state = "combo1";
		}
		
		// when the animation has ended, go back to the normal state
		if animation_end() {
			state = "normal";
		}
		#endregion
		break;
		
	case "combo1":
		#region Combo One State
		sprite_index = s_player_backhand_strike;
		
		if animation_hit_frame(2) {
			create_hitbox(x, y, self, s_player_backhand_strike_damage, 4, 4, 2, image_xscale);
		}
		
		if input.char_x {
			image_index = 0;
			state = "combo2";
		}
		
		// when the animation has ended, go back to the normal state
		if animation_end() {
			state = "normal";
		}
		#endregion
		break;
		
	case "combo2":
		#region Combo Two State
		sprite_index = s_player_combo;
		
		if animation_hit_frame(4) {
			create_hitbox(x, y, self, s_player_combo_damage1, 4, 4, 2, image_xscale);
		}
		
		if animation_hit_frame(7) {
			create_hitbox(x, y, self, s_player_combo_damage2, 4, 4, 2, image_xscale);
		}
		
		if animation_hit_frame(13) {
			create_hitbox(x, y, self, s_player_combo_damage1, 4, 4, 3, image_xscale);
		}
		
		// when the animation has ended, go back to the normal state
		if animation_end() {
			state = "normal";
		}
		#endregion
		break;
}
