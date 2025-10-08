/// OBJ_TERMINAL - DRAW GUI (HUD/OVERLAY)
var gw = display_get_gui_width();
var gh = display_get_gui_height();

if (menu_open) {
    // backdrop
    draw_set_alpha(0.6);
    draw_set_color(c_black);
    draw_rectangle(0, 0, gw, gh, false);
    draw_set_alpha(1);

    // layout das cartas
    var margin = 32;
    var card_w = (gw - margin * 4) / 3;
    var card_h = gh * 0.42;
    var top    = gh * 0.28;

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    for (var i = 0; i < 3; i++) {
        var cx = margin + i * (card_w + margin);
        var cy = top;

        // cartão
        draw_set_color(make_color_rgb(24,24,28));
        draw_rectangle(cx, cy, cx + card_w, cy + card_h, false);

        // borda (destaca selecionado)
        draw_set_color(i == sel ? c_white : make_color_rgb(90,90,90));
        for (var b = 0; b < (i == sel ? 3 : 1); b++) {
            draw_rectangle(cx - b, cy - b, cx + card_w + b, cy + card_h + b, true);
        }

        // título
        draw_set_color(c_white);
        draw_text(cx + card_w * 0.5, cy + card_h * 0.25, card_title[i]);

        // descrição
        draw_set_valign(fa_top);
        draw_set_color(make_color_rgb(200,200,200));
        draw_text(cx + card_w * 0.5, cy + card_h * 0.40, card_desc[i]);
        draw_set_valign(fa_middle);
    }

    // instruções
    draw_set_color(make_color_rgb(210,210,210));
    draw_text(gw * 0.5, gh - 28, "[←/→] Navegar   [E/Enter] Selecionar   [Esc] Voltar");
}

// toast (aparece mesmo com menu fechado)
if (toast_timer > 0) {
    var tw = 380;
    var th = 34;
    var tx = gw * 0.5 - tw * 0.5;
    var ty = gh - 80;

    draw_set_color(make_color_rgb(0,0,0));
    draw_set_alpha(0.75);
    draw_rectangle(tx, ty, tx + tw, ty + th, false);
    draw_set_alpha(1);

    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(gw * 0.5, ty + th * 0.5, toast_text);
}
