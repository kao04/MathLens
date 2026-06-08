// --- APARÊNCIA ---
escala = 10; 
image_xscale = escala;
image_yscale = escala;

// --- VARIÁVEIS DE CONTROLE ---
mensagem = "";
timer_balao = 0;
encerrando_jogo = false;
alpha_escurecer = 0;

// SE VOCÊ AINDA NÃO VENCEU O BOSS (Primeira vez ou durante a consulta)
if (global.estado_jogo != 4) {
    etapa_conversa = 0;
    timer_fala = 120; // Começa a falar após 2 segundos
    global.estado_jogo = 3; // Trava o Leo na cadeira
    
    // Sorteia o número sabotado para o diálogo
    resposta_menino = string(irandom_range(0, 9));
    while (resposta_menino == "3") { // Garante que ele não sorteie o 3 (que é o certo)
        resposta_menino = string(irandom_range(0, 9));
    }
} 
// SE VOCÊ VOLTOU VITORIOSO
else {
    etapa_conversa = -1; // Desativa a cutscene inicial
    mensagem = "Parabéns, Leo!\nVocê provou que os números\nnão podem te assustar.\nVocê está pronto para o dia a dia!";
    timer_balao = 600; // 10 segundos de fala
}