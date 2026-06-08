// 1. Sempre persegue o jogador como um zumbi
if (instance_exists(obj_player)) {
    move_towards_point(obj_player.x, obj_player.y, 1.2); // Velocidade do minion
}

// 2. Sistema de Tiro (A cada 30 segundos)
timer_tiro -= 1;
if (timer_tiro <= 0) {
    // Atira um número teleguiado
    instance_create_depth(x, y, depth - 1, obj_tiro_boss);
    
    // Reseta o relógio para mais 30 segundos
    timer_tiro = 1800; 
}