var gw = display_get_gui_width();
var gh = display_get_gui_height();
var cx = gw / 2;
var cy = gh / 2;

draw_set_font(fnt_texto);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Título do Jogo
draw_set_color(c_yellow);
draw_text(cx, cy - 120, "A PROVA FINAL: DISCALCULIA"); // Troque para o nome que quiser!

// Desenha os botões
var lista_atual = (menu_atual == 0) ? menu_principal : menu_config;

for (var i = 0; i < array_length(lista_atual); i++) {
    var texto_botao = lista_atual[i];
    
    // Se estiver no menu de config, adiciona o "SIM/NÃO" dinamicamente no texto!
    if (menu_atual == 1) {
        if (i == 0) texto_botao += global.tela_cheia ? "SIM" : "NÃO";
        if (i == 1) texto_botao += global.mostrar_fps ? "SIM" : "NÃO";
    }
    
    // Pinta de verde e coloca setinhas no botão que estiver selecionado
    if (i == selecao) {
        draw_set_color(c_lime);
        texto_botao = "> " + texto_botao + " <";
    } else {
        draw_set_color(c_white);
    }
    
    // Desenha as opções uma embaixo da outra
    draw_text(cx, cy + (i * 40), texto_botao);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);