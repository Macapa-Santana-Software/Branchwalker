moveDir = 0;
moveSpd = 1.3;
xspd = 0;
yspd = 0;

//sprite control
centerYOffset = -5;
centerY = y + centerYOffset;

weaponOffsetDist = 4;
aimDir = 0;

//face = 0;
sprite[0] = spr_player_walk_down;
sprite[1] = spr_player_walk_left_down;
sprite[2] = spr_player_walk_left_up;
sprite[3] = spr_player_walk_right_down;
sprite[4] = spr_player_walk_right_up;
sprite[5] = spr_player_walk_up;

sprite[6] = spr_player_idle_down;
sprite[7] = spr_player_idle_left_down;
sprite[8] = spr_player_idle_left_up;
sprite[9] = spr_player_idle_right_down;
sprite[10] = spr_player_idle_right_up;
sprite[11] = spr_player_idle_up;


face = 0; // 0..5 (down, left_down, left_up, right_down, right_up, up)

// sprite padrão = idle_down (índice 6 no seu array)
sprite_index = sprite[6];
image_speed  = 0.12; // idle animando (ajuste se quiser parado: 0.0)
image_index  = 0;


// weapon info
	power_1 = obj_power_1

