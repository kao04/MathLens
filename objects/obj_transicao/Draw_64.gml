var gw = display_get_gui_width();
var gh = display_get_gui_height();

// Desenha o fundo preto
draw_set_alpha(alpha);
draw_set_color(c_black);
draw_rectangle(0, 0, gw, gh, false);

// Controle do tempo e do texto
if (timer_texto > 0) {
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fnt_texto);
    
    draw_text(gw/2, gh/2, "2 dias depois...\nConsultório da Neuropsicóloga.");
    
    timer_texto -= 1;
} else {
    // Quando o tempo acabar, a tela clareia devagar
    if (alpha > 0) {
        alpha -= 0.02;
    } else {
        instance_destroy(); // Destrói a tela preta
    }
}

// Reset de segurança
draw_set_alpha(1.0);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);