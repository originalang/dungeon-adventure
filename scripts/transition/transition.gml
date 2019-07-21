///@param transition_state
///@param target_room

// in context of the transition object
with o_transition {
	// set the transition object's state to the given state
	state = argument[0];
	
	// if a target is provided (for instance, if it is a GOTO transition)
	// set the transition object's target to the provided target
	if argument_count > 1 target = argument[1];
}