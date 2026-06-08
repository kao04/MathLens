// Faz a fruta girar sem parar
image_angle += velocidade_rotacao;

// Destrói a fruta se ela sair da tela (para não pesar a memória do jogo)
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}