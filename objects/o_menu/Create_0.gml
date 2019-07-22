// start the background music
if not audio_is_playing(sd_dungeon_explorer) {
	audio_play_sound(sd_dungeon_explorer, 9, true);
}


gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

menu_x = gui_width / 2;
menu_y = gui_height / 2 + 150;

menu_itemheight = font_get_size(f_menu);
menu_committed = -1;
menu_control = true;

menu[3] = "Start";
menu[2] = "Instructions";
menu[1] = "Credits";
menu[0] = "Exit";

number_of_items = array_length_1d(menu);
selected = 3;