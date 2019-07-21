if state != TRANSITIONS.NONE {
	if state == TRANSITIONS.START {
		// reduce the percent by 1/10 each frame
		percent = max(0, percent - max((percent / 10), 0.005));
	} else {
		percent = min(max_percent, percent + max(((max_percent - percent) / 10), 0.005));
	}
	
	// if the transition draw has completed
	if percent == max_percent or percent == 0 {
		// perform transition event based on state and paramaters
		switch state {
			case TRANSITIONS.START:
				state = TRANSITIONS.NONE
				break;
			
			case TRANSITIONS.RESTART:
				game_restart();
				break;
				
			case TRANSITIONS.NEXT:
				state = TRANSITIONS.START;
				room_goto_next();
				break;
			
			case TRANSITIONS.PREVIOUS:
				state = TRANSITIONS.START;
				room_goto_previous();
				break;
			
			case TRANSITIONS.GOTO:
				state = TRANSITIONS.START;
				room_goto(target);
				break;
		}
	}
}