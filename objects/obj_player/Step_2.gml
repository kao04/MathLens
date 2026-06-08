// --- SISTEMA DE CÂMERA SUAVE (LERP) ---

// 1. Pega o tamanho da lente que configuramos na Room
var cam_w = camera_get_view_width(view_camera[0]);
var cam_h = camera_get_view_height(view_camera[0]);

// 2. Calcula o alvo (para onde a câmera deve ir, centralizando no Leo)
var alvo_x = x - (cam_w / 2);
var alvo_y = y - (cam_h / 2);

// 3. Trava o alvo para a câmera não sair do mapa e mostrar o fundo escuro
alvo_x = clamp(alvo_x, 0, room_width - cam_w);
alvo_y = clamp(alvo_y, 0, room_height - cam_h);

// 4. Descobre onde a câmera está parada neste exato momento
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

// 5. A MÁGICA DO DELAY: Interpolação Linear (Lerp)
// O valor "0.1" significa que a câmera vai cobrir 10% da distância por frame.
// Quanto menor o número (ex: 0.05), mais solta e lenta a câmera fica.
cam_x = lerp(cam_x, alvo_x, 0.1);
cam_y = lerp(cam_y, alvo_y, 0.1);

// 6. Aplica a nova posição matemática à câmera real do jogo
camera_set_view_pos(view_camera[0], cam_x, cam_y);