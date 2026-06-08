// Gira para um lado aleatório
velocidade_rotacao = choose(-10, -5, 5, 10);

// Começa indo na direção do player
if (instance_exists(obj_player)) {
    direction = point_direction(x, y, obj_player.x, obj_player.y);
}
speed = 3.5; // Velocidade do tiro inimigo

// A bala vai sumir sozinha depois de 4 segundos (240 frames)
tempo_vida = 240;