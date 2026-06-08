// --- SPAM DE MINIONS ---
// O Boss só invoca minions se NÃO estiver cansado
if (estado != "CANSADO") {
    
    // Chance de 1 em 150 a cada frame de um minion nascer do nada
    if (irandom(150) == 1) {
        
        // Sorteia uma posição um pouco afastada do boss (para não nascer dentro dele)
        var px = x + choose(random_range(-150, -80), random_range(80, 150));
        var py = y + choose(random_range(-150, -80), random_range(80, 150));
        
        // Garante que o minion não vai nascer fora das paredes da sala
        px = clamp(px, 50, room_width - 50);
        py = clamp(py, 50, room_height - 50);
        
        // Cria a miniatura!
        instance_create_depth(px, py, depth + 1, obj_minion_boss);
    }
}

// O Boss invoca frutas acidentalmente de vez em quando (chance de 1 em 80 por frame)
if (irandom(80) == 1) {
    var fx = irandom_range(150, room_width - 150);
    var fy = irandom_range(150, room_height - 150);
    instance_create_depth(fx, fy, depth, obj_fruta_cura);
}

// --- 1. CONTROLE VISUAL ---
if (estado == "CANSADO") {
    sprite_index = spr_boss_prova_atordoado;
} else {
    sprite_index = spr_boss_prova;
}

// --- 2. MÁQUINA DE ESTADOS DA IA ---

// ESTADO: ATIRANDO ou FURIOSO
if (estado == "ATIRANDO" || estado == "FURIOSO") {
    
    timer_tiro -= 1;
    
    // Dispara a rajada de números!
    if (timer_tiro <= 0) {
        instance_create_depth(x, y, depth - 1, obj_tiro_boss);
        tiros_disparados += 1;
        timer_tiro = 40; // Recarrega rápido
        
        // Fim do turno: O Boss cansa!
        if (tiros_disparados >= limite_tiros) {
            estado = "CANSADO";
            tiros_disparados = 0; 
            dano_neste_turno = 0; // Zera os acertos
            timer_descanso = 240; // Ele fica atordoado por apenas 4 segundos!
        }
    }
    
    // Movimentação da Fase 2 (Quando a vida cai pela metade)
    if (estado == "FURIOSO" && instance_exists(obj_player)) {
        move_towards_point(obj_player.x, obj_player.y, 1.8); 
    } else {
        speed = 0; // Na fase 1 fica parado
    }
} 

// ESTADO: CANSADO (Atordoado)
else if (estado == "CANSADO") {
    speed = 0; // Para de perseguir
    timer_descanso -= 1;
    
    // Se o tempo de descanso acabar, ele ACORDA SOZINHO e inicia um novo turno!
    if (timer_descanso <= 0) {
        if (vida <= 15) { // Se tiver menos da metade da vida, volta Furioso
            estado = "FURIOSO";
        } else {
            estado = "ATIRANDO";
        }
    }
}