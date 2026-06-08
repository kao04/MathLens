var cima = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
var baixo = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
var confirmar = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);

if (cima || baixo) {
    selecao = (selecao == 0) ? 1 : 0; // Alterna entre os 2 botões
}

if (confirmar) {
    if (selecao == 0) room_restart(); // Tenta o Boss de novo
    if (selecao == 1) room_goto(rm_menu); // Volta pro Menu Principal
}