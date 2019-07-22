// instance variables for the player

// horizontal speed
// define movement on the platform
hsp = 0;

// vertical speed
// primarily for jumps
vsp = 0;

// the amount of gravitational
// force on the player
grv = 0.3;

// the walking speed of the player
wsp = 3;

jump_distance = 7;
slide_range = 5;

// variable to store whether the player is on the platform or mid-air
on_platform = false;

// the initial state of the player
state = "normal";

input = instance_create_layer(0, 0, "Player", o_input);

// player stats
life = 1;
max_life = life;
hp = 20;
max_hp = hp;
coins = 0;
keys_needed = 3;
keys = 0;