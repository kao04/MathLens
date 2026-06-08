var gw = display_get_gui_width();
var gh = display_get_gui_height();
var cx = gw / 2;
var cy = gh / 2;

draw_set_color(c_black);
draw_rectangle(0, 0, gw, gh, false);

draw_set_font(fnt_texto);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Texto VOCÊ REPROVOU em Vermelho e Grande (Bold simulado pelo tamanho)
draw_set_color(c_red);
draw_text_transformed(cx, cy - 80, "VOCÊ REPROVOU", 2, 2, 0);

// Botões
var botao1 = (selecao == 0) ? "> Tentar de Novo <" : "Tentar de Novo";
var botao2 = (selecao == 1) ? "> Sair <" : "Sair";

draw_set_color((selecao == 0) ? c_lime : c_white);
draw_text(cx, cy + 20, botao1);

draw_set_color((selecao == 1) ? c_lime : c_white);
draw_text(cx, cy + 60, botao2);