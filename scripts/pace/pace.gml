///@param x_displacement

var pace_direction = argument0;

if place_meeting(x + pace_direction, y, o_wall) {
	pace_direction *= -1;
} else {
	x += pace_direction;
}

return pace_direction;