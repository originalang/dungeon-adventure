// get the width of the display
w = display_get_gui_width();

// get height of the display
h = display_get_gui_height();

// calculate half the height to assist with sliding transition
h_half = h / 2;

// setup modes as a global variable to enable ease of refering to modes
enum TRANSITIONS {
	NONE,
	NEXT,
	PREVIOUS,
	GOTO,
	RESTART,
	START
}

// set default transition state
state = TRANSITIONS.START;

// this determines the point till which the
// transition rectangle should be drawn
percent = 1;

// the maximum percentage which determines the amount of
// overlap before transitioning out
max_percent = 1.2;

// the target room of the trasition
// default is the current room
// the rrom is only changed if the NEXT or GOTO transition states are called
target = room;