if (show_prompt) {

    // Fonte Resident Evil
    draw_set_font(fnt_resident);

    // Cor e alinhamento
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    // Posição: centro inferior da tela
    var tx = display_get_gui_width() * 0.5;
    var ty = display_get_gui_height() - 32;

    // Fundo discreto (opcional, estilo survival horror)
    draw_set_alpha(0.6);
    
    draw_set_alpha(1);

    // Texto
    draw_text(tx, ty, prompt_text);

    // Reset (boa prática)
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1);
}

