// --- SORTEIA A APARÊNCIA DO TIRO ---
// O GameMaker vai escolher um desses sprites aleatoriamente toda vez que a Prova atirar
sprite_index = choose(
    spr_tiro_numero_1, 
    spr_tiro_numero_2, 
    spr_tiro_numero_3, 
    spr_tiro_numero_4, 
    spr_tiro_numero_5, 
    spr_tiro_numero_6, 
    spr_tiro_numero_l, 
    spr_tiro_numero_v, 
    spr_tiro_numero_x, 
    spr_tiro_numero_y
);

// (MANTENHA O RESTO DO CÓDIGO QUE JÁ ESTAVA AQUI)
// Gira para um lado aleatório
velocidade_rotacao = choose(-10, -5, 5, 10);

// Começa indo na direção do player
if (instance_exists(obj_player)) {
    direction = point_direction(x, y, obj_player.x, obj_player.y);
}
speed = 3.5; // Velocidade do tiro inimigo

// 1. Faz o número girar
image_angle += velocidade_rotacao;

// 2. Efeito Teleguiado (Homing Missile)
// Ele vai curvando a trajetória de pouquinho em pouquinho (0.03) na direção do Leo
if (instance_exists(obj_player)) {
    var direcao_alvo = point_direction(x, y, obj_player.x, obj_player.y);
    
    // Calcula a diferença de ângulo e vira suavemente
    var diferenca = angle_difference(direcao_alvo, direction);
    direction += diferenca * 0.03; 
}


// --- DESTRUIÇÃO AUTOMÁTICA ---
tempo_vida -= 1;
if (tempo_vida <= 0) {
    instance_destroy(); // Some para não sobrecarregar a memória
}