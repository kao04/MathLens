// --- CONTROLE DO BALÃO DE FALA ---
if (timer_balao > 0) {
    timer_balao -= 1;
    
    // Fim da cutscene inicial (Libera o jogo)
    if (timer_balao <= 0 && global.estado_jogo == 1) {
        global.estado_jogo = 2; 
        mensagem = "";          
    }
    
    // Fim da explicação do médico (Pai começa a andar para a saída)
    if (timer_balao <= 0 && etapa_missao == 2) {
        etapa_missao = 3; // Etapa 3 = Indo embora
        mensagem = "";
    }
}

// --- CONTROLE DE SAÍDA (ETAPA 3) ---
// --- CONTROLE DE SAÍDA (ETAPA 3) ---
if (etapa_missao == 3) {
    // O pai começa a descer a tela 
    y += 2; 
    
    // ystart é a posição onde ele nasceu no começo do jogo (a porta).
    // Assim que ele descer e passar um pouquinho dessa porta, ele some e destranca!
    if (y > ystart + 30) {
        
        global.porta_aberta = true; // Destranca a passagem
        instance_destroy();         // Remove o pai da tela
        
    }
}

// --- SISTEMA DE ANIMAÇÃO DO PAI ---

// 1. Se o jogo acabou de começar (Cutscene)
if (global.estado_jogo == 0) {
    // Ele está a caminhar para cima a acompanhar o filho
    sprite_index = spr_paiCorendoCima;
} 
// 2. Se a etapa for 3 (A sair do mercado)
else if (etapa_missao == 3) {
    // Ele está a caminhar para baixo em direção à porta
    sprite_index = spr_paiCorendoCima_1;
} 
// 3. Em qualquer outra situação (Estado 1 ou 2)
else {
    // Ele está parado à espera dos itens ou a falar com o filho
    sprite_index = spr_paiParadoBaixo;
}

// --- ESPERANDO O JOGADOR RESPONDER O POP-UP ---
if (etapa_missao == 1 && !instance_exists(obj_popup_conta)) {
    
    // O Leo fala EXATAMENTE o número que apareceu na sabotagem da tela
    obj_player.mensagem = "Hmmm... Acho que é " + resposta_do_filho + "?";
    obj_player.timer_balao = 180;
    
    // O Pai reage preocupado
    mensagem = "Filho... a resposta é 9.\nVamos ao médico ver isso.\nA porta já está aberta.";
    timer_balao = 240;
    
    // Libera a saída da fase
    global.porta_aberta = true; 
    
    etapa_missao = 2;
}