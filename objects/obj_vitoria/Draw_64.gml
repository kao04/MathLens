var gw = display_get_gui_width();
var gh = display_get_gui_height();

draw_set_color(c_black);
draw_set_alpha(0.8);
draw_rectangle(0, 0, gw, gh, false);

draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_lime);
draw_text_transformed(gw / 2, gh / 2, "APROVADO", 2.5, 2.5, 0);