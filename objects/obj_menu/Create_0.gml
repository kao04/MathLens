// Opções do menu
menu_principal = ["Jogar", "Configurações", "Sair"];
menu_config = ["Tela Cheia: ", "Exibir FPS: ", "Voltar"];

menu_atual = 0; // 0 = Principal, 1 = Configurações
selecao = 0;    // Qual botão está selecionado

// Cria as variáveis globais de configuração (já ativando o sistema de tela cheia se for true)
global.tela_cheia = window_get_fullscreen();
global.mostrar_fps = false;