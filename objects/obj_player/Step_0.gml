// =====================================================
// 1. INPUT
// =====================================================
var _up    = keyboard_check(ord("W")) || keyboard_check(vk_up);
var _down  = keyboard_check(ord("S")) || keyboard_check(vk_down);
var _left  = keyboard_check(ord("A")) || keyboard_check(vk_left);
var _right = keyboard_check(ord("D")) || keyboard_check(vk_right);

x_input = _right - _left;
y_input = _down - _up;


// =====================================================
// 2. MOVIMENTO + NORMALIZAÇÃO
// =====================================================
if (x_input != 0 || y_input != 0) {

    var _dir = point_direction(0, 0, x_input, y_input);

    vel_x = lengthdir_x(move_speed, _dir);
    vel_y = lengthdir_y(move_speed, _dir);

    image_speed = 1;

    if (x_input != 0) {
        image_xscale = x_input;
    }

} else {
    vel_x = 0;
    vel_y = 0;
    image_speed = 0;
    image_index = 0;
}


// =====================================================
// 3. COLISÃO + MOVIMENTO (PIXEL PERFECT)
// =====================================================

// ---------------------
// COLISÃO X
// ---------------------
var col = noone;

// Checa parede
col = instance_place(x + vel_x, y, obj_parede);

// Se não for parede, checa porta
if (col == noone) {
    col = instance_place(x + vel_x, y, obj_porta);

    if (col != noone && col.estado != 0) {
        // Porta aberta ou metade → ignora colisão
        col = noone;
    }
}

if (col != noone) {
    while (!place_meeting(x + sign(vel_x), y, col.object_index)) {
        x += sign(vel_x);
    }
    vel_x = 0;
}

x += vel_x;


// ---------------------
// COLISÃO Y
// ---------------------
col = noone;

// Checa parede
col = instance_place(x, y + vel_y, obj_parede);

// Checa porta
if (col == noone) {
    col = instance_place(x, y + vel_y, obj_porta);

    if (col != noone && col.estado != 0) {
        col = noone;
    }
}

if (col != noone) {
    while (!place_meeting(x, y + sign(vel_y), col.object_index)) {
        y += sign(vel_y);
    }
    vel_y = 0;
}

y += vel_y;


// =====================================================
// 4. DEPTH (TOP-DOWN)
// =====================================================
depth = -y;