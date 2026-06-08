// ESTADO 0: CUTSCENE DE ENTRADA (ANDANDO JUNTOS)
if (global.estado_jogo == 0) {
    y -= 2; 
    
    // Animação correndo para cima durante a cutscene
    sprite_index = spr_playerCorendoCima;
    
    if (instance_exists(obj_pai)) {
        obj_pai.y -= 2;
    }
    
    cutscene_timer -= 1;
    
    if (cutscene_timer <= 0) {
        global.estado_jogo = 1; 
        
        // Quando para de andar, muda para a animação parado virado para cima
        sprite_index = spr_playerParadoCima;
        
        if (instance_exists(obj_pai)) {
            obj_pai.mensagem = "Filho, pegue 3 maçãs\ne 3 bananas para\nmim.";
            obj_pai.timer_balao = 240; 
        }
    }
}

// ESTADO 2: GAMEPLAY LIVRE
else if (global.estado_jogo == 2 && !instance_exists(obj_popup_conta)) {

    // --- SISTEMA DE MOVIMENTAÇÃO ---
    if (global.modo_deus) {
        velocidade_atual = velocidade_base * 2.5; // Modo Deus: muito mais rápido!
    } else {
        velocidade_atual = velocidade_base * 1.2; // Velocidade normal
    }
    var vel = velocidade_atual;
    var tecla_cima = keyboard_check(vk_up) || keyboard_check(ord("W"));
    var tecla_baixo = keyboard_check(vk_down) || keyboard_check(ord("S"));
    var tecla_esquerda = keyboard_check(vk_left) || keyboard_check(ord("A"));
    var tecla_direita = keyboard_check(vk_right) || keyboard_check(ord("D"));

    var move_x = tecla_direita - tecla_esquerda;
    var move_y = tecla_baixo - tecla_cima;

    // --- SISTEMA DE ANIMAÇÃO ---
    // Prioriza a animação horizontal (lados)
    if (move_x != 0) {
        sprite_index = spr_playerCorendoLado;
        // Multiplica a direção (1 ou -1) pela escala (1.2)
        image_xscale = sign(move_x) * escala; 
    } 
    // Se não estiver indo para os lados, checa se está indo para baixo
    else if (move_y > 0) {
        sprite_index = spr_playerCorendoBaixo;
    } 
    // Checa se está indo para cima
    else if (move_y < 0) {
        sprite_index = spr_playerCorendoCima;
    } 
    // Se não estiver apertando nenhuma tecla (Parado)
    else {
        // Checa qual foi a última animação de corrida e muda para a respectiva versão parada
        if (sprite_index == spr_playerCorendoLado) {
            sprite_index = spr_playerParadoLado;
        } else if (sprite_index == spr_playerCorendoBaixo) {
            sprite_index = spr_playerParadoBaixo;
        } else if (sprite_index == spr_playerCorendoCima) {
            sprite_index = spr_playerParadoCima;
        }
    }

    // --- SISTEMA DE COLISÃO ---
    // Horizontal
    if (place_meeting(x + move_x * vel, y, [obj_parede, obj_vidro, obj_pai])) {
        while (!place_meeting(x + sign(move_x), y, [obj_parede, obj_vidro, obj_pai])) {
            x += sign(move_x);
        }
        move_x = 0; 
    }
    x += move_x * vel; 

    // Vertical
    if (place_meeting(x, y + move_y * vel, [obj_parede, obj_vidro, obj_pai])) {
        while (!place_meeting(x, y + sign(move_y), [obj_parede, obj_vidro, obj_pai])) {
            y += sign(move_y);
        }
        move_y = 0;
    }
    y += move_y * vel; 

  // --- SISTEMA DE INTERAÇÃO COM O PAI ---
    if (distance_to_object(obj_pai) <= 15 && keyboard_check_pressed(ord("E"))) {
        if (obj_pai.etapa_missao == 0) {
            if (macas_coletadas >= 3 && bananas_coletadas >= 3) {
                
                // MUDAMOS A MENSAGEM DO PAI AQUI PARA COMBINAR COM O POP-UP:
                obj_pai.mensagem = "Ótimo! Agora, vamos\ncalcular o valor total?";
                
                obj_pai.timer_balao = 180; 
                instance_create_layer(0, 0, "Instances", obj_popup_conta);
                obj_pai.etapa_missao = 1; 
            } else {
                obj_pai.mensagem = "Ainda faltam frutas,\nolhe as prateleiras!";
                obj_pai.timer_balao = 180; 
            }
        }
    }

    // --- SISTEMA DE TELEPORTE ---
    if (place_meeting(x, y, obj_teleporte)) {
        if (global.porta_aberta == true) {
            room_goto(rm_consultorio); 
        } else {
            y -= 3; 
        }
    }
}

// 1. Reduz o Cooldown do tiro
if (cooldown_tiro > 0) cooldown_tiro -= 1;

// 2. Sistema de Combate (Atirar com Cooldown)
if (room == rm_boss && global.estado_jogo == 2) {
    if (keyboard_check(vk_space) && cooldown_tiro <= 0) {
        instance_create_depth(x, y, -10, obj_tiro_player);
        
        // AUMENTAMOS O COOLDOWN: Antes era 15, agora ele demora muito mais para atirar!
        cooldown_tiro = 30; 
    }
}

// 3. Sistema de Cura (Aperte Q para comer)
if (keyboard_check_pressed(ord("Q")) && vida < vida_maxima) {
    if (macas_coletadas > 0) {
        macas_coletadas -= 1;
        vida += 1;
    } 
    else if (bananas_coletadas > 0) {
        bananas_coletadas -= 1;
        vida += 1;
    }
}

// Velocidade atualizada dinamicamente no início do Step



// Esse código vai imprimir na tela o que está acontecendo com sua invencibilidade
if (keyboard_check_pressed(vk_f1)) { // Aperte F1 durante o jogo
    show_debug_message("STATUS DA VIDA: " + string(vida));
    show_debug_message("STATUS DA INVENCIBILIDADE: " + string(tempo_invencivel));
}

// --- SISTEMA DE DANO BLINDADO (Segurança) ---
// Isso garante que o tempo_invencivel sempre funcione e nunca fique "preso"
if (tempo_invencivel > 0) {
    tempo_invencivel -= 1;
    
    // Efeito visual: piscar o jogador enquanto está invencível (opcional, mas ajuda a ver o bug)
    if (tempo_invencivel % 10 < 5) {
        image_alpha = 0.5; 
    } else {
        image_alpha = 1;
    }
} else {
    image_alpha = 1; // Garante que ele fique visível quando não está invencível
}

// Se por acaso o tempo estiver travado em um valor absurdo, força o reset
if (tempo_invencivel > 120) { 
    tempo_invencivel = 0; 
}

// --- CHEAT MODE (Aperte K para ativar/desativar) ---
if (keyboard_check_pressed(ord("K"))) {
    global.modo_deus = !global.modo_deus;
    if (global.modo_deus) {
        show_debug_message("CHEAT ATIVADO: Modo Deus Ligado!");
    } else {
        tempo_invencivel = 0;
        show_debug_message("CHEAT DESATIVADO: Modo Deus Desligado!");
    }
}