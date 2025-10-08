/// OBJ_TERMINAL - DRAW (WORLD-SPACE)
if (show_hint) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_color(c_white);
    var yy = y - sprite_get_bbox_top(sprite_index) - 12; // acima do sprite
    draw_text(x, yy, "[E] Interagir");
}
