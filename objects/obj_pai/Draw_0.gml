draw_self(); // Desenha o personagem do pai no mapa

// Só desenha o balão se houver tempo rolando e uma mensagem para falar
if (timer_balao > 0 && mensagem != "") {
    draw_set_font(fnt_texto);
    
    // Centraliza o alinhamento para o texto ficar bem no meio do balão
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    var largura = string_width(mensagem);
    var altura = string_height(mensagem);
    
    // Espaço em branco ao redor do texto (ajuste esse número se quiser o balão mais gordinho)
    var margem = 15; 
    
    // Calcula o ponto central do balão (50 pixels acima da cabeça do pai)
    var centro_x = x;
    var centro_y = y - 50 - (altura / 2);
    
    // Calcula os 4 cantos exatos do balão
    var x1 = centro_x - (largura / 2) - margem;
    var y1 = centro_y - (altura / 2) - margem;
    var x2 = centro_x + (largura / 2) + margem;
    var y2 = centro_y + (altura / 2) + margem;
    
    // =======================================================
    // DESENHA O SEU SPRITE DE BALÃO USANDO O NINE SLICE
    // O GameMaker estica a largura (x2 - x1) e a altura (y2 - y1)
    draw_sprite_stretched(spr_balaodefala, 0, x1, y1, x2 - x1, y2 - y1);
    // =======================================================
    
    // Escreve o texto em preto no centro exato da imagem
    draw_set_color(c_black);
    draw_text(centro_x, centro_y, mensagem);
    
    // Reset de Segurança (Impede que a cor preta ou o alinhamento vazem para o resto do jogo)
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
    draw_set_alpha(1.0);
}