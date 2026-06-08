// Evento de Colisão no obj_player com obj_tiro_boss (ou obj_minion_boss)
if (global.modo_deus) {
    with (other) {
        instance_destroy();
    }
    exit;
}
if (tempo_invencivel <= 0) {
    vida -= 1;
    tempo_invencivel = 60; // 1 segundo de invencibilidade
    
    // Calcula direção do empurrão
    var direcao_impacto = point_direction(other.x, other.y, x, y);
    x += lengthdir_x(20, direcao_impacto);
    y += lengthdir_y(20, direcao_impacto);
    
    // --- ESTA É A LINHA QUE ESTAVA FALTANDO ---
    with (other) {
        instance_destroy(); 
    }
    
    // Se a vida zerar, Game Over
    if (vida <= 0) {
        instance_create_depth(0, 0, -9999, obj_gameover);
        instance_destroy();
    }
}