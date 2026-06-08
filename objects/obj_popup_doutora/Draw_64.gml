var gw = display_get_gui_width();
var gh = display_get_gui_height();

// Fundo escuro
draw_set_color(c_black);
draw_set_alpha(0.8);
draw_rectangle(0, 0, gw, gh, false);

// Caixa central branca
draw_set_alpha(1.0);
var cx = gw / 2;
var cy = gh / 2;
draw_set_color(c_white);
draw_rectangle(cx - 150, cy - 80, cx + 150, cy + 80, false);
draw_set_color(c_black);
draw_rectangle(cx - 150, cy - 80, cx + 150, cy + 80, true);

draw_set_font(fnt_texto);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// SISTEMA DOS 3 PONTINHOS VISUAIS
var texto_exibir = "1 + 2 = ";
if (resposta_digitada == "") {
    texto_exibir += "...";
} else {
    texto_exibir += resposta_digitada;
}

draw_text(cx, cy - 20, texto_exibir);

draw_set_font(fnt_texto); // Use uma fonte menor se tiver para a instrução
draw_text(cx, cy + 40, "Digite a resposta e\npressione ENTER");

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);