function scr_anim_compile_maps() {
    // Chaves de direção que vamos suportar
    var keys = ["down","up","right_down","right_up","left_down","left_up"];

    // Estruturas de saída (guardam os ÍNDICES dos sprites)
    anim_idle_idx = {};
    anim_walk_idx = {};

    // Prepara uma lista de "fontes → rótulo → destino"
    var packs = [
        [anim_idle, "idle", anim_idle_idx],
        [anim_walk, "walk", anim_walk_idx]
    ];

    // Para cada pack (idle e walk)…
    for (var m = 0; m < array_length_1d(packs); m++) {
        var src_map = packs[m][0];   // struct com nomes (strings)
        var label   = packs[m][1];   // "idle" ou "walk"
        var dst_map = packs[m][2];   // struct onde salvamos os índices

        // Varre todas as direções
        for (var i = 0; i < array_length_1d(keys); i++) {
            var k     = keys[i];                               // "down", "up", etc.
            var name  = variable_struct_get(src_map, k);       // nome do sprite (string)
            var idx   = is_string(name) ? asset_get_index(name) : -1;

            if (idx == -1) {
                // Log amigável para você ajustar os nomes no Create
                if (debug_anim_log) {
                    show_debug_message("[ANIM/CONFIG] Sprite não encontrado (" + label + " -> " + string(k) + "): " + string(name));
                }
                // Fallback: tenta um idle_down se existir
                var fb = asset_get_index("spr_player_idle_down");
                idx = (fb != -1) ? fb : -1;
            }

            // Salva o índice resolvido para essa direção
            variable_struct_set(dst_map, k, idx);
        }
    }
}

