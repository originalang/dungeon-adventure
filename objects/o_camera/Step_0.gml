/// @description Update camera to follow player

// update camera focus point
if instance_exists(follow) {
	x_to = follow.x;
	y_to = follow.y;
}

// update object position
x += (x_to - x) / 25;
y += (y_to - y) / 25;

// update view
camera_set_view_pos(cam, x - view_w_half, y - view_h_half);