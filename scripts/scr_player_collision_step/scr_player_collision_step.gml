function scr_player_collision_step() {
    /// Aplica vx, vy com colisão em tile layer "tl_collision" (invisível)

    // Lê hitbox do player (com fallback seguro)
    var _col_half_w = variable_instance_exists(id, "col_half_w")
        ? variable_instance_get(id, "col_half_w") : 6;
    var _col_half_h = variable_instance_exists(id, "col_half_h")
        ? variable_instance_get(id, "col_half_h") : 8;

    // Tilemap de colisão
    var _lyr = layer_get_id("tl_collision");
    if (_lyr == -1) { x += vx; y += vy; return; }
    var _tm = layer_tilemap_get_id(_lyr);

    // Helpers
    var _solid_at_pixel = function(px, py) {
        return tilemap_get_at_pixel(_tm, floor(px), floor(py)) != 0;
    };

    var _hits_at = function(nx, ny) {
        var l = nx - _col_half_w;
        var r = nx + _col_half_w - 1;
        var t = ny - _col_half_h;
        var b = ny + _col_half_h - 1;
        return  _solid_at_pixel(l, t) || _solid_at_pixel(l, b)
             || _solid_at_pixel(r, t) || _solid_at_pixel(r, b);
    };

    // ---------- Horizontal ----------
    {
        var _dir   = sign(vx);
        var _steps = abs(floor(vx));
        repeat (_steps) {
            if (_hits_at(x + _dir, y)) { vx = 0; break; }
            x += _dir;
        }
        var _rem = vx - _dir * _steps;   // parte fracionária
        if (_rem != 0) {
            if (!_hits_at(x + _rem, y)) x += _rem; else vx = 0;
        }
    }

    // ---------- Vertical ----------
    {
        var _dir   = sign(vy);
        var _steps = abs(floor(vy));
        repeat (_steps) {
            if (_hits_at(x, y + _dir)) { vy = 0; break; }
            y += _dir;
        }
        var _rem = vy - _dir * _steps;
        if (_rem != 0) {
            if (!_hits_at(x, y + _rem)) y += _rem; else vy = 0;
        }
    }

    // Limpeza de micro-drift
    if (abs(vx) < 0.001) vx = 0;
    if (abs(vy) < 0.001) vy = 0;
}
