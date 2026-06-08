// Sorteia se o tiro será uma maçã ou uma banana
var sorteio = choose(0, 1);
if (sorteio == 0) {
    sprite_index = spr_maca;
} else {
    // ATENÇÃO: Coloque aqui o nome exato do seu sprite de banana!
    sprite_index = spr_banana; 
}

// Define uma velocidade de rotação aleatória (gira para a direita ou esquerda)
velocidade_rotacao = choose(-15, -10, 10, 15);

// Faz o tiro ir na direção do ponteiro do mouse
direction = point_direction(x, y, mouse_x, mouse_y);
speed = 8;