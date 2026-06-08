escala = 1.5; 
image_xscale = escala;
image_yscale = escala;

// --- STATUS "MODO HARD" ---
vida_maxima = 30; // Vida multiplicada por 5!
vida = vida_maxima; 
estado = "ATIRANDO"; 

// --- CÉREBRO DOS TURNOS ---
timer_tiro = 40;         // Atira mais rápido (antes era 60)
tiros_disparados = 0;  
limite_tiros = 10;       // Agora ele dá 10 tiros teleguiados por turno!

timer_descanso = 0;      // Cronômetro de quanto tempo ele fica cansado
dano_neste_turno = 0;    // Conta quantas frutas você acertou nele enquanto ele respira