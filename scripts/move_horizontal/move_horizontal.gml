///@param horizontal_speed

hsp = argument0;

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
		
x += hsp;