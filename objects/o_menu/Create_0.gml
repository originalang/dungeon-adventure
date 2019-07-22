gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

menu_x = gui_width / 2;
menu_y = gui_height / 2;

menu_itemheight = font_get_size(f_menu);
menu_committed = -1;
menu_control = true;

menu[2] = "New Game";
menu[1] = "Continue";
menu[0] = "Exit";

number_of_items = array_length_1d(menu);
selected = 2;