// 1. Desenha o próprio personagem
draw_self();

// 2. Sistema de balão de fala do Player
if (timer_balao > 0 && mensagem != "") {
    draw_set_font(fnt_texto);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    var largura = string_width(mensagem);
    var altura = string_height(mensagem);
    var margem = 15; 
    
    var centro_x = x;
    var centro_y = y - 70 - (altura / 2); // Fica em cima da cabeça dele
    
    var x1 = centro_x - (largura / 2) - margem;
    var y1 = centro_y - (altura / 2) - margem;
    var x2 = centro_x + (largura / 2) + margem;
    var y2 = centro_y + (altura / 2) + margem;
    
    draw_sprite_stretched(spr_balaodefala, 0, x1, y1, x2 - x1, y2 - y1);
    
    draw_set_color(c_black);
    draw_text(centro_x, centro_y, mensagem);
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
}

if (timer_balao > 0) timer_balao -= 1; else mensagem = "";