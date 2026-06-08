// Teclas de navegação
var cima = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
var baixo = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
var confirmar = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);

// Descobre qual lista de botões estamos usando agora
var lista_atual = (menu_atual == 0) ? menu_principal : menu_config;
var max_opcoes = array_length(lista_atual);

// Move a seleção para cima e para baixo
if (cima) {
    selecao -= 1;
    if (selecao < 0) selecao = max_opcoes - 1;
}
if (baixo) {
    selecao += 1;
    if (selecao >= max_opcoes) selecao = 0;
}

// Quando aperta ENTER
if (confirmar) {
    // --- SE ESTIVER NO MENU PRINCIPAL ---
    if (menu_atual == 0) {
        if (selecao == 0) room_goto(rm_intro); // JOGAR!
        else if (selecao == 1) { menu_atual = 1; selecao = 0; } // Vai pro menu Config
        else if (selecao == 2) game_end(); // Fecha o jogo
    } 
    // --- SE ESTIVER NO MENU DE CONFIGURAÇÕES ---
    else if (menu_atual == 1) {
        if (selecao == 0) {
            // Liga/Desliga Tela Cheia
            global.tela_cheia = !global.tela_cheia;
            window_set_fullscreen(global.tela_cheia);
        }
        else if (selecao == 1) {
            // Liga/Desliga exibição de FPS
            global.mostrar_fps = !global.mostrar_fps;
        }
        else if (selecao == 2) {
            // Voltar para o menu principal
            menu_atual = 0; 
            selecao = 0; 
        }
    }
}