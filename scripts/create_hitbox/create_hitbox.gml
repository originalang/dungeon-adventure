///@param x
///@param y
///@param creator
///@param sprite
///@param knockback
///@param lifespan
///@param damage
///@param xscale

var x_pos = argument0;
var y_pos = argument1;
var creator = argument2;
var sprite = argument3;
var knockback = argument4;
var lifespan = argument5;
var damage = argument6;
var xscale = argument7;

var hitbox = instance_create_layer(x_pos, y_pos, "Hitboxes", o_hitbox);

hitbox.sprite_index = sprite;
hitbox.creator =  creator;
hitbox.knockback = knockback;
hitbox.alarm[0] = lifespan;
hitbox.damage = damage;
hitbox.image_xscale = xscale;