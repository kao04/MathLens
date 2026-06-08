// Força o fundo escuro a ficar atrás das maçãs e das caixas!
depth = -10;
// Pega exatamente o centro da câmera na tela
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cam_w = camera_get_view_width(view_camera[0]);
var cam_h = camera_get_view_height(view_camera[0]);

var cx = cam_x + (cam_w / 2);
var cy = cam_y + (cam_h / 2);

// Cria as 3 caixas (usando depth para evitar erro)
instance_create_depth(cx - 80, cy, -50, obj_caixa_alvo);
instance_create_depth(cx,      cy, -50, obj_caixa_alvo);
instance_create_depth(cx + 80, cy, -50, obj_caixa_alvo);

// Cria 5 maçãs embaixo
instance_create_depth(cx - 120, cy + 100, -60, obj_maca_arrastavel);
instance_create_depth(cx - 60,  cy + 100, -60, obj_maca_arrastavel);
instance_create_depth(cx,       cy + 100, -60, obj_maca_arrastavel);
instance_create_depth(cx + 60,  cy + 100, -60, obj_maca_arrastavel);
instance_create_depth(cx + 120, cy + 100, -60, obj_maca_arrastavel);

erro_texto = "";
timer_erro = 0;