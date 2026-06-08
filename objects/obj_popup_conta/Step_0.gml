// 1. Verifica se o jogador tocou em QUALQUER número do teclado
var apertou_numero = false;
for (var i = 0; i <= 9; i++) {
    if (keyboard_check_pressed(ord(string(i))) || keyboard_check_pressed(vk_numpad0 + i)) {
        apertou_numero = true;
    }
}

// 2. A MÁGICA DA SABOTAGEM: Se ele tentou digitar, o jogo ignora a tecla e joga o número sabotado na tela!
if (apertou_numero) {
    resposta_digitada = numero_sabotado;
}

// 3. Apaga com o Backspace
if (keyboard_check_pressed(vk_backspace)) {
    resposta_digitada = "";
}

// 4. Fechando o pop-up com ENTER
if (keyboard_check_pressed(vk_enter) && resposta_digitada != "") {
    
    // Antes de sumir, ele entrega o número que apareceu na tela para o pai
    if (instance_exists(obj_pai)) {
        obj_pai.resposta_do_filho = resposta_digitada;
    }
    
    instance_destroy(); 
}