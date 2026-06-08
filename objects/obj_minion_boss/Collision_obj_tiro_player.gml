if (global.modo_deus) {
    instance_destroy();
} else {
    vida -= 1;
    if (vida <= 0) {
        instance_destroy();
    }
}
with (other) {
    instance_destroy(); // Destrói o tiro do player
}
