var gw = display_get_gui_width();
var gh = display_get_gui_height();

// Faz a tela preta sumir suavemente no último segundo
var transparencia = min(1, timer / 60); 

draw_set_alpha(transparencia);
draw_set_color(c_black);
draw_rectangle(0, 0, gw, gh, false);

draw_set_color(c_white);
draw_set_font(fnt_texto);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Texto grande no meio da tela
draw_text_transformed(gw / 2, gh / 2 - 40, "CHECKPOINT ATIVO", 1.5, 1.5, 0);
draw_text(gw / 2, gh / 2 + 20, "Você foi teleportado para o Grande Boss!");

draw_set_alpha(1); // Reseta a transparência
draw_set_halign(fa_left);
draw_set_valign(fa_top);