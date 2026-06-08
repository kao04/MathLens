// Só desenha a missão de coletar se estiver no supermercado!
if (room == Room1) {
    
    // [TODO O SEU CÓDIGO ATUAL QUE DESENHA AS FRUTAS E O TEXTO FICA AQUI DENTRO]


if (global.estado_jogo == 2 && hud_alpha < 1) {
    hud_alpha += 0.02; 
}

// 2. Aplica a opacidade APENAS para os textos das frutas
draw_set_alpha(hud_alpha);

draw_set_font(fnt_texto);
draw_set_color(c_white); 
draw_text(20, 20, "Maçãs: " + string(macas_coletadas) + "/3");
draw_text(20, 40, "Bananas: " + string(bananas_coletadas) + "/3");

// 3. RESET SEGURO: Força o GameMaker a voltar para 100% de opacidade imediatamente!
// Isso impede que o efeito "vaze" para as paredes, para o pai ou para o seu personagem.
draw_set_alpha(1.0);

}

var gw = display_get_gui_width();
var gh = display_get_gui_height();

// ----------------------------------------------------
// HUD DA FASE 1 (MERCADO)
// ----------------------------------------------------
if (room == Room1) {
    // [SEU CÓDIGO ANTIGO DO MERCADO ESTÁ AQUI DENTRO]
} 
else if (room == rm_boss && global.estado_jogo == 2) {
    
    // 1. BARRA DO BOSS (Permanece igual)
    if (instance_exists(obj_boss_prova)) {
        var largura_barra_boss = 400;
        var boss_x1 = (gw / 2) - (largura_barra_boss / 2);
        var boss_y1 = 30;
        var boss_x2 = (gw / 2) + (largura_barra_boss / 2);
        var boss_y2 = 50;
        var porcentagem_boss = (obj_boss_prova.vida / obj_boss_prova.vida_maxima) * 100;
        draw_healthbar(boss_x1, boss_y1, boss_x2, boss_y2, porcentagem_boss, c_black, c_red, c_lime, 0, true, true);
        
        draw_set_font(fnt_texto); 
        draw_set_color(c_white);
        draw_set_halign(fa_center);
        draw_text(gw / 2, boss_y1 - 20, "O PESADELO MATEMÁTICO");
    }

    // 2. BARRA DO LEO (MAIOR E MAIS GROSSA!)
    var leo_x1 = 30;
    var leo_y1 = 30;
    var leo_x2 = 280; // Mais comprida
    var leo_y2 = 60;  // Mais grossa
    var porcentagem_leo = (vida / vida_maxima) * 100;
    draw_healthbar(leo_x1, leo_y1, leo_x2, leo_y2, porcentagem_leo, c_black, c_red, c_aqua, 0, true, true);
    
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_text(leo_x1, leo_y1 - 20, "SUA VIDA");

    // 3. INVENTÁRIO DE FRUTAS NA TELA (AGORA COM ÍCONES!)
    var inv_y = leo_y2 + 20;
    
    // Desenha as Maçãs lado a lado
    for (var i = 0; i < macas_coletadas; i++) {
        // Usa o seu sprite da maçã (ajuste o nome se for diferente)
        draw_sprite_ext(spr_maca, 0, leo_x1 + (i * 35), inv_y, 1.5, 1.5, 0, c_white, 1);
    }
    
    // Desenha as Bananas lado a lado
    for (var i = 0; i < bananas_coletadas; i++) {
        draw_sprite_ext(spr_banana, 0, leo_x1 + (i * 35), inv_y + 40, 1.5, 1.5, 0, c_white, 1);
    }
}


// --- SISTEMA DE CONFIGURAÇÃO (FPS) ---
if (global.mostrar_fps == true) {
    draw_set_color(c_yellow);
    draw_text(10, 10, "FPS: " + string(fps));
    draw_set_color(c_white);
}