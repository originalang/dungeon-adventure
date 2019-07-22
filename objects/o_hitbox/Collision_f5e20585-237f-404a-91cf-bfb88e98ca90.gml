if creator == noone or creator == other or ds_list_find_index(hit_objects, other) != -1 {
	exit;
}
audio_play_sound(sd_sword_hit_weak, 5, false);
other.hp -= damage;
ds_list_add(hit_objects, other);
other.state = "knockback";
other.knockback = knockback;