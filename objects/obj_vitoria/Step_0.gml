timer -= 1;
if (timer <= 0) {
    global.estado_jogo = 4; // O Estado 3 é a Vitória!
    room_goto(rm_consultorio); // Volta pra Doutora
}