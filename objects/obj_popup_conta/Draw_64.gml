var gw = display_get_gui_width();
var gh = display_get_gui_height();

// Fundo escuro igual ao da Doutora
draw_set_color(c_black);
draw_set_alpha(0.8);
draw_rectangle(0, 0, gw, gh, false);

// Caixa central branca (um pouco maior para caber o enunciado)
draw_set_alpha(1.0);
var cx = gw / 2;
var cy = gh / 2;
draw_set_color(c_white);
draw_rectangle(cx - 220, cy - 110, cx + 220, cy + 110, false);
draw_set_color(c_black);
draw_rectangle(cx - 220, cy - 110, cx + 220, cy + 110, true);

draw_set_font(fnt_texto);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// --- O ENUNCIADO ---
draw_text(cx, cy - 45, "Se as 3 maçãs custam R$ 6\ne as 3 bananas custam R$ 3,\nqual é o valor total da compra?");

// --- A EXPRESSÃO NUMÉRICA ---
var texto_conta = "6 + 3 = ";

// Se não digitou nada, mostra os 3 pontinhos. Se digitou, mostra os números!
if (resposta_digitada == "") {
    texto_conta += "...";
} else {
    texto_conta += resposta_digitada;
}

draw_text(cx, cy + 30, texto_conta);

// Instrução para confirmar
draw_text(cx, cy + 80, "Pressione ENTER para confirmar");

// Reseta o alinhamento e a cor por segurança
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);