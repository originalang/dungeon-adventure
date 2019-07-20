///@param vertical_speed

vsp = argument0;

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

y += vsp;