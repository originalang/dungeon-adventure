// set attributes for the drawn elements
draw_set_font(f_game_over);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_color(c_black);

// draw the background
draw_set_alpha(0.4);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1.0);


// game over message
txt = "GAME OVER";
offset = 2;

draw_set_color(c_gray);
draw_text(xx + offset, yy, txt);
draw_text(xx - offset, yy, txt);
draw_text(xx, yy + offset, txt);
draw_text(xx, yy - offset, txt);
draw_set_color(c_white);
draw_text(xx, yy, txt);

draw_set_font(f_menu);
draw_text(xx, yy + 100, "press ENTER to continue");