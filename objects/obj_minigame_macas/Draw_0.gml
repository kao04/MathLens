// 1. Pega a posição e o tamanho exato da câmera
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cam_w = camera_get_view_width(view_camera[0]);
var cam_h = camera_get_view_height(view_camera[0]);

var cx = cam_x + (cam_w / 2);
var cy = cam_y + (cam_h / 2);

// --- 2. ESCURECENDO O FUNDO ---
draw_set_color(c_black);
draw_set_alpha(0.8); // 80% de escuridão (ajuste se quiser mais claro ou mais escuro)
draw_rectangle(cam_x, cam_y, cam_x + cam_w, cam_y + cam_h, false);

// Reseta a transparência para o resto não ficar transparente
draw_set_alpha(1.0);
draw_set_color(c_white);

// --- 3. DESENHANDO O MINIGAME ---
draw_set_font(fnt_texto);
draw_set_halign(fa_center);

draw_text(cx, cy - 100, "Arraste as maçãs para as caixas:");
draw_sprite(spr_maca, 0, cx - 40, cy - 60);
draw_sprite(spr_maca, 0, cx - 10, cy - 60);
draw_text(cx + 15, cy - 60, "+");
draw_sprite(spr_maca, 0, cx + 40, cy - 60);
draw_text(cx + 70, cy - 60, "= ?");

// Mensagem de erro ou instrução
if (timer_erro > 0) {
    draw_set_color(c_red);
    draw_text(cx, cy + 160, erro_texto);
    draw_set_color(c_white); // Reseta a cor para branco
    timer_erro -= 1;
} else {
    draw_text(cx, cy + 160, "Pressione ENTER para confirmar");
}

// Reset final de segurança
draw_set_halign(fa_left);