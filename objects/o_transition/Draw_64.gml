if state != TRANSITIONS.NONE {
	draw_set_color(c_black);
	
	// draw the rectangle from the top of the screen to 
	// a point between the top and middle of the screen
	// the percent variable determines the position 
	draw_rectangle(0, 0, w, percent * h_half, false);
	
	// draw the rectangle from the bottom of the screen to 
	// a point between the bottom and middle of the screen
	// the percent variable determines the position 
	draw_rectangle(0, h, w, h - (percent * h_half), false);
}