// O JOGADOR ENVIOU A RESPOSTA
if (keyboard_check_pressed(vk_enter)) {
    var quantidade_certa = 0;
    
    // Conta quantas caixas estão ocupadas com uma maçã
    with (obj_caixa_alvo) {
        if (ocupada == true) quantidade_certa += 1;
    }
    
    if (quantidade_certa == 3) {
    // ACERTOU!
    with (obj_caixa_alvo) instance_destroy();
    with (obj_maca_arrastavel) instance_destroy();
    
    // Avisa a doutora e FORÇA o timer de fala a começar
    if (instance_exists(obj_doutora)) {
        obj_doutora.etapa_conversa = 6;
        obj_doutora.timer_fala = 1; // Colocamos 1 para que, no próximo frame, ela já processe a etapa 6
    }
    
    instance_destroy(); 
} else {
        // ERROU! A doutora avisa para tentar de novo
        erro_texto = "Doutora: Você errou, tente de novo!";
        timer_erro = 180; // Fica na tela por 3 segundos
    }
}