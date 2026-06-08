// Varre o teclado para ver se o jogador pressionou qualquer número (de 0 a 9 ou Numpad)
var apertou_numero = false;
for (var i = 0; i <= 9; i++) {
    if (keyboard_check_pressed(ord(string(i))) || keyboard_check_pressed(vk_numpad0 + i)) {
        apertou_numero = true;
    }
}

// Se ele tentou digitar qualquer número, o jogo sabota e põe o número da doutora!
if (apertou_numero) {
    if (instance_exists(obj_doutora)) {
        resposta_digitada = obj_doutora.resposta_menino;
    }
}

// Apaga com o Backspace
if (keyboard_check_pressed(vk_backspace)) {
    resposta_digitada = "";
}

// ENTER AGORA FUNCIONA: Só deixa fechar se ele tiver tentado digitar algo antes
if (keyboard_check_pressed(vk_enter) && resposta_digitada != "") {
    instance_destroy(); 
}