// 1. Clicou em cima da maçã
if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) {
    arrastando = true;
    
    // Se ela já estava colada numa caixa, nós a "descolamos" para poder arrastar de novo
    if (colada) {
        colada = false;
        minha_caixa.ocupada = false;
        minha_caixa = noone;
    }
}

// 2. Soltou o clique
if (mouse_check_button_released(mb_left) && arrastando) {
    arrastando = false;
    
    // Procura se tem uma caixa debaixo da maçã
    var caixa = instance_place(x, y, obj_caixa_alvo);
    
    // Se achou uma caixa E ela estiver vazia, gruda nela!
    if (caixa != noone && caixa.ocupada == false) {
        x = caixa.x;
        y = caixa.y;
        colada = true;
        caixa.ocupada = true;
        minha_caixa = caixa;
    } else {
        // Se soltou no vazio, ela volta pro lugar inicial como um elástico
        x = x_inicial;
        y = y_inicial;
    }
}

// 3. Faz a maçã seguir o mouse enquanto estiver segurando o clique
if (arrastando) {
    x = mouse_x;
    y = mouse_y;
}