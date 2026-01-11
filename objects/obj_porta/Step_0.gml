show_prompt = false;

if (estado == estado_fechada) {
    var p = instance_nearest(x, y, obj_player);
    if (p != noone) {
        if (point_distance(x, y, p.x, p.y) <= interaction_radius) {
            show_prompt = true;

            // --- PORTA NORMAL ---
            if (object_index == obj_porta) {
                if (keyboard_check_pressed(ord("R"))) {
                    estado = estado_metade;
                    sprite_index = spt_porta_metade;
                    alarm[0] = 15;
                    show_prompt = false;
                }
            }

            // --- PORTA DO SERVIDOR ---
            if (object_index == obj_porta_servidor) {

                if (!global.tem_cartao_acesso) {
                    prompt_text = "Cartão necessário";
                }
                else if (keyboard_check_pressed(ord("R"))) {
                    estado = estado_metade;
                    sprite_index = spt_porta_metade;
                    alarm[0] = 15;
                    show_prompt = false;
                }
            }
        }
    }
}





