var cx = display_get_gui_width() / 2;
var cy = display_get_gui_height() / 2;

// Fundo Preto
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

// Desenha a História
draw_set_font(fnt_texto);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

draw_text(cx, cy, texto);

// Reset
draw_set_halign(fa_left);
draw_set_valign(fa_top);