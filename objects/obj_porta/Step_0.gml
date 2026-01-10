show_prompt = false;

if (estado == estado_fechada) {

    var p = instance_nearest(x, y, obj_player);

    if (p != noone) {

        if (point_distance(x, y, p.x, p.y) <= interaction_radius) {

            // TEXTO CORRETO
            if (trancada) {
                show_prompt = true;
                prompt_text = "Porta trancada";
            } else {
                show_prompt = true;
                prompt_text = "Aperte R para abrir a porta";
            }

            if (keyboard_check_pressed(ord("R"))) {

                // CASO 1: porta exige cartão
                if (exige_cartao) {

                    if (p.tem_cartao_servidor) {
                        trancada = false;
                    } else {
                        // Feedback negativo
                        prompt_text = "Cartao necessario";
                        exit;
                    }
                }

                // CASO 2: porta destrancada
                if (!trancada) {
                    estado = estado_metade;
                    sprite_index = spt_porta_metade;
                    alarm[0] = 15;
                    show_prompt = false;
                }
            }
        }
    }
}

