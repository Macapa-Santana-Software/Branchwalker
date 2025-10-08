/// OBJ_TERMINAL - STEP

// 1) Verifica proximidade com o player
var p = instance_nearest(x, y, obj_player);
if (p != noone) {
    var dist = point_distance(x, y, p.x, p.y);
    show_hint = (!menu_open) && (dist <= interaction_radius);
} else {
    show_hint = false;
}

// 2) Abrir o menu
if (show_hint && keyboard_check_pressed(ord("E"))) {
    menu_open = true;
    sel = 0;
    global.ui_lock = true; // trava o player
}

// 3) Se o menu está aberto, navegar/selecionar
if (menu_open) {
    if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"))) {
        sel = (sel + 3 - 1) mod 3; // wrap left
    }
    if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"))) {
        sel = (sel + 1) mod 3;     // wrap right
    }

    // confirmar com E ou Enter
    if (keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_enter)) {
        // executa a “ação” escolhida (aqui só feedback; plugue no seu sistema depois)
        switch (sel) {
            case 0:
                toast_text = "Executado: git init";
                global.git_last_action = "init";
                break;
            case 1:
                toast_text = "Executado: git init -b main";
                global.git_last_action = "init_b_main";
                break;
            case 2:
                toast_text = "Executado: git init --bare";
                global.git_last_action = "init_bare";
                break;
        }
        toast_timer = 90; // ~1.5s
        menu_open = false;
        global.ui_lock = false;
    }

    // fechar com ESC
    if (keyboard_check_pressed(vk_escape)) {
        menu_open = false;
        global.ui_lock = false;
    }
}

// 4) Contagem do toast
if (toast_timer > 0) toast_timer--;
