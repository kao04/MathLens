// --- INVENTÁRIO E HUD ---
macas_coletadas = 0;
bananas_coletadas = 0;
hud_alpha = 0; // A variável que estava faltando e causou o erro!

// --- SISTEMA DE FALA ---
mensagem = "";
timer_balao = 0;

// --- ESCALA DO PERSONAGEM ---
escala = 3;
image_xscale = escala;
image_yscale = escala;

// --- CONFIGURAÇÕES DE SALA E CUTSCENE ---
global.porta_aberta = false; // Tranca a porta do mercado por padrão

// Se estivermos no mercado, roda a cutscene com o pai
if (room == Room1) {
    global.estado_jogo = 0; 
    cutscene_timer = 120;
} 
// Se estivermos no consultório, deixa o controle livre 
// (A Doutora vai assumir e travar o jogador no próprio código dela)
else {
    global.estado_jogo = 2; 
}

// --- STATUS DE COMBATE DO LEO ---
vida_maxima = 5; // O Leo aguenta 5 pancadas
vida = vida_maxima;
tempo_invencivel = 0; // Tempo de proteção após tomar um dano

// --- SISTEMA DE TIRO E INVENTÁRIO ---
cooldown_tiro = 0; 

// --- SISTEMA DE MOVIMENTAÇÃO ---
// ATENÇÃO: Substitua o número de velocidade que você usa no seu código de andar por esta variável!
velocidade_base = 4; // Velocidade normal
velocidade_atual = velocidade_base;