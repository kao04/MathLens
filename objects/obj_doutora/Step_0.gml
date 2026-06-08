// --- 1. PROCESSO DA CUTSCENE (SÓ RODA SE NÃO VENCEU O BOSS) ---
if (global.estado_jogo != 4) {
    
    // Diminui o timer da fala
    if (timer_fala > 0) timer_fala -= 1;

    // Lógica das Etapas
    if (timer_fala == 0) {
        
        // Pergunta inicial
        if (etapa_conversa == 0) {
            mensagem = "Olá, Leo. Me conte,\npor que você está aqui?";
            timer_balao = 180;
            timer_fala = 180; 
            etapa_conversa = 1;
        }
        // Resposta do Leo
        else if (etapa_conversa == 1) {
            if (instance_exists(obj_player)) {
                obj_player.mensagem = "Sou muito ruim com números...\nEu não consigo entendê-los.";
                obj_player.timer_balao = 180;
            }
            timer_fala = 180;
            etapa_conversa = 2;
        }
        // Pergunta de Matemática
        else if (etapa_conversa == 2) {
            mensagem = "Entendo... Deixe-me ver.\nQuanto é 1 + 2?";
            timer_balao = 180;
            timer_fala = 180; 
            etapa_conversa = 3;
        }
        // Abre o Pop-up (Aguardando resposta)
        else if (etapa_conversa == 3) {
            if (!instance_exists(obj_popup_doutora)) {
                instance_create_depth(x, y, -100, obj_popup_doutora);
            }
            timer_fala = -1; // Trava até o pop-up fechar
        }
        // Minigame das Maçãs (Invocado após fechar o pop-up)
        else if (etapa_conversa == 4) {
            instance_create_depth(x, y, -100, obj_minigame_macas);
            etapa_conversa = 5; // Aguardando o minigame avisar que acabou
        }
        // Resultado do Minigame (Etapa 6 é setada pelo próprio minigame)
        else if (etapa_conversa == 6) {
            mensagem = "É isso mesmo! Você não\ntem problema com lógica.\nIsso comprova a Discalculia!";
            timer_balao = 240;
            timer_fala = 240; 
            etapa_conversa = 7; 
        }
        // Entrega dos Óculos
        else if (etapa_conversa == 7) {
            mensagem = "Tome estes óculos especiais.\nEles transformarão os números\nem frutas para você entender!";
            timer_balao = 240;
            timer_fala = 240;
            etapa_conversa = 8;
        }
        // Leo Agradece
        else if (etapa_conversa == 8) {
            if (instance_exists(obj_player)) {
                obj_player.mensagem = "Uau! Muito obrigado, doutora!";
                obj_player.timer_balao = 180;
            }
            timer_fala = 180;
            etapa_conversa = 9;
        }
        // Convite para o Boss
        else if (etapa_conversa == 9) {
            mensagem = "Antes de você sair, vamos testar\nse você sabe usá-los.";
            timer_balao = 180;
            timer_fala = 180;
            etapa_conversa = 10;
        }
        // TELEPORTE GARANTIDO
        else if (etapa_conversa == 10) {
             instance_create_depth(0, 0, -999, obj_transicao_boss);
             etapa_conversa = 11; // Fim da linha
        }
    }

    // Checagem especial: Se o Pop-up sumiu, Leo responde e vai pro minigame
    if (etapa_conversa == 3 && timer_fala == -1 && !instance_exists(obj_popup_doutora)) {
        if (instance_exists(obj_player)) {
            obj_player.mensagem = "Hmmm... Acho que é " + resposta_menino + "?";
            obj_player.timer_balao = 120;
        }
        mensagem = "Hmmm, acho que entendi\no seu problema.\n\nQuero verificar uma última coisa.";
        timer_balao = 240;
        timer_fala = 240; 
        etapa_conversa = 4;
    }
}

// --- 2. LÓGICA DE VITÓRIA E ENCERRAMENTO ---
if (global.estado_jogo == 4) {
    if (timer_balao <= 0) {
        encerrando_jogo = true;
    }
}

if (encerrando_jogo == true) {
    alpha_escurecer += 0.005; // Escurece em aprox. 3 segundos
    if (alpha_escurecer >= 1) {
        game_end(); // Fecha o jogo
    }
}

// --- 3. CONTROLE DO BALÃO ---
if (timer_balao > 0) timer_balao -= 1;
else mensagem = "";