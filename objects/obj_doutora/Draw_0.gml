// Garante que o sprite da própria doutora continue aparecendo
draw_self();

// --- SISTEMA DE DESENHO DO BALÃO DA DOUTORA ---
if (timer_balao > 0 && mensagem != "") {
    // Configura a fonte e o alinhamento do texto
    draw_set_font(fnt_texto);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Calcula o tamanho exato que o balão precisa ter baseado no texto
    var largura = string_width(mensagem);
    var altura = string_height(mensagem);
    var margem = 15; 
    
    // Posiciona o balão logo acima da cabeça da doutora
    var centro_x = x;
    var centro_y = y - 70 - (altura / 2); 
    
    var x1 = centro_x - (largura / 2) - margem;
    var y1 = centro_y - (altura / 2) - margem;
    var x2 = centro_x + (largura / 2) + margem;
    var y2 = centro_y + (altura / 2) + margem;
    
    // Desenha o fundo usando o seu sprite de balão de fala
    draw_sprite_stretched(spr_balaodefala, 0, x1, y1, x2 - x1, y2 - y1);
    
    // Desenha o texto por cima do balão
    draw_set_color(c_black);
    draw_text(centro_x, centro_y, mensagem);
    
    // Reseta as configurações de desenho para não estragar o resto do jogo
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
}

// Diminui o cronômetro do balão a cada frame
if (timer_balao > 0) {
    timer_balao -= 1;
} else {
    mensagem = ""; // Limpa a mensagem quando o tempo acaba
}