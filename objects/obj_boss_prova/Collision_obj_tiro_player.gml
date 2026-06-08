if (global.modo_deus) {
    vida = 0;
    instance_create_depth(0, 0, -9999, obj_vitoria);
    
    // Mata o boss, os tiros dele e os minions que sobraram!
    with(obj_tiro_boss) instance_destroy();
    with(obj_minion_boss) instance_destroy();
    with(other) instance_destroy();
    instance_destroy();
    exit;
}
if (estado == "CANSADO") {
    
    vida -= 1;
    dano_neste_turno += 1;
    with (other) instance_destroy(); // Destrói sua fruta
    
    // Verifica se ele morreu
    if (vida <= 0) {
    instance_create_depth(0, 0, -9999, obj_vitoria);
    
    // Mata o boss, os tiros dele e os minions que sobraram!
    with(obj_tiro_boss) instance_destroy();
    with(obj_minion_boss) instance_destroy();
    instance_destroy(); 
} 
    // Se não morreu, mas já apanhou 5 vezes neste turno, ELE ACORDA BRAVO!
    else if (dano_neste_turno >= 5) {
        
        if (vida <= 15) { // Metade da vida
            estado = "FURIOSO";
        } else {
            estado = "ATIRANDO";
        }
        
    }
    
} else {
    // Se bater enquanto ele tem o "escudo" invisível, sua fruta só se destrói
    with (other) instance_destroy();
}