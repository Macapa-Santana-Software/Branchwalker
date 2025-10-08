function scr_player_anim_step() {
    // Estado de movimento
    var sx = sign(vx);
    var sy = sign(vy);
    var moving = (abs(vx) > 0.01) || (abs(vy) > 0.01);

    if (moving) {
        if (sy != 0) face_last_vert = sy;   // -1=up, 1=down
        if (sx != 0) face_last_horz = sx;   // -1=left, 1=right
    }

    // Direção alvo (6 vias)
    var dir_name = "down";
    if (sx == 0 && sy < 0)       dir_name = "up";
    else if (sx == 0 && sy > 0)  dir_name = "down";
    else if (sx > 0 && sy < 0)   dir_name = "right_up";
    else if (sx > 0 && sy > 0)   dir_name = "right_down";
    else if (sx < 0 && sy < 0)   dir_name = "left_up";
    else if (sx < 0 && sy > 0)   dir_name = "left_down";
    else if (sx > 0)             dir_name = (face_last_vert < 0) ? "right_up" : "right_down";
    else if (sx < 0)             dir_name = (face_last_vert < 0) ? "left_up"  : "left_down";
    else {
        if (face_last_horz > 0)  dir_name = (face_last_vert < 0) ? "right_up" : "right_down";
        else if (face_last_horz < 0) dir_name = (face_last_vert < 0) ? "left_up" : "left_down";
        else dir_name = (face_last_vert < 0) ? "up" : "down";
    }

    // Pega índice já compilado (super barato e confiável)
    var map_idx = moving ? anim_walk_idx : anim_idle_idx;
    var spr = variable_struct_get(map_idx, dir_name);

    // Se ainda assim vier -1, tenta fallbacks simples
    if (spr == -1) {
        var alt1 = ""; var alt2 = "";
        switch (dir_name) {
            case "down":       alt1 = "up"; break;
            case "up":         alt1 = "down"; break;
            case "right_down": alt1 = "right_up"; alt2 = "down"; break;
            case "right_up":   alt1 = "right_down"; alt2 = "up"; break;
            case "left_down":  alt1 = "left_up"; alt2 = "down"; break;
            case "left_up":    alt1 = "left_down"; alt2 = "up"; break;
        }
        if (alt1 != "") spr = variable_struct_get(map_idx, alt1);
        if (spr == -1 && alt2 != "") spr = variable_struct_get(map_idx, alt2);
    }

    // Aplica sprite/velocidade
    if (spr != -1) {
        if (sprite_index != spr) {
            sprite_index = spr;
            if (!moving) image_index = 0; // parado: fica no frame 0 (mude anim_speed_idle se quiser)
        }
        image_speed = moving ? anim_speed_walk : anim_speed_idle;
    } else {
        // Nada válido: mantém sprite atual e evita crash
        image_speed = moving ? anim_speed_walk : 0;
    }
}



