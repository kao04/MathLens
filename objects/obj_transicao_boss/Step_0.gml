// 1. Reduz o cronômetro se ele existir
if (timer > 0) {
    timer -= 1;
}

// 2. Só troca de sala quando o tempo acabar
if (timer <= 0) {
    room_goto(rm_boss);
    instance_destroy();
}