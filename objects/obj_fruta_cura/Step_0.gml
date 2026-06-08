tempo_vida -= 1;
// Pisca quando estiver quase sumindo
if (tempo_vida < 60) image_alpha = (tempo_vida % 10 < 5) ? 0.5 : 1.0;
if (tempo_vida <= 0) instance_destroy();